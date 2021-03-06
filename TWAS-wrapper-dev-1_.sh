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

    while [ "$1" != "" ];do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
            -h | --help)
                    helpscript
                    exit 1
                    ;;
            --sumstats)
                    sumstats=$VALUE 
                    ;;
            --output)
                    output=$VALUE 
                    ;;
            --inputdir)
                    inputdir=$VALUE 
                    ;;
            --outputdir)
                    outputdir=$VALUE 
                    ;;
            --eqtldir)
                    eqtldir=$VALUE 
                    ;;
            --eqtlfile)
                    eqtlfile=$VALUE 
                    ;;
            --referencedir)
                    referencedir=$VALUE
                    ;;
            --SNP)
                    SNP=$VALUE
                    ;;
            --CHR)
                    CHR=$VALUE
                    ;;
            --BP)
                    BP=$VALUE
                    ;;
            --A1)
                    A1=$VALUE
                    ;;
            --A2)
                    A2=$VALUE
                    ;;
            --FRQ)
                    FRQ=$VALUE 
                    ;;
            --BETA) 
                    BETA=$VALUE 
                    ;; 
            --SE)
                    SE=$VALUE 
                    ;;
            --PVAL)
                    PVAL=$VALUE 
                    ;;
            --N)
                    N=$VALUE 
                    ;;
            --processes)
                    processes=$VALUE 
                    ;;
            --owm)
                    owm=$VALUE 
                    ;;
            --twasmode)
                    twasmode=$VALUE
                    ;;
            --maf_filter)
                    maf_filter=$VALUE 
                    ;;
            --path2predixdb)
                    path2predixdb=$VALUE
                    ;;
            --path2gwasdir)
                    path2gwasdir=$VALUE 
                    ;;
            --path2ref)
                    path2ref=$VALUE
                    ;;
            --path2smr)
                    path2smr=$VALUE 
                    ;;
            --path2predixcan_env)
                    path2predixcan_env=$VALUE 
                    ;;
            --path2spredixcan)
                    path2spredixcan=$VALUE
                    ;;        
            --focus_env)
                    focus_env=$VALUE 
                    ;;
            --path2focus)
                    path2focus=$VALUE 
                    ;;
            $)
                    echo "ERROR:unknown parameter \ "$PARAM\ ""
                    helpscript
            esac
            shift
    done
################################################

