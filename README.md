# TWAS-dev-1 : Transcriptome wide analysis

## *The following TWAS methods/software are covered in the lecture 'Transcriptome Wide Analysis – An Introduction' by Max Lam, PhD and Tian Ge, PhD.* 
<br>
<br>

## 1. S-Predixcan
## 2. SMR / Heidi - Summary Statistics Mendelian Randomization
## 3. COLOC - Colocalization analysis 
## 4. FOCUS - TWAS finemapping
<br>
<br>

## **Introduction** 

<br>
Setting up the TWAS environment for analysis. The intial part of this README file would show you how to set up the various modules and get them running. Because these moduels have all have their own dependencies, and git hub repos, it might sometimes be overwhelming for new users wanting to get on board TWAS type analysis with their GWAS summary data (which is easily obtainable these days). We will try our best to give a step by step overview to get started on TWAS analysis. 

<br>
<br>
<br>

The OS of choice for the environment is Linux (Actually, many of the dependencies wouldn't work with other operating systems). Users could choose Ubuntu if they are setting up their own Linux box for use. Some users would have access to compute clusters in their home institutions. Cloud based solutions are probably cost effective solutions that would allow users to scale their work quickly. In this introduction we would be using a Google Cloud Virtual Machine for the working exmaples. We would not cover how to set up the Virtual Machine in this tutorial - https://cloud.google.com/compute/docs/instances/create-start-instance gives a good introduction to that. However, if you've got your own Linux laptop/CPU or access to a compute cluster the steps are going to be largely similar. 
<br>

## **Software set up**

<br>

First things first - getting R Statistics and Python 3 up and running on your OS
<br>
```
        sudo apt update
        sudo apt upgrade -y
        sudo apt install -y dirmngr apt-transport-https ca-certificates software-properties-common gnupg2
        sudo apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF'
        sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/debian stretch-cran35/'
        sudo apt update
        sudo apt upgrade -y 
        sudo apt install -y r-base r-base-dev
        sudo apt install libcurl4-openssl-dev
        sudo apt install libssl-dev
        sudo apt install libxml2-dev 
        sudo apt update
        sudo apt upgrade -y 
```
<br>

Run those code one line at a time. Don't be tempted to run them in a whole chunk. One line at a time and wait for the code to complete before proceeding to the next line. **NOTE**: Depending on the OS that is on your machine, make sure the R certificates are right. R certificates for different flavors of LINUX are at https://cloud.r-project.org/bin/linux/. If the OS that you are using is not debian, you've got to copy the right ones and substitute it. 

<br>

Then install git on the OS so that the TWAS repo could be cloned into the working environment 

```
sudo apt install git 

    git config --global user.name "johndoe"
    git config --global user.email john@youremaildomain.org
```

Next, download the python installation file from the following location - We recommend using Anconda3 since it offers a little more control over the python environments that we will be creating for the various TWAS software. 

```
    wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh

    bash Anaconda3-2020.07-Linux-x86_64.sh
```

There will be a series of prompts once the installation script is activated 

```
Do you accept the license terms? [yes|no]

[no] >>> yes 

Anaconda3 will now be installed into this location:
/home/mlam/anaconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/mlam/anaconda3] >>> /home/mlam/bin/anaconda3
```
Next, let's get R working 

```
R 

    # General modules that would help with data processing
    install.packages("data.table")
    install.packages("R.utils")
    install.packages("dplyr")
    install.packages("ggplot2")
    install.packages("qqman")
    install.packages("CMplot")
    install.packages("tidyverse")

    # coloc - dependencies
    if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

    BiocManager::install("snpStats")
    install.packages("coloc")
```

Based on the codes above, we have set up R with i) general dependencies e.g. tidyverse that would help a lot with downstream data processing ii) We also downloaded the dependencies for coloc and coloc itself.  

After we have the Python and R software set up  - we want to get the various software into a single repo. We have already done this for you. And you would be able to get the repo on github. Go ahead and download the repo. The git in your environment would have been set up in the earlier step. 

```
git clone https://github.com/maxzylam/TWAS-dev-1.git
git submodule update --init --recursive
```

Set up the MetaXcan environment.
<br>

If you were following the instructions above, there might be a necessity to close the terminal and reboot for changes to take place prior to running the conda command. 
```
conda env create --file metaxcan_python_env.yml
```
<br>
Set up FOCUS finemapping environment

```
conda env create --file pyfocus_python_env.yml

    conda activate pyfocus

    cd focus/

    python setup.py install

    pip install dataclasses
```
Note: Just briefly describing what is going on for the FOCUS installation. The original github repo does not prompt the user to set up a conda environment. That might be a problem especially if the user is not really setting this environment up from scratch and there are already some depdencies in there. By running the installation script provided in the FOCUS repo, users might end up messing up their current environment dependencies. Or the FOCUS dependencies would simply not install. 

So, what we are doing here, is to first create an environment for FOCUS using an environment file. Once the environment is set up we could then get into the focus folder and run the installation script. During the process, we also realized that the dataclasses module could not be installed in the script provided, hence a separate command is called to install the dataclasses module. 

## **Download Reference Files**

We have put together a script that would download various reference databases/annotations that would allow the user to run TWAS using the various methods covered in this tutorial. 

