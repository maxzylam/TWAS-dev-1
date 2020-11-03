#########################################################
##### TWAS wrapper - SMR/HEIDI, SPREDIXCAN, COLOC, FOCUS

    # The following scripts would carry out TWAS according to according to 
    # mainstream transcriptomic wide analysis 


    function helpscript {
        echo "The following wrapper script will generate scripts for SMR/HEIDI, SPREDIXCAN, COLOC, FOCUS"
        echo ""
        echo "The wrapper could be carried out as follows
        
        ./TWAS-wrapper-dev-1_.sh --flag=[options]"
    }
################################################

################################################
### Add parsers 
################################################

################################################
### Process sumstats 
    
    # Initiate logger 

        printf "\n##################################################\n##### TWAS WRAPPER - \n##################################################\n" 2>&1 | tee $output.twas.log
        printf "\n\nTWAS WRAPPER initiated by\n\nAnalyst Initials : $(id -u -n) \n\nPipeline initiated on $(date)\n" 2>&1 | tee -a $output.twas.log

    # Process input 

        # Check sumstats file 

            if [ ! -f "$sumstats" ]; then 
                echo "I can't find sumstats - exiting"
                exit 1
            fi

        # check if sumstats1 is gzipped 

            gzipped=$(echo $sumstats | grep gz | wc -l)

                if [ "$gzipped" -eq 1 ]; then 

                    echo "sumstats1 is gzipped....proceeding..."
                
                else 

                    gzip $sumstats

                    sumstats=$sumstats.gz
                fi 

        sumstats_1=$(echo $sumstats | sed 's/.gz//g')

        # Standardize sumstats input 
            
            printf "\nProcessing Sumstats for TWAS analysis\n\n" 2>&1 | tee -a $output.hess.log
            if [ -z "$SNP" ]; then echo "SNP column not specified"; exit 1; else echo "     --SNP=$SNP"; fi 2>&1 | tee -a $output.twas.log
            if [ -z "$CHR" ]; then echo "CHR column not specified"; exit 1; else echo "     --CHR=$CHR"; fi 2>&1 | tee -a $output.twas.log 
            if [ -z "$BP" ]; then echo "BP column not specified"; exit 1; else echo "       --BP=$BP"; fi 2>&1 | tee -a $output.twas.log 
            if [ -z "$A1" ]; then echo "A1 column not specified"; exit 1; else echo "       --A1=$A1"; fi 2>&1 | tee -a $output.twas.log 
            if [ -z "$A2" ]; then echo "A2 column not specified"; exit 1; else echo "       --A2=$A2"; fi 2>&1 | tee -a $output.twas.log 
            if [ -z "$FRQ" ]; then echo "FRQ column not specified"; exit 1; else echo "     --FRQ=$FRQ"; fi 2>&1 | tee -a $output.twas.log
            if [ -z "$BETA" ]; then echo "BETA column not specified"; exit 1; else echo "       --BETA=$BETA"; fi 2>&1 | tee -a $output.twas.log
            if [ -z "$SE" ]; then echo "SE column not specified"; exit 1; else echo "       --SE=$SE"; fi 2>&1 | tee -a $output.twas.log
            if [ -z "$Zscore" ]; then echo "Zscore column not specified"; exit 1; else echo "       --Zscore=$Zscore"; fi 2>&1 | tee -a $output.twas.log
            if [ -z "$PVAL" ]; then echo "PVAL column not specified"; exit 1; else echo "       --PVAL=$PVAL"; fi 2>&1 | tee -a $output.twas.log
            if [ -z "$N" ]; then echo "N column not specified"; exit 1; else echo "     --N=$N"; fi 2>&1 | tee -a $output.twas.log
        
    # GCTA-COJO format for SMR-HEIDI

        zcat $sumstats_1.gz | awk -v SNP=$SNP -v A1=$A1 -v A2=$A2 -v FRQ=$FRQ -v BETA=$BETA -v SE=$SE -v PVAL=$PVAL -v N=$N '{print $SNP, $A1, $A2, $FRQ, $BETA, $SE, $PVAL, $N}' | sed '1,1d' | sed '1 i\SNP A1 A2 freq b se p N' > $output.gctacojo.input.txt && gzip $output.gctacojo.input.txt 

        # split to chr

        for i in {1..22}
            do 
                zcat $output.gctacojo.input.txt.gz | awk -v CHR=$i '{if($2==CHR) print $0}' | sed '1 i\SNP A1 A2 freq b se p N' > $output.gctacojo.input.chr"$i".txt

                gzip $output.gctacojo.input.chr"$i".txt

        done

            checkgctasumstats=$(ls $output.gctacojo.input.chr*.txt.gz | wc | awk '{print $1}')

                if [ "$checkgctasumstats" == 22 ]; then 

                    echo "GCTA summary statistics processed" 2>&1 | tee -a $output.twas.log

                else 

                    echo "=========================================================================" 2>&1 | tee -a $output.twas.log
                    echo "A problem occurred processing GCTA sumstats - please check the input file" 2>&1 | tee -a $output.twas.log
                    echo "=========================================================================" 2>&1 | tee -a $output.twas.log

                    exit 1 

                fi

    # S-Predixcan format

           zcat $sumstats_1.gz | awk -v SNP=$SNP -v CHR=$CHR -v BP=$BP -v A1=$A1 -v A2=$A2 -v BETA=$BETA -v PVAL=$PVAL '{print $SNP, $CHR, $BP, $A1, $A2, $BETA, $PVAL}' > $output.spredixcan.input.txt && gzip $output.spredixcan.input.txt 

        # split to chr  

        for i in {1..22}
            do 
                zcat $output.spredixcam.input.txt.gz | awk -v CHR=$i '{if($2==CHR) print $0}' | sed '1 i\SNP CHR BP A1 A2 FRQ BETA PVAL' > $output.spredixcan.input.chr"$i".txt 

                gzip $output.spredixcan.input.chr"$i".txt 

        done 

            checkspredixcansumstats=$(ls $output.spredixcan.input.chr*.txt.gz | wc | awk '{print $1}')

                if [ "$checkspredixcansumstats" == 22 ]; then 

                    echo "SPredixcan summary statistics processed" 2>&1 | tee -a $output.twas.log 

                else 

                    echo "==============================================================================" 2>&1 | tee -a $output.twas.log
                    echo "A problem occured processing Spredixcan sumstats - please check the input file" 2>&1 | tee -a $output.twas.log
                    echo "==============================================================================" 2>&1 | tee -a $output.twas.log

                    exit 1 
                
                fi

    # FOCUS format 

        zcat $sumstats_1.gz | awk -v SNP=$SNP -v CHR=$CHR -v BP=$BP -v A1=$A1 -v A2=$A2 -v BETA=$BETA -v PVAL=$PVAL '{print $SNP, $CHR, $BP, $A1, $A2, $BETA, $PVAL}' | sed '1 i\SNP CHR BP A1 A2 FRQ BETA PVAL' > $output.focus.input.txt

        gzip $output.focus.input.txt

        $focus_env/python $path2focus/focus munge $output.focus.input.txt --output $output.focus.input

            if [ -f $output.focus.input.sumstats.gz ]; then 

                echo "FOCUS summary statistics processed" 2>&1 | tee -a $output.twas.log

            else 

                echo "=========================================================================" 2>&1 | tee -a $output.twas.log
                echo "A problem occured processing FOCUS sumstats - please check the input file" 2>&1 | tee -a $output.twas.log
                echo "=========================================================================" 2>&1 | tee -a $output.twas.log
    
                exit 1

            fi 

