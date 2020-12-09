#!/bin/bash
#SBATCH --mem=20GB
#SBATCH -p scavenger

#Move to the directory you want to work in:
cd /work/klk37

#Provide an input file: a bed file with at least 1 admixed population and at least 2 source populations
IN=reseq1kg_pop_ref1_ref2.bed

#the number (called k) after the input is the number of ancestral populations believed to contribute to the admixed pop
#it's good to try a few different values of K and see how that changes the results.
#these commands use the installation of ADMIXTURE installed in my directory-- you can use that or update the path if you installed it yourself.
/datacommons/noor/klk37/CV/admixture_linux-1.3.0/admixture $IN 2
/datacommons/noor/klk37/CV/admixture_linux-1.3.0/admixture $IN 3
/datacommons/noor/klk37/CV/admixture_linux-1.3.0/admixture $IN 4
