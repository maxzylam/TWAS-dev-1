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

