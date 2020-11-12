###################################
### cognition project twas analysis 

    ###############
    # Trial Rum #
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
            inputdir=/home/mlam/gwas_cog/smrinput
            eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta
            eqtlfile=Brain-eMeta
            maf_filter=0.01
            outputdir=/home/mlam/gwas_cog/smroutput

        # SPREDIXCAN
            output=cog_mtag
            twasmode=spredixcan
            path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models
            path2predixcov=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz
            outputdir=/home/mlam/gwas_cog/spredixcanoutput
            path2gwasdir=/home/mlam/gwas_cog/spredixcan
            path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin
            path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

        # FOCUS 
            output=cog_mtag
            twasmode=focus
            sumstats=/home/mlam/gwas_cog/focus/cog_mtag.focus.input.sumstats.gz
            referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink
            eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db
            focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin
            path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin
            outputdir=/home/mlam/gwas_cog/focusoutputs
    ###############
    
    #############
    # COGNITION #
        
        #input 
            
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=cog_mtag \
                --sumstats=cognition_mtag.1000G.EUR.ref.SumstatsQC.AF_0.005.INFO_0.3.AFB_0.15.results.finalqc.txt.gz \
                --SNP=4 \
                --CHR=6 \
                --BP=7 \
                --A1=8 \
                --A2=9 \
                --FRQ=11 \
                --BETA=14 \
                --SE=15 \
                --PVAL=16 \
                --N=17 \
                --twasmode=input \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin
        
        
        #smrheidi
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=cog_mtag \
                --owm=Y \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_cog/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_cog/smroutput

           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=cog_mtag \
                --owm=Y \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_cog/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/PsychENCODE_cis_eqtl_HCP100_summary \
                --eqtlfile=Gandal_PsychENCODE_eQTL_HCP100+gPCs20_QTLtools \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_cog/smroutput

           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=cog_mtag \
                --owm=Y \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_cog/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/PsychENCODE_cis_eqtl_PEER50_summary \
                --eqtlfile=DER-08a_hg19_eQTL.significant \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_cog/smroutput
        
        #msmr
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=cog_mtag \
                --owm=Y \
                --twasmode=msmrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_cog/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_cog/msmroutput

           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=cog_mtag \
                --owm=Y \
                --twasmode=msmrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_cog/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/PsychENCODE_cis_eqtl_HCP100_summary \
                --eqtlfile=Gandal_PsychENCODE_eQTL_HCP100+gPCs20_QTLtools \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_cog/msmroutput

           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=cog_mtag \
                --owm=Y \
                --twasmode=msmrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_cog/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/PsychENCODE_cis_eqtl_PEER50_summary \
                --eqtlfile=DER-08a_hg19_eQTL.significant \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_cog/msmroutput
        


        #spredixcan 


            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=cog_mtag \
                --owm=Y \
                --twasmode=spredixcan \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models \
                --outputdir=/home/mlam/gwas_cog/spredixcanoutput \
                --path2gwasdir=/home/mlam/gwas_cog/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=cog_mtag \
                --owm=Y \
                --twasmode=spredixcan \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models_splicing \
                --outputdir=/home/mlam/gwas_cog/spredixcanoutput \
                --path2gwasdir=/home/mlam/gwas_cog/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=cog_mtag \
                --owm=Y \
                --twasmode=spredixcan \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/cmc_models \
                --outputdir=/home/mlam/gwas_cog/spredixcanoutput \
                --path2gwasdir=/home/mlam/gwas_cog/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software


        #focus
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=cog_mtag \
                --twasmode=focus \
                --owm=Y \
                --sumstats=/home/mlam/gwas_cog/focus/cog_mtag.focus.input.sumstats.gz \
                --referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink \
                --eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin \
                --outputdir=/home/mlam/gwas_cog/focusoutput    
    #############
    
    #################
    # NON-COGNITION #

        #input 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=ncog_gsem \
                --sumstats=NonCog_aligned.txt.gz \
                --SNP=1 \
                --CHR=2 \
                --BP=3 \
                --A1=4 \
                --A2=5 \
                --FRQ=6 \
                --BETA=7 \
                --SE=9 \
                --PVAL=10 \
                --N=11 \
                --twasmode=input \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin

        #smrheidi
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=ncog_gsem \
                --owm=Y \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_ncog_v2/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_ncog_v2/smroutput

           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=ncog_gsem \
                --owm=Y \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_ncog_v2/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/PsychENCODE_cis_eqtl_HCP100_summary \
                --eqtlfile=Gandal_PsychENCODE_eQTL_HCP100+gPCs20_QTLtools \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_ncog_v2/smroutput

           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=ncog_gsem \
                --owm=Y \
                --twasmode=smrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_ncog_v2/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/PsychENCODE_cis_eqtl_PEER50_summary \
                --eqtlfile=DER-08a_hg19_eQTL.significant \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_ncog_v2/smroutput
        
        #msmr
           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=ncog_gsem \
                --owm=Y \
                --twasmode=msmrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_ncog_v2/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/Brain-eMeta \
                --eqtlfile=Brain-eMeta \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_ncog_v2/msmroutput

           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=ncog_gsem \
                --owm=Y \
                --twasmode=msmrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_ncog_v2/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/PsychENCODE_cis_eqtl_HCP100_summary \
                --eqtlfile=Gandal_PsychENCODE_eQTL_HCP100+gPCs20_QTLtools \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_ncog_v2/msmroutput

           bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=ncog_gsem \
                --owm=Y \
                --twasmode=msmrheidi \
                --path2smr=/home/mlam/bin/TWAS-dev-1/GCTA_smr_heidi \
                --path2ref=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/1000G_Ref/EUR_ref \
                --inputdir=/home/mlam/gwas_ncog_v2/smrinput \
                --eqtldir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/SMR/PsychENCODE_cis_eqtl_PEER50_summary \
                --eqtlfile=DER-08a_hg19_eQTL.significant \
                --maf_filter=0.01 \
                --outputdir=/home/mlam/gwas_ncog_v2/msmroutput


        #spredixcan 

            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=ncog_gsem \
                --twasmode=spredixcan \
                --owm=T \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models \
                --outputdir=/home/mlam/gwas_ncog_v2/spredixcanoutput \
                --path2gwasdir=/home/mlam/gwas_ncog_v2/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=ncog_gsem \
                --twasmode=spredixcan \
                --owm=T \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models_splicing \
                --outputdir=/home/mlam/gwas_ncog_v2/spredixcanoutput \
                --path2gwasdir=/home/mlam/gwas_ncog_v2/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=ncog_gsem \
                --twasmode=spredixcan \
                --owm=T \
                --path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/cmc_models \
                --outputdir=/home/mlam/gwas_ncog_v2/spredixcanoutput \
                --path2gwasdir=/home/mlam/gwas_ncog_v2/spredixcan \
                --path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin \
                --path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software
        
        
        #focus
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                --output=ncog_gsem \
                --twasmode=focus \
                --owm=Y \
                --sumstats=/home/mlam/gwas_ncog_v2/focus/ncog_gsem.focus.input.sumstats.gz \
                --referencedir=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/1000G_EUR_Phase3_plink \
                --eqtlfile=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/focus/focus.db \
                --focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin \
                --path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin \
                --outputdir=/home/mlam/gwas_ncog_v2/focusoutput    
    #################

        #test 

            # noncog version 1 
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                output=ncog_gsem 
                sumstats=NonCog_cogent_version_run1_sumstats.v2.N.txt.gz 
                SNP=1 
                CHR=2
                BP=3 
                A1=5 
                A2=6 
                FRQ=4 
                BETA=11 
                SE=12 
                PVAL=14 
                N=16 
                twasmode=input 
                focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin 
                path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin


            # noncog version 2
            bash /home/mlam/bin/TWAS-dev-1/TWAS-wrapper-dev-1_.sh \
                output=ncog_gsem 
                sumstats=NonCog_aligned.txt.gz 
                owm=Y
                SNP=1 
                CHR=2 
                BP=3 
                A1=4 
                A2=5 
                FRQ=6 
                BETA=7 
                SE=9 
                PVAL=10 
                N=11 
                twasmode=input 
                focus_env=/home/mlam/bin/anaconda3/envs/pyfocus/bin 
                path2focus=/home/mlam/bin/TWAS-dev-1/focus/bin

    #########################
