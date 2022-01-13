# Getting Started
Example scripts for common analyses. We're starting this directory to keep track of example scripts we've made for new Goldberg Lab members-- please feel free to contribute anything that might be useful to future lab members.

## Duke Compute Cluster quick start
DCC user guide (lots of useful info here on how to get started): https://rc.duke.edu/dcc/dcc-user-guide/

To SHH onto the DCC: 
- ssh netid@dcc-login.oit.duke.edu
- Multifactor authentication is now required for all logins, on and off campus.  
- Your username/password is your NetID/password.

Important directories:
- /hpc/home/netID
-- This is your 10GB personal home directory
-There are a few shared directories where you can make your own “yourNetID/” subfolder (i.e., within each of these directories, please make yourself a "yourNetID/" directory (e.g., my work directory is /work/klk37/) and work within that directory. 
- /work
-- Use this as a temporary location for active analyses. 
-- This is ~500TB of unpartitioned space shared across all DCC users. This space is not backed up and files in /work are automatically deleted after 75 days.
- /hpc/group/goldberg
-- This is our lab directory, with 1TB of storage and 7 days of backups
- /datacommons/goldberg
-- This is our lab directory for archival storage.
-- Use this for storing important (not intermediate or temporary) files and scripts. This Datacommons directory is mounted to the cluster for easy access, but read/write won’t be as fast compared to /work or /hpc directories
- Raw data and scripts should always be saved to a secondary safe location, outside of the cluster.
- A good practice is to keep all scripts in an hpc/ or datacommons/ directory, and run all analyses in work/. By keeping active analyses and large intermediate files in work/, we prevent overflowing lab storage and interrupting each others’ jobs. Just remember to always keep a copy of raw data and the scripts needed to generate downstream files and output in a backed-up location.


## Public datasets:
- 1000 Genomes resequencing data can be accessed here: https://www.internationalgenome.org/data-portal/data-collection/30x-grch38 

## Software:
- plink v1.9 https://www.cog-genomics.org/plink/1.9/
- ADMIXTURE v1.3.0 https://dalexander.github.io/admixture/download.html
- R v3.6.1 https://www.r-project.org/

## Summaries/walkthroughs within this directory:
- [Prep1000G_MalariaProject_summary.md](./Prep1000G_MalariaProject_summary.md) written Oct 2020 to assist with looking at possible selection at malaria-interacting loci in 1000G admixed populations. contains some guidance basic PLINK commands and PCA/ADMIXTURE.
- [ADMIXTURE_allele-freq_combined.pdf](./ADMIXTURE_allele-freq_combined.pdf) written Oct 2020. Example walk-through for plotting ADMIXTURE results in R and comparing observed to expected allele frequencies.
- [Intro to Unix_Cluster Computing.pdf](./Intro%20to%20Unix_Cluster%20Computing.pdf) written Aug 2020. Notes for introduction to Unix/Terminal and the Duke Compute Cluster architecture.
- [SLiM_jobarray_example.pdf](./SLiM_jobarray_example.pdf) written March 2021. Notes on how to use job arrays to run and keep track of many SLiM simulations on the cluster.
