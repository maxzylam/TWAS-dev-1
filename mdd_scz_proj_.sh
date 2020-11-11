##############################
### TWAS for MDD project 

    #############
    # EAS_MDD #

        #input 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_mdd \
                --sumstats=mdd-scz-eas.mtag.ldscmat_trait_1.txt.gz \
                --SNP=1 \
                --CHR=2 \
                --BP=3 \
                --A1=4 \
                --A2=5 \
                --FRQ=8 \
                --BETA=9 \
                --SE=10 \
                --PVAL=12 \
                --N=7 \
                --twasmode=input \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin

        #smrheidi
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_mdd \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/MDD_SZ_proj/EAS_MDD/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_MDD/smroutput

        #spredixcan 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_mdd \
                --twasmode=spredixcan \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models \
                --path2predixcov=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_MDD/spredixcanoutput \
                --path2gwasdir=/home/mlam/MDD_SZ_proj/EAS_MDD/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

        #focus
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_mdd \
                --twasmode=focus \
                --sumstats=/home/mlam/MDD_SZ_proj/EAS_MDD/focus/eas_mdd.focus.input.sumstats.gz \
                --referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink \
                --eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_MDD/focusoutput    
    #############



    #############
    # EAS_MDDx #

        #input 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_sz \
                --sumstats=mdd-scz-eur-eas-trait1-run1.mtag.xpopmat_trait_1.txt.gz \
                --SNP=1 \
                --CHR=2 \
                --BP=3 \
                --A1=4 \
                --A2=5 \
                --FRQ=8 \
                --BETA=9 \
                --SE=10 \
                --PVAL=12 \
                --N=7 \
                --twasmode=input \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin

        #smrheidi
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_mddx \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/MDD_SZ_proj/EAS_MDDx/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_MDDx/smroutput

        #spredixcan 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_mddx \
                --twasmode=spredixcan \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models \
                --path2predixcov=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_MDDx/spredixcanoutput \
                --path2gwasdir=/home/mlam/MDD_SZ_proj/EAS_MDDx/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

        #focus
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_mddx \
                --twasmode=focus \
                --sumstats=/home/mlam/MDD_SZ_proj/EAS_MDDx/focus/eas_mddx.focus.input.sumstats.gz \
                --referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink \
                --eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_MDDx/focusoutput    
    #############


    #############
    # EAS_SZ #

        #input 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_sz \
                --sumstats=mdd-scz-eas.mtag.ldscmat_trait_2.txt.gz \
                --SNP=1 \
                --CHR=2 \
                --BP=3 \
                --A1=4 \
                --A2=5 \
                --FRQ=8 \
                --BETA=9 \
                --SE=10 \
                --PVAL=12 \
                --N=7 \
                --twasmode=input \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin

        #smrheidi
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_sz \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/MDD_SZ_proj/EAS_SZ/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_SZ/smroutput

        #spredixcan 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_sz \
                --twasmode=spredixcan \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models \
                --path2predixcov=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_SZ/spredixcanoutput \
                --path2gwasdir=/home/mlam/MDD_SZ_proj/EAS_SZ/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

        #focus
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_sz \
                --twasmode=focus \
                --sumstats=/home/mlam/MDD_SZ_proj/EAS_SZ/focus/eas_sz.focus.input.sumstats.gz \
                --referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink \
                --eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_SZ/focusoutput    
    #############

    #############
    # EAS_SZx #

            #input 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_sz \
                --sumstats=mdd-scz-eur-eas-trait2-run1.mtag.xpopmat_trait_1.txt.gz \
                --SNP=1 \
                --CHR=2 \
                --BP=3 \
                --A1=4 \
                --A2=5 \
                --FRQ=8 \
                --BETA=9 \
                --SE=10 \
                --PVAL=12 \
                --N=7 \
                --twasmode=input \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin

        #smrheidi
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_szx \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/MDD_SZ_proj/EAS_SZx/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_SZx/smroutput

        #spredixcan 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_szx \
                --twasmode=spredixcan \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models \
                --path2predixcov=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_SZx/spredixcanoutput \
                --path2gwasdir=/home/mlam/MDD_SZ_proj/EAS_SZx/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

        #focus
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eas_szx \
                --twasmode=focus \
                --sumstats=/home/mlam/MDD_SZ_proj/EAS_SZx/focus/eas_szx.focus.input.sumstats.gz \
                --referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink \
                --eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin \
                --outputdir=/home/mlam/MDD_SZ_proj/EAS_SZx/focusoutput    
    #############

    #############
    # EUR_MDD #
        #smrheidi
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_mdd \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/MDD_SZ_proj/EUR_MDD/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_MDD/smroutput

        #spredixcan 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_mdd \
                --twasmode=spredixcan \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models \
                --path2predixcov=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_MDD/spredixcanoutput \
                --path2gwasdir=/home/mlam/MDD_SZ_proj/EUR_MDD/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

        #focus
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_mdd \
                --twasmode=focus \
                --sumstats=/home/mlam/MDD_SZ_proj/EUR_MDD/focus/eur_mdd.focus.input.sumstats.gz \
                --referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink \
                --eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_MDD/focusoutput    
    #############

    #############
    # EUR_MDDx #
        #smrheidi
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_mddx \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/MDD_SZ_proj/EUR_MDDx/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_MDDx/smroutput

        #spredixcan 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_mddx \
                --twasmode=spredixcan \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models \
                --path2predixcov=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_MDDx/spredixcanoutput \
                --path2gwasdir=/home/mlam/MDD_SZ_proj/EUR_MDDx/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

        #focus
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_mddx \
                --twasmode=focus \
                --sumstats=/home/mlam/MDD_SZ_proj/EUR_MDDx/focus/eur_mddx.focus.input.sumstats.gz \
                --referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink \
                --eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_MDDx/focusoutput    
    #############

    #############
    # EUR_SZ #
        #smrheidi
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_sz \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/MDD_SZ_proj/EUR_SZ/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_SZ/smroutput

        #spredixcan 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_sz \
                --twasmode=spredixcan \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models \
                --path2predixcov=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_SZ/spredixcanoutput \
                --path2gwasdir=/home/mlam/MDD_SZ_proj/EUR_SZ/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

        #focus
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_sz \
                --twasmode=focus \
                --sumstats=/home/mlam/MDD_SZ_proj/EUR_SZ/focus/eur_sz.focus.input.sumstats.gz \
                --referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink \
                --eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_SZ/focusoutput    
    #############

    #############
    # EUR_SZx #
        #smrheidi
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_szx \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/MDD_SZ_proj/EUR_SZx/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_SZx/smroutput

        #spredixcan 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_szx \
                --twasmode=spredixcan \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models \
                --path2predixcov=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_SZx/spredixcanoutput \
                --path2gwasdir=/home/mlam/MDD_SZ_proj/EUR_SZx/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

        #focus
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=eur_szx \
                --twasmode=focus \
                --sumstats=/home/mlam/MDD_SZ_proj/EUR_SZx/focus/eur_szx.focus.input.sumstats.gz \
                --referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink \
                --eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin \
                --outputdir=/home/mlam/MDD_SZ_proj/EUR_SZx/focusoutput    
    #############



/home/mlam/MDD_SZ_proj