### Plot scatter 

    R
    library("data.table")
    library("tidyverse")

    # load data 

        dat1 <- fread("mdd-scz-eur.mtag.gmmmat_trait_1.txt.gz")
        dat2 <- fread("mdd-scz-eur.mtag.ldscmat_trait_1.txt.gz")

    # Select crucial variables 

        dat1a <- dat1 %>% select(., SNP, gmmat_mtag_z = mtag_z)
        dat2a <- dat2 %>% select(., SNP, ldsc_mtag_z = mtag_z)

    # Join 

        dat3 <- full_join(dat1a, dat2a, by = "SNP")

    # plot 

        png("MTAG_comparison_Trait1.png",height=15,width=15,units="cm",res=400,pointsize=3)
            dat3 %>% ggplot(., aes(x=gmmat_mtag_z, y=ldsc_mtag_z)) + geom_point() + labs(title="GMM versus LDSC MTAG", x="GMM MTAG Z", y = "LDSC MTAG Z")
        dev.off() 

    # load data 

        dat1 <- fread("mdd-scz-eur.mtag.gmmmat_trait_2.txt.gz")
        dat2 <- fread("mdd-scz-eur.mtag.ldscmat_trait_2.txt.gz")

    # Select crucial variables 

        dat1a <- dat1 %>% select(., SNP, gmmat_mtag_z = mtag_z)
        dat2a <- dat2 %>% select(., SNP, ldsc_mtag_z = mtag_z)

    # Join 

        dat3 <- full_join(dat1a, dat2a, by = "SNP")

    # plot 

        png("MTAG_comparison_Trait2.png",height=15,width=15,units="cm",res=400,pointsize=3)
            dat3 %>% ggplot(., aes(x=gmmat_mtag_z, y=ldsc_mtag_z)) + geom_point() + labs(title="GMM versus LDSC MTAG", x="GMM MTAG Z", y = "LDSC MTAG Z")
        dev.off() 

