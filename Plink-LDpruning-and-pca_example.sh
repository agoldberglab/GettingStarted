#!/bin/bash
#SBATCH --mem=10GB

#change to the appropriate directory:
cd /work/klk37/

#Change FILE to reflect the *.bed file that you want to prune and run PCA on:
FILE=GWD_IBS.bed
	
#This command uses the unix tool "awk" to grab just the name part of the input file (without the .bed extension):
NAME="$(echo ${FILE} | awk -F'[.]' '{print $1}')"
echo="pruning $NAME"
#Use the name we just grabbed to name a new file for the pruned output
PRUNED="$NAME"_pruned

#Prune for linkage disequilibrium:
/opt/apps/rhel7/plink-1.90/plink --bfile $NAME --indep-pairwise 50 10 0.5 --out $PRUNED
	
#Use the output of the command above to extract the pruned set of SNPs:
IN="$PRUNED".prune.in
/opt/apps/rhel7/plink-1.90/plink --bfile $NAME --extract $IN --make-bed --out $PRUNED
	
#Now run PCA:
/opt/apps/rhel7/plink-1.90/plink --bfile $PRUNED --pca --out "$PRUNED"_pca

