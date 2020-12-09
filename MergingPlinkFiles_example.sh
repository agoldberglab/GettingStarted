#!/bin/bash
#SBATCH --mem=20GB

#change to the appropriate directory:
cd /work/klk37/1kG_reseq/

#name your output chromosomes
OUT=reseq1kG_allautosomes_GWD_IBS_09222020

#the --bfile in this command should be the name of the chromosome 1 plink file that you made in the previous step.
#notice that plink files come in sets (bed/bim/fam) look at the plink documentation and try to understand what's in each of these files.
#the autosomesMergeList.txt file should contain the reset of the chromosomes that you want to merge (just do autosomes, leave out the X for now)
# I put an example autosomesMergeList.txt file in this directory, but you'll need to edit it to suit your data.

# The command to use plink to merge the chromosomes for a population
/opt/apps/rhel7/plink-1.90/plink --bfile reseq1kG_chr1_107GWD_107IBS --merge-list autosomesMergeList-GWD_IBS.txt --allow-no-sex --make-bed --out $OUT