#####
    library("data.table")
    library("tidyverse")

    # load data 

        dat1 <- fread("mdd-scz-eas.mtag.gmmmat_trait_1.txt.gz")
        dat2 <- fread("mdd-scz-eas.mtag.ldscmat_trait_1.txt.gz")

    # Select crucial variables 

        dat1a <- dat1 %>% select(., SNP, gmmat_mtag_z = mtag_z)
        dat2a <- dat2 %>% select(., SNP, ldsc_mtag_z = mtag_z)

    # Join 

        dat3 <- full_join(dat1a, dat2a, by = "SNP")

    # plot 

        png("MTAG_comparison_Trait1.png",height=15,width=15,units="cm",res=400,pointsize=3)
            dat3 %>% ggplot(., aes(x=gmmat_mtag_z, y=ldsc_mtag_z)) + geom_point() + labs(title="GMM versus LDSC MTAG", x="GMM MTAG Z", y = "LDSC MTAG Z")
        dev.off() 

    # load data 

        dat1 <- fread("mdd-scz-eas.mtag.gmmmat_trait_2.txt.gz")
        dat2 <- fread("mdd-scz-eas.mtag.ldscmat_trait_2.txt.gz")

    # Select crucial variables 

        dat1a <- dat1 %>% select(., SNP, gmmat_mtag_z = mtag_z)
        dat2a <- dat2 %>% select(., SNP, ldsc_mtag_z = mtag_z)

    # Join 

        dat3 <- full_join(dat1a, dat2a, by = "SNP")

    # plot 

        png("MTAG_comparison_Trait2.png",height=15,width=15,units="cm",res=400,pointsize=3)
            dat3 %>% ggplot(., aes(x=gmmat_mtag_z, y=ldsc_mtag_z)) + geom_point() + labs(title="GMM versus LDSC MTAG", x="GMM MTAG Z", y = "LDSC MTAG Z")
        dev.off() 
        
#######################################
## Check allele alignment between cognition and non-cognition

    # load modules 

        library("data.table")
        library("tidyverse")

    # load data 

        cog <- fread("cognition_mtag.1000G.EUR.ref.SumstatsQC.AF_0.005.INFO_0.3.AFB_0.15.results.finalqc.txt.gz")

        noncog <- fread("NonCog_cogent_version_run1_sumstats.v2.N.txt.gz")

    # Process non-cog 

        dat1_ncog <- noncog %>% select(., SNP, CHR, BP, MAF, A1ncog = A1, A2ncog = A2, BETA = est, SE, Z = Z_Estimate, P = Pval_Estimate, N)
 
    # Process cog 

        dat1_cog <- cog %>% select(., SNP = SNPref, A1cog = A1, A2cog = A2, F1ref, FRQcog = FRQ)

    # merge files 

        dat2_merged <- full_join(dat1_cog, dat1_ncog, by = "SNP")
        dat2a_merged <- na.omit(dat2_merged)

    # compute flipper var 

        dat2b_merged <- dat2a_merged %>% mutate(flipper = case_when(A1cog != A1ncog ~ -1, A1cog == A1ncog ~ 1))

    # Flip effect estimates 

        dat2b_merged <- dat2b_merged %>% mutate(BETAflip = BETA*flipper) %>% mutate(Zflip = Z*flipper)

    # Save master file 

        fwrite(dat2b_merged, file="NonCog_masterfile.gz", sep=" ", compress="gzip", na="NA", row.names=FALSE, quote=FALSE)

    # Save NonCog scenarios 

        # Scenario 1 - No Change - Original Non Cog 

            original <- dat2b_merged %>% select(., SNP, CHR, BP, A1 = A1ncog, A2 = A2ncog, BETA, SE, Z, P, N)

        # Scenario 2 - Change only allele alignment - Consistent with cog 

            AlleleFlip <- dat2b_merged %>% select(., SNP, CHR, BP, A1 = A1cog, A2 = A2cog, BETA, SE, Z, P, N)

        # Scenario 3 - Change allele alignment - flip effect sizes 

            AlleleEfxFlip <- dat2b_merged %>% select(., SNP, CHR, BP, A1 = A1cog, A2 = A2cog, BETA = BETAflip, SE, Z = Zflip, P, N)

        fwrite(original, file="NonCog_original.gz", sep=" ", compress="gzip", na="NA", row.names=FALSE, quote=FALSE)
        fwrite(AlleleFlip, file="NonCog_AlleleFlip.gz", sep=" ", compress="gzip", na="NA", row.names=FALSE, quote=FALSE)
        fwrite(AlleleEfxFlip, file="NonCog_AlleleEfxFlip.gz", sep=" ", compress="gzip", na="NA", row.names=FALSE, quote=FALSE)

    
##### 
    # LDSC for testing 

    while read sumstats 
        do 
            /home/mlm/bin/py-anaconda/anaconda2/envs/ldsc/bin/python /home/mlm/bin/ldsc/munge_sumstats.py --sumstats $sumstats.gz --info-min 0.3 --maf-min 0.005 --merge-alleles /home/mlm/cognition-ext-disk-1/ldsc_reference_files/w_hm3.snplist --snp SNP --N-col N --a1 A1 --a2 A2 --p P --signed-sumstats Z,0 --chunksize 500000 --out $sumstats.ldsc.munge
        done < sumstats.list

        /home/mlm/bin/py-anaconda/anaconda2/envs/ldsc/bin/python /home/mlm/bin/ldsc/munge_sumstats.py --sumstats schizophrenia_pgc3.hess.input.txt --merge-alleles /home/mlm/cognition-ext-disk-1/ldsc_reference_files/w_hm3.snplist --snp SNP --N-col N --a1 A1 --a2 A2 --p P --signed-sumstats Z,0 --chunksize 500000 --out schizophrenia.ldsc.munge

    /home/mlm/bin/py-anaconda/anaconda2/envs/ldsc/bin/python /home/mlm/bin/ldsc/ldsc.py \
        --rg schizophrenia.ldsc.munge.sumstats.gz,NonCog_AlleleEfxFlip.ldsc.munge.sumstats.gz,NonCog_AlleleFlip.ldsc.munge.sumstats.gz,NonCog_original.ldsc.munge.sumstats.gz \
        --ref-ld-chr /home/mlm/cognition-ext-disk-1/ldsc_reference_files/eur_w_ld_chr/ \
        --w-ld-chr /home/mlm/cognition-ext-disk-1/ldsc_reference_files/eur_w_ld_chr/ \
        --out check_ncog_globalrg


    /home/mlm/bin/py-anaconda/anaconda2/envs/ldsc/bin/python /home/mlm/bin/ldsc/munge_sumstats.py --sumstats education.txt --merge-alleles /home/mlm/cognition-ext-disk-1/ldsc_reference_files/w_hm3.snplist --snp SNP --N-col NSample --a1 A1 --a2 A2 --p P --signed-sumstats Z,0 --chunksize 500000 --out education.ldsc.munge

    /home/mlm/bin/py-anaconda/anaconda2/envs/ldsc/bin/python /home/mlm/bin/ldsc/ldsc.py \
        --rg education.ldsc.munge.sumstats.gz,NonCog_AlleleEfxFlip.ldsc.munge.sumstats.gz,NonCog_AlleleFlip.ldsc.munge.sumstats.gz,NonCog_original.ldsc.munge.sumstats.gz \
        --ref-ld-chr /home/mlm/cognition-ext-disk-1/ldsc_reference_files/eur_w_ld_chr/ \
        --w-ld-chr /home/mlm/cognition-ext-disk-1/ldsc_reference_files/eur_w_ld_chr/ \
        --out check_ncog_globalrg_v2

####
    # Test spredixcan 
            
                output=cog_mtag 
                owm=Y 
                twasmode=spredixcan 
                path2predixdb=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models 
                path2predixcov=/home/mlam/cognition-ext-disk-2/TWAS_Reference/Reference_files/predixcan/elastic_net_models/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz 
                outputdir=/home/mlam/gwas_cog/spredixcanoutput 
                path2gwasdir=/home/mlam/gwas_cog/spredixcan 
                path2predixcan_env=/home/mlam/bin/anaconda3/envs/imlabtools/bin 
                path2spredixcan=/home/mlam/bin/TWAS-dev-1/MetaXcan/software

####

    # Conslidate processed results 

        # mSMR brain emeta 

            # make header for regions 
                echo "chr start stop esembleid" > smr_gene_regions.txt
                echo "probeID ProbeChr Gene Probe_bp topSNP topSNP_chr topSNP_bp A1 A2 Freq b_GWAS se_GWAS p_GWAS b_eQTL se_eQTL p_eQTL b_SMR se_SMR p_SMR p_SMR_multi p_HEIDI nsnp_HEIDI" > smr_results.txt 

            prefix=cog_mtag

            for i in {1..22}
                do 

                    echo "cat $prefix.chr.$i.msmr.output.prbregion4msmr.list >> smr_gene_regions.txt"

                    echo "cat $prefix.chr.$i.msmr.output.msmr | awk '{print \$1,\$2,\$3,\$4,\$5,\$6,\$7,\$8,\$9,\$10,\$11,\$12,\$13,\$14,\$15,\$16,\$17,\$18,\$19,\$20,\$21,\$22}' | sed '1,1d' >> smr_results.txt"
            done > consolidate.smr.results.sh

            echo "paste -d ' ' smr_gene_regions.txt smr_results.txt > smr_consolidated_results.txt" >> consolidate.smr.results.sh

            bash consolidate.smr.results.sh

        
        # spredixcan  
            
            # make header 

                # cmc
                prefix=ncog_gsem
                
                echo "DLPFC_newMetax.db" > tissue.list

                while read tissue
                    do 
                        echo "CHR gene gene_name zscore effect_size pvalue var_g pred_perf_r2 pred_perf_pval pred_perf_qval n_snps_used n_snps_in_cov n_snps_in_model" > $prefix.$tissue.spredixcan.results.txt
                done < tissue.list

                for i in {1..22}
                    do 
                        while read tissue
                            do 
                                echo "cat $prefix.chr$i.$tissue.csv | tr ',' ' ' | sed '1,1d' | awk -v CHR=$i '{print CHR,\$1,\$2,\$3,\$4,\$5,\$6,\$7,\$8,\$9,\$10,\$11,\$12}' >> $prefix.$tissue.spredixcan.results.txt"
                        done < tissue.list
                done > consolidate.spredixcan.results.sh

                bash consolidate.spredixcan.results.sh

                # gtex8
                prefix=ncog_gsem
                    echo "en_Adipose_Subcutaneous.db
                    en_Adipose_Visceral_Omentum.db
                    en_Adrenal_Gland.db
                    en_Artery_Aorta.db
                    en_Artery_Coronary.db
                    en_Artery_Tibial.db
                    en_Brain_Amygdala.db
                    en_Brain_Anterior_cingulate_cortex_BA24.db
                    en_Brain_Caudate_basal_ganglia.db
                    en_Brain_Cerebellar_Hemisphere.db
                    en_Brain_Cerebellum.db
                    en_Brain_Cortex.db
                    en_Brain_Frontal_Cortex_BA9.db
                    en_Brain_Hippocampus.db
                    en_Brain_Hypothalamus.db
                    en_Brain_Nucleus_accumbens_basal_ganglia.db
                    en_Brain_Putamen_basal_ganglia.db
                    en_Brain_Spinal_cord_cervical_c-1.db
                    en_Brain_Substantia_nigra.db
                    en_Breast_Mammary_Tissue.db
                    en_Cells_Cultured_fibroblasts.db
                    en_Cells_EBV-transformed_lymphocytes.db
                    en_Colon_Sigmoid.db
                    en_Colon_Transverse.db
                    en_Esophagus_Gastroesophageal_Junction.db
                    en_Esophagus_Mucosa.db
                    en_Esophagus_Muscularis.db
                    en_Heart_Atrial_Appendage.db
                    en_Heart_Left_Ventricle.db
                    en_Kidney_Cortex.db
                    en_Liver.db
                    en_Lung.db
                    en_Minor_Salivary_Gland.db
                    en_Muscle_Skeletal.db
                    en_Nerve_Tibial.db
                    en_Ovary.db
                    en_Pancreas.db
                    en_Pituitary.db
                    en_Prostate.db
                    en_Skin_Not_Sun_Exposed_Suprapubic.db
                    en_Skin_Sun_Exposed_Lower_leg.db
                    en_Small_Intestine_Terminal_Ileum.db
                    en_Spleen.db
                    en_Stomach.db
                    en_Testis.db
                    en_Thyroid.db
                    en_Uterus.db
                    en_Vagina.db
                    en_Whole_Blood.db" > tissue.list

                while read tissue
                    do 
                        echo "CHR gene gene_name zscore effect_size pvalue var_g pred_perf_r2 pred_perf_pval pred_perf_qval n_snps_used n_snps_in_cov n_snps_in_model" > $prefix.$tissue.spredixcan.results.txt
                done < tissue.list

                for i in {1..22}
                    do 
                        while read tissue
                            do 
                                echo "cat $prefix.chr$i.$tissue.csv | tr ',' ' ' | sed '1,1d' | awk -v CHR=$i '{print CHR,\$1,\$2,\$3,\$4,\$5,\$6,\$7,\$8,\$9,\$10,\$11,\$12}' >> $prefix.$tissue.spredixcan.results.txt"
                        done < tissue.list
                done > consolidate.spredixcan.results.sh

                # gtex splicing 
                
                prefix=cog_mtag
                    echo "gtex_splicing_v8_eur_Adipose_Subcutaneous_signif.db
                    gtex_splicing_v8_eur_Adipose_Visceral_Omentum_signif.db
                    gtex_splicing_v8_eur_Adrenal_Gland_signif.db
                    gtex_splicing_v8_eur_Artery_Aorta_signif.db
                    gtex_splicing_v8_eur_Artery_Coronary_signif.db
                    gtex_splicing_v8_eur_Artery_Tibial_signif.db
                    gtex_splicing_v8_eur_Brain_Amygdala_signif.db
                    gtex_splicing_v8_eur_Brain_Anterior_cingulate_cortex_BA24_signif.db
                    gtex_splicing_v8_eur_Brain_Caudate_basal_ganglia_signif.db
                    gtex_splicing_v8_eur_Brain_Cerebellar_Hemisphere_signif.db
                    gtex_splicing_v8_eur_Brain_Cerebellum_signif.db
                    gtex_splicing_v8_eur_Brain_Cortex_signif.db
                    gtex_splicing_v8_eur_Brain_Frontal_Cortex_BA9_signif.db
                    gtex_splicing_v8_eur_Brain_Hippocampus_signif.db
                    gtex_splicing_v8_eur_Brain_Hypothalamus_signif.db
                    gtex_splicing_v8_eur_Brain_Nucleus_accumbens_basal_ganglia_signif.db
                    gtex_splicing_v8_eur_Brain_Putamen_basal_ganglia_signif.db
                    gtex_splicing_v8_eur_Brain_Spinal_cord_cervical_c-1_signif.db
                    gtex_splicing_v8_eur_Brain_Substantia_nigra_signif.db
                    gtex_splicing_v8_eur_Breast_Mammary_Tissue_signif.db
                    gtex_splicing_v8_eur_Cells_Cultured_fibroblasts_signif.db
                    gtex_splicing_v8_eur_Cells_EBV-transformed_lymphocytes_signif.db
                    gtex_splicing_v8_eur_Colon_Sigmoid_signif.db
                    gtex_splicing_v8_eur_Colon_Transverse_signif.db
                    gtex_splicing_v8_eur_Esophagus_Gastroesophageal_Junction_signif.db
                    gtex_splicing_v8_eur_Esophagus_Mucosa_signif.db
                    gtex_splicing_v8_eur_Esophagus_Muscularis_signif.db
                    gtex_splicing_v8_eur_Heart_Atrial_Appendage_signif.db
                    gtex_splicing_v8_eur_Heart_Left_Ventricle_signif.db
                    gtex_splicing_v8_eur_Kidney_Cortex_signif.db
                    gtex_splicing_v8_eur_Liver_signif.db
                    gtex_splicing_v8_eur_Lung_signif.db
                    gtex_splicing_v8_eur_Minor_Salivary_Gland_signif.db
                    gtex_splicing_v8_eur_Muscle_Skeletal_signif.db
                    gtex_splicing_v8_eur_Nerve_Tibial_signif.db
                    gtex_splicing_v8_eur_Ovary_signif.db
                    gtex_splicing_v8_eur_Pancreas_signif.db
                    gtex_splicing_v8_eur_Pituitary_signif.db
                    gtex_splicing_v8_eur_Prostate_signif.db
                    gtex_splicing_v8_eur_Skin_Not_Sun_Exposed_Suprapubic_signif.db
                    gtex_splicing_v8_eur_Skin_Sun_Exposed_Lower_leg_signif.db
                    gtex_splicing_v8_eur_Small_Intestine_Terminal_Ileum_signif.db
                    gtex_splicing_v8_eur_Spleen_signif.db
                    gtex_splicing_v8_eur_Stomach_signif.db
                    gtex_splicing_v8_eur_Testis_signif.db
                    gtex_splicing_v8_eur_Thyroid_signif.db
                    gtex_splicing_v8_eur_Uterus_signif.db
                    gtex_splicing_v8_eur_Vagina_signif.db
                    gtex_splicing_v8_eur_Whole_Blood_signif.db" > tissue.list

                while read tissue
                    do 
                        echo "CHR gene gene_name zscore effect_size pvalue var_g pred_perf_r2 pred_perf_pval pred_perf_qval n_snps_used n_snps_in_cov n_snps_in_model" > $prefix.$tissue.spredixcan.results.txt
                done < tissue.list

                for i in {1..22}
                    do 
                        while read tissue
                            do 
                                echo "cat $prefix.chr$i.$tissue.csv | tr ',' ' ' | sed '1,1d' | awk -v CHR=$i '{print CHR,\$1,\$2,\$3,\$4,\$5,\$6,\$7,\$8,\$9,\$10,\$11,\$12}' >> $prefix.$tissue.spredixcan.results.txt"
                        done < tissue.list
                done > consolidate.spredixcan.results.sh