################################################
### Process sumstats 
    if [ "$twasmode" == "input" ]; then 
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
                
                printf "\nProcessing Sumstats for TWAS analysis\n\n" 2>&1 | tee -a $output.twas.log
                if [ -z "$SNP" ]; then echo "SNP column not specified"; exit 1; else echo "     --SNP=$SNP"; fi 2>&1 | tee -a $output.twas.log
                if [ -z "$CHR" ]; then echo "CHR column not specified"; exit 1; else echo "     --CHR=$CHR"; fi 2>&1 | tee -a $output.twas.log 
                if [ -z "$BP" ]; then echo "BP column not specified"; exit 1; else echo "       --BP=$BP"; fi 2>&1 | tee -a $output.twas.log 
                if [ -z "$A1" ]; then echo "A1 column not specified"; exit 1; else echo "       --A1=$A1"; fi 2>&1 | tee -a $output.twas.log 
                if [ -z "$A2" ]; then echo "A2 column not specified"; exit 1; else echo "       --A2=$A2"; fi 2>&1 | tee -a $output.twas.log 
                if [ -z "$FRQ" ]; then echo "FRQ column not specified"; exit 1; else echo "     --FRQ=$FRQ"; fi 2>&1 | tee -a $output.twas.log
                if [ -z "$BETA" ]; then echo "BETA column not specified"; exit 1; else echo "       --BETA=$BETA"; fi 2>&1 | tee -a $output.twas.log
                if [ -z "$SE" ]; then echo "SE column not specified"; exit 1; else echo "       --SE=$SE"; fi 2>&1 | tee -a $output.twas.log
                if [ -z "$PVAL" ]; then echo "PVAL column not specified"; exit 1; else echo "       --PVAL=$PVAL"; fi 2>&1 | tee -a $output.twas.log
                if [ -z "$N" ]; then echo "N column not specified"; exit 1; else echo "     --N=$N"; fi 2>&1 | tee -a $output.twas.log
            
        # GCTA-COJO format for SMR-HEIDI

            # make folder for smr sumstats input 
            
            if [[ -d smrinput && -z "$owm" ]]; then 

                echo "found smrinput folder"
                echo " "
                echo "If you wish to overwrite the folder make sure overwrite mode is flagged --owm=Y"
                echo "exiting"

                exit 1
            fi    
            
            if [[ -d smrinput && "$owm" == "Y" ]]; then 

                echo "Overwrite Mode is Turned ON...."
                echo "Overwriting dir now....."

                rm -r  $(pwd)/smrinput
            
                mkdir $(pwd)/smrinput
            fi 

            if [ ! -d smrinput ]; then 
                
                echo "smrinput folder not found creating one now..."

                mkdir $(pwd)/smrinput

            fi

            # process sumstats 
            zcat $sumstats_1.gz | awk -v SNP=$SNP -v A1=$A1 -v A2=$A2 -v FRQ=$FRQ -v BETA=$BETA -v SE=$SE -v PVAL=$PVAL -v N=$N '{print $SNP, $A1, $A2, $FRQ, $BETA, $SE, $PVAL, $N}' | sed '1,1d' | sed '1 i\snp a1 a2 freq b se p n' > $output.gctacojo.input.txt && gzip $output.gctacojo.input.txt 

            # split to chr

            for i in {1..22}
                do 
                    zcat $sumstats_1.gz | awk -v chr=$i -v CHR=$CHR -v SNP=$SNP -v A1=$A1 -v A2=$A2 -v FRQ=$FRQ -v BETA=$BETA -v SE=$SE -v PVAL=$PVAL -v N=$N '{if($CHR==chr) print $SNP, $A1, $A2, $FRQ, $BETA, $SE, $PVAL, $N}' | sed '1 i\snp a1 a2 freq b se p n' > $(pwd)/smrinput/$output.gctacojo.input.chr"$i".txt

                    #gzip $(pwd)/smrinput/$output.gctacojo.input.chr"$i".txt

            done

                checkgctasumstats=$(ls $(pwd)/smrinput/$output.gctacojo.input.chr*.txt | wc | awk '{print $1}')

                    if [ "$checkgctasumstats" == 22 ]; then 

                        echo "GCTA summary statistics processed" 2>&1 | tee -a $output.twas.log

                    else 

                        echo "=========================================================================" 2>&1 | tee -a $output.twas.log
                        echo "A problem occurred processing GCTA sumstats - please check the input file" 2>&1 | tee -a $output.twas.log
                        echo "=========================================================================" 2>&1 | tee -a $output.twas.log

                        exit 1 

                    fi

        # S-Predixcan format

            # make folder for spredixcan inputq


            if [[ -d spredixcan && -z "$owm" ]]; then 

                echo "found spredixcan folder"
                echo " "
                echo "If you wish to overwrite the folder make sure overwrite mode is flagged --owm=Y"
                echo "exiting"

                exit 1
            fi    
            
            if [[ -d spredixcan && "$owm" == "Y" ]]; then 

                echo "Overwrite Mode is Turned ON...."
                echo "Overwriting dir now....."

                rm -r  $(pwd)/spredixcan
            
                mkdir $(pwd)/spredixcan

                for i in {1..22}
                    do 
                        mkdir $(pwd)/spredixcan/chr"$i"
                done 

            fi 

            if [ ! -d spredixcan ]; then 
                
                echo "spredixcan folder not found creating one now..."

                mkdir $(pwd)/spredixcan

                for i in {1..22}
                    do 
                        mkdir $(pwd)/spredixcan/chr"$i"
                done 

            fi

                
            
            zcat $sumstats_1.gz | awk -v SNP=$SNP -v CHR=$CHR -v BP=$BP -v A1=$A1 -v A2=$A2 -v BETA=$BETA -v PVAL=$PVAL '{print $SNP, $CHR, $BP, $A1, $A2, $BETA, $PVAL}' | sed '1,1d' | sed '1 i\SNP CHR BP A1 A2 BETA PVAL' > $output.spredixcan.input.txt && gzip $output.spredixcan.input.txt 

            # split to chr  

            for i in {1..22}
                do 
                    zcat $output.spredixcan.input.txt.gz | awk -v CHR=$i '{if($2==CHR) print $0}' | sed '1 i\SNP CHR BP A1 A2 BETA PVAL' > $(pwd)/spredixcan/chr"$i"/$output.spredixcan.input.chr"$i".txt 

                    gzip $(pwd)/spredixcan/chr"$i"/$output.spredixcan.input.chr"$i".txt 

            done 

                checkspredixcansumstats=$(ls $(pwd)/spredixcan/chr*/$output.spredixcan.input.chr*.txt.gz | wc | awk '{print $1}')

                    if [ "$checkspredixcansumstats" == 22 ]; then 

                        echo "SPredixcan summary statistics processed" 2>&1 | tee -a $output.twas.log 

                    else 

                        echo "==============================================================================" 2>&1 | tee -a $output.twas.log
                        echo "A problem occured processing Spredixcan sumstats - please check the input file" 2>&1 | tee -a $output.twas.log
                        echo "==============================================================================" 2>&1 | tee -a $output.twas.log

                        exit 1 
                    
                    fi
    

        # FOCUS format 

            # make folder for focus input


            if [[ -d focus && -z "$owm" ]]; then 

                echo "found focus folder"
                echo " "
                echo "If you wish to overwrite the folder make sure overwrite mode is flagged --owm=Y"
                echo "exiting"

                exit 1
            fi    
            
            if [[ -d focus && "$owm" == "Y" ]]; then 

                echo "Overwrite Mode is Turned ON...."
                echo "Overwriting dir now....."

                rm -r  $(pwd)/focus
            
                mkdir $(pwd)/focus
            fi 

            if [ ! -d focus ]; then 
                
                echo "spredixcan folder not found creating one now..."

                mkdir $(pwd)/focus

            fi

            zcat $sumstats_1.gz | awk -v SNP=$SNP -v CHR=$CHR -v BP=$BP -v A1=$A1 -v A2=$A2 -v FRQ=$FRQ -v BETA=$BETA -v PVAL=$PVAL -v N=$N '{print $SNP, $CHR, $BP, $A1, $A2, $FRQ, $BETA, $PVAL, $N}' | sed '1,1d' | sed '1 i\SNP CHR BP A1 A2 FRQ BETA PVAL N' > $output.focus.input.txt

            gzip $output.focus.input.txt

            $focus_env/python $path2focus/focus munge $output.focus.input.txt.gz --output $(pwd)/focus/$output.focus.input

                if [ -f $(pwd)/focus/$output.focus.input.sumstats.gz ]; then 

                    echo "FOCUS summary statistics processed" 2>&1 | tee -a $output.twas.log

                else 

                    echo "=========================================================================" 2>&1 | tee -a $output.twas.log
                    echo "A problem occured processing FOCUS sumstats - please check the input file" 2>&1 | tee -a $output.twas.log
                    echo "=========================================================================" 2>&1 | tee -a $output.twas.log
        
                    exit 1

                fi 
    fi
