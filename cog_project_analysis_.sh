###################################
### cognition project twas analysis 

    # input
        output=cog_mtag
        sumstats=cognition_mtag.1000G.EUR.ref.SumstatsQC.AF_0.005.INFO_0.3.AFB_0.15.results.finalqc.txt.gz
        SNP=4
        CHR=6
        BP=7
        A1=8
        A2=9
        FRQ=11
        BETA=14
        SE=15 
        PVAL=16
        N=17
        twasmode=input
        focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin
        path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin

    
    # SMR and HEIDI 
        output=cog_mtag
        twasmode=smrheidi
        path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi
        path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref
        inputdir=/home/mlam/gwas_cog_ncog/smrinput
        eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta
        eqtlfile=Brain-eMeta
        maf_filter=0.01
        outputdir=/home/mlam/gwas_cog_ncog/smroutput

    # SPREDIXCAN
        output=cog_mtag
        twasmode=spredixcan
        path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models
        path2predixcov=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz
        outputdir=/home/mlam/gwas_cog_ncog/spredixcanoutput
        path2gwasdir=/home/mlam/gwas_cog_ncog/spredixcan
        path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin
        path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

    # FOCUS 
        output=cog_mtag
        twasmode=focus
        sumstats=/home/mlam/gwas_cog_ncog/focus/cog_mtag.focus.input.sumstats.gz
        referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink
        eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db
        focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin
        path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin
        outputdir=/home/mlam/gwas_cog_ncog/focusoutputs