################################################

################################################
### Process SMR and HEIDI analysis
    
    if [ "$twasmode" == "smrheidi" ]; then
        
        processes=$(lscpu | sed -n '4,4p' | awk '{print $2}')
        ls $path2ref/*.bim | sed 's/*.bim//g' > genomeref.list 

            $path2smr/smr_Linux --bfile $path2ref/mydata --gwas-summary $output.gctacojo.input.chr"$i".txt --beqtl-summary myeqtl --maf $maf --out mysmr --thread-num $processes 

################################################

################################################
### Process SPredixcan 

    if [ "$twasmode" == "spredixcan" ]; then 
       
        # extract spredixcan scripts 
        
        ls $path2oredixdb/*.db > $output.$path2predixdb.list 

        while read p
            do 
                echo "$path2predixcan_env/python $path2spredixcan/SPrediXcan.py --model_db_path $path2oredixdb/$p --covariance $path2oredixdb/$path2predixcov --gwas_folder $path2gwas/GWAS/ --gwas_file_pattern ".*gz" --snp_column SNP --effect_allele_column A1 --non_effect_allele_column A2 --beta_column BETA --pvalue_column P --output_file $outputdir/$output.$p.csv" > $output.$p.spredixcan.sh
        done < $output.$path2predixdb.list 

        chmod +x *.spredixcan.sh

    fi 
################################################

################################################
### 

################################################