################################################

################################################
### Process SMR and HEIDI analysis
    
    if [ "$twasmode" == "smrheidi" ]; then
        
        processes=$(lscpu | sed -n '4,4p' | awk '{print $2}')

            if [[ -d smroutput && -z "$owm" ]]; then 

                echo "found smroutput folder"
                echo " "
                echo "If you wish to overwrite the folder make sure overwrite mode is flagged --owm=Y"
                echo "exiting"

                exit 1
            fi    
            
            if [[ -d smroutput && "$owm" == "Y" ]]; then 

                echo "Overwrite Mode is Turned ON...."
                echo "Overwriting dir now....."

                rm -r  $(pwd)/smroutput
            
                mkdir $(pwd)/smroutput
            fi 

            if [ ! -d smroutput ]; then 
                
                echo "smrinput folder not found creating one now..."

                mkdir $(pwd)/smroutput

            fi
    

        for i in {1..22}
            do ls $path2ref/*.bim | sed 's/.bim//g' | grep -e chr"$i"_ 
        done > genomeref.list 

        for i in {1..22}
            do ls $inputdir/*.txt | grep -w chr"$i" 
        done > smrsumstats.list

        for i in {1..22}
            do
                echo "$i" 
        done > $output.chr.list

        
        while read -u 3 -r genomeref && read -u 4 -r chr && read -u 5 -r smrsumstats
            do 
            
                echo "nohup $path2smr/smr_Linux --bfile $genomeref --gwas-summary $smrsumstats --beqtl-summary $eqtldir/$eqtlfile --maf $maf_filter --out $outputdir/$output.chr.$chr.smr.output &" 
            done 3< genomeref.list 4< $output.chr.list 5< smrsumstats.list > $output.smr.analysis_.sh
    fi

################################################

################################################
### Process Multi SNP SMR and HEIDI analysis
    
    if [ "$twasmode" == "msmrheidi" ]; then
        
        processes=$(lscpu | sed -n '4,4p' | awk '{print $2}')

            if [[ -d msmroutput && -z "$owm" ]]; then 

                echo "found smroutput folder"
                echo " "
                echo "If you wish to overwrite the folder make sure overwrite mode is flagged --owm=Y"
                echo "exiting"

                exit 1
            fi    
            
            if [[ -d msmroutput && "$owm" == "Y" ]]; then 

                echo "Overwrite Mode is Turned ON...."
                echo "Overwriting dir now....."

                rm -r  $(pwd)/msmroutput
            
                mkdir $(pwd)/msmroutput
            fi 

            if [ ! -d msmroutput ]; then 
                
                echo "msmrinput folder not found creating one now..."

                mkdir $(pwd)/msmroutput

            fi
    

        for i in {1..22}
            do ls $path2ref/*.bim | sed 's/.bim//g' | grep -e chr"$i"_ 
        done > genomeref.list 

        for i in {1..22}
            do ls $inputdir/*.txt | grep -w chr"$i" 
        done > msmrsumstats.list

        for i in {1..22}
            do
                echo "$i" 
        done > $output.chr.list

        
        while read -u 3 -r genomeref && read -u 4 -r chr && read -u 5 -r msmrsumstats
            do 
            
                echo "nohup $path2smr/smr_Linux --bfile $genomeref --gwas-summary $msmrsumstats --beqtl-summary $eqtldir/$eqtlfile --maf $maf_filter --out $outputdir/$output.chr.$chr.msmr.output --smr-multi --set-wind 500 &" 
            done 3< genomeref.list 4< $output.chr.list 5< msmrsumstats.list > $output.msmr.analysis_.sh
    fi
################################################

################################################
### Process SPredixcan 

    if [ "$twasmode" == "spredixcan" ]; then 
       
        # extract spredixcan scripts 
        
        ls $path2predixdb/*.db > $output.predixdb.list 
        ls $path2predixdb/*.txt.gz > $output.predixdb.cov.list
        ls -h $path2predixdb | grep db > $output.predixdb.names.list
        

            if [[ -d spredixcanoutput && -z "$owm" ]]; then 

                echo "found spredixcanoutput folder"
                echo " "
                echo "If you wish to overwrite the folder make sure overwrite mode is flagged --owm=Y"
                echo "exiting"

                exit 1
            fi    
            
            if [[ -d spredixcanoutput && "$owm" == "Y" ]]; then 

                echo "Overwrite Mode is Turned ON...."
                echo "Overwriting dir now....."

                rm -r  $(pwd)/spredixcanoutput
            
                mkdir $(pwd)/spredixcanoutput
            fi 

            if [ ! -d spredixcanoutput ]; then 
                
                echo "spredixcanoutput folder not found creating one now..."

                mkdir $(pwd)/spredixcanoutput

            fi
    
        for i in {1..22}
            do 
                while read -u 3 -r models && read -u 4 -r names && read -u 5 -r covmat
                    do 
                        echo "nohup $path2predixcan_env/python $path2spredixcan/SPrediXcan.py --model_db_path $models --covariance $covmat --gwas_folder $path2gwasdir/chr"$i" --gwas_file_pattern \".*gz\" --snp_column SNP --effect_allele_column A1 --non_effect_allele_column A2 --beta_column BETA --pvalue_column PVAL --output_file $outputdir/$output.chr"$i".$names.csv" 
                done 3< $output.predixdb.list 4< $output.predixdb.names.list 5< $output.predixdb.cov.list
        done > $output.spredixcan.analysis_.sh

        # split spredixcan jobs

            if [[ -d spredixcanjobs && -z "$owm" ]]; then 

                echo "found spredixcanjobs folder"
                echo " "
                echo "If you wish to overwrite the folder make sure overwrite mode is flagged --owm=Y"
                echo "exiting"

                exit 1
            fi    
            
            if [[ -d spredixcanjobs && "$owm" == "Y" ]]; then 

                echo "Overwrite Mode is Turned ON...."
                echo "Overwriting dir now....."

                rm -r  $(pwd)/spredixcanjobs
            
                mkdir $(pwd)/spredixcanjobs
            fi 

            if [ ! -d spredixcanjobs ]; then 
                
                echo "spredixcanjobs folder not found creating one now..."

                mkdir $(pwd)/spredixcanjobs

            fi


            totaljobs=$(wc $output.spredixcan.analysis_.sh | awk '{print $1}')
            

            for i in $(seq $totaljobs)
                do 
                    echo "cat $output.spredixcan.analysis_.sh | sed -n '"$i", "$i"p' > $(pwd)/spredixcanjobs/spredixcan_job"$i".sh"

            done > spredixcan.split.jobs.sh
            

    fi 
################################################

################################################
### Process FOCUS analysis

    if [ "$twasmode" = "focus" ]; then 

        for i in {1..22}
            do 
                ls $referencedir/*.bim | sed 's/.bim//g' | grep -w QC.$i
        done > $output.focusref.list

        for i in {1..22}
            do
                echo "$i" 
        done > $output.chr.list


            if [[ -d focusoutput && -z "$owm" ]]; then 

                echo "found focusoutput folder"
                echo " "
                echo "If you wish to overwrite the folder make sure overwrite mode is flagged --owm=Y"
                echo "exiting"

                exit 1
            fi    
            
            if [[ -d focusoutput && "$owm" == "Y" ]]; then 

                echo "Overwrite Mode is Turned ON...."
                echo "Overwriting dir now....."

                rm -r  $(pwd)/focusoutput
            
                mkdir $(pwd)/focusoutput
            fi 

            if [ ! -d focusoutput ]; then 
                
                echo "smrinput folder not found creating one now..."

                mkdir $(pwd)/focusoutput

            fi


        while read -u 3 -r reference && read -u 4 -r chr 
            do 
                echo "nohup $focus_env/python $path2focus/focus finemap $sumstats $reference $eqtlfile --chr "$chr" --out $outputdir/$output.focusout.chr"$chr" &"
        done 3< $output.focusref.list 4< $output.chr.list > $output.focus.analysis.sh
    fi

################################################