```
# Make Reference Files Folder 

    mkdir Reference_files 

    cd Reference_files 

# 1000 genomes reference panel

    mkdir 1000G_Ref

    cd 1000G_Ref

    mkdir EAS_ref
    cd EAS_ref

    for i in {1..22}
        do 
            wget https://personal.broadinstitute.org/hhuang//public//cafmap-reffiles-eas-1/ALL_v5a.20130502.chr"$i"_1KG_0517.impute.plink.EAS.bed
            wget https://personal.broadinstitute.org/hhuang//public//cafmap-reffiles-eas-1/ALL_v5a.20130502.chr"$i"_1KG_0517.impute.plink.EAS.bim
            wget https://personal.broadinstitute.org/hhuang//public//cafmap-reffiles-eas-1/ALL_v5a.20130502.chr"$i"_1KG_0517.impute.plink.EAS.fam
    done 

    cd ..

    mkdir EUR_ref
    cd EUR_ref

    for i in {1..22}
        do 
            wget https://personal.broadinstitute.org/hhuang//public//cafmap-reffiles-eur-1/ALL_v5a.20130502.chr"$i"_1KG_0517.impute.plink.EUR.bed
            wget https://personal.broadinstitute.org/hhuang//public//cafmap-reffiles-eur-1/ALL_v5a.20130502.chr"$i"_1KG_0517.impute.plink.EUR.bim
            wget https://personal.broadinstitute.org/hhuang//public//cafmap-reffiles-eur-1/ALL_v5a.20130502.chr"$i"_1KG_0517.impute.plink.EUR.fam
    done 

# predixcan

    mkdir predixcan

    cd predixcan

    # GTEx v8
    wget https://zenodo.org/record/3519321/files/elastic_net_eqtl.tar
    wget https://zenodo.org/record/3519321/files/elastic_net_sqtl.tar
    wget https://zenodo.org/record/3519321/files/gtex_v8_expression_elastic_net_snp_smultixcan_covariance.txt.gz
    wget https://zenodo.org/record/3519321/files/gtex_v8_splicing_elastic_net_snp_smultixcan_covariance.txt.gz
    

    # CMC DLPFC
    wget https://www.dropbox.com/s/galqr91qc66kdr4/DLPFC.cov.txt.gz
    wget https://github.com/laurahuckins/CMC_DLPFC_prediXcan/blob/master/DLPFC_newMetax.db.tar.gz

    cd ..

# SMR

    mkdir SMR

    cd SMR

    # CAGE eQTL summary data [Blood eQTL]
    # CAGE eQTL summary data (n = 2765; Luke R. Lloyd-Jones et al. 2017 AJHG) in SMR binary (BESD) format:
    wget https://cnsgenomics.com/data/SMR/cage_eqtl_data_hg19.tgz


    # GTEx v7 [Large file]
    # V7 release of the GTEx eQTL summary data (n = 80 - 491; GTEx Consortium 2017 Nature) in SMR binary (BESD) format
    wget https://cnsgenomics.com/data/SMR/GTEx_V7_cis_eqtl_summary.tar.gz

    # Brain-eMeta eQTL data (estimated effective n = 1194)
    wget https://cnsgenomics.com/data/SMR/Brain-eMeta.tar.gz

    # PsychENCODE eQTL summary data
    # PsychENCODE project (n = 1387). Only the data of SNPs in a 1 Mb window around each gene are available.
    wget http://cnsgenomics.com/data/SMR/PsychENCODE_cis_eqtl_PEER50_summary.tar.gz
    wget http://cnsgenomics.com/data/SMR/PsychENCODE_cis_eqtl_HCP100_summary.tar.gz

    cd ..

# FOCUS 

    mkdir focus 

    cd focus 

    wget https://data.broadinstitute.org/alkesgroup/LDSCORE/1000G_Phase3_plinkfiles.tgz
    tar -xvzf 1000G_Phase3_plinkfiles.tgz

    wget https://www.dropbox.com/s/ep3dzlqnp7p8e5j/focus.db

    cd ..
```

**Example script for Spredixcan**
```
$path2predixcan_env $path2spredixcan/SPrediXcan.py \
--model_db_path data/DGN-WB_0.5.db \
--covariance data/covariance.DGN-WB_0.5.txt.gz \
--gwas_folder data/GWAS \
--gwas_file_pattern ".*gz" \
--snp_column SNP \
--effect_allele_column A1 \
--non_effect_allele_column A2 \
--beta_column BETA \
--pvalue_column P \
--output_file results/test.csv
```

**Example script for SMR**
```
$path2smr/smr \
--bfile mydata \
--gwas-summary mygwas.ma \
--beqtl-summary myeqtl \
--out mysmr \
--thread-num 10 
```

If you need access to reference panel plink files you may download them from here: 
https://personal.broadinstitute.org/hhuang//public//cafmap-reffiles-eur-1/
https://personal.broadinstitute.org/hhuang//public//cafmap-reffiles-eas-1/

**Example script for FOCUS**
```
focus finemap LDL_2010.clean.sumstats.gz 1000G.EUR.QC.1 gtex_v7.db --chr 1 --tissue adipose --out LDL_2010.chr1
```