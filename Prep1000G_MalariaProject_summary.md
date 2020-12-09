### Written Oct 2020 to assist with looking as possible selection at malaria-interacting loci in 1000G admixed populations

**Summary of where we are and what we’re doing next. (Shae, you’ve already done steps 1-4).**
1. Download 1000G files
2. Pull out samples for each population of interest
3. Convert VCFs to plink bed/bim/fam format.
4. Merge autosomes so that you have one autosomal plink fileset per population
    *  Note: it’s always useful to do some data checks. One example is checking how many lines were in your starting files, compared to how many lines are in your output files. You can use unix commands to make sure things appear as expected. For example, the bim files contain a list of all the SNPs. You can count how many entries are in the bim file really easily by piping (“|”) to “wc -l” which just counts the lines (keep in mind that one line is the header). How many SNPs are there for chromosome 1 for a population? Does the number of SNPs in your merged file make sense?

        ```
        cat reseq1kG_chr1_examplepop.bim | wc -l
        ```
        
5. Filter: 
    * For our initial filter let’s just filter both SNPs and individuals with high SNP or sample missingness of >0.2 (20%). This is fairly lenient, but we can always come back and be more strict. In plink, you use the --geno flag to filter by SNP and the --mind flag to filter by sample. For example:

        ```
        /opt/apps/rhel7/plink-1.90/plink --bfile reseq1kG_POPNAME_DATE --geno 0.2 --mind 0.2 --make-bed --out reseq1kG_POPNAME_DATE_filtered
        ```
        
6. Use the filtered files to merge the populations that you want to analyze together. You can try merging any of the populations to start with, but I recommend merging at least 1 admixed population and 2 reference populations. We’ll use this to get a feel for PCA/ADMIXTURE, and we’ll redo a few times to figure out what is most appropriate.
    * Merging (https://www.cog-genomics.org/plink/1.9/data#merge) can be a little bit complicated. Feel free to send screen shots to the Slack with warning messages if you want help interpreting them!
    * Some example commands are below, for you to edit with your filenames. You can try these commands directly in the terminal (you don’t need to submit scripts to run as jobs)
    * Pick two populations (1 ref and one admixed) and try merging them. Use the ref file as your --bfile and pass in the 2nd file to the --bmerge flag: 

        ```
        /opt/apps/rhel7/plink-1.90/plink --bfile reseq1kG_refpop_input --bmerge reseq1kG_admixedpop_input --make-bed --out merged_inital
        ```
        
    * This will probably warn you that there are some “missnps”. If so, do the following steps:
    * Flip the missnps in one of your two input files: 
    
        ```
        /opt/apps/rhel7/plink-1.90/plink --bfile reseq1kG_admixedpop_input --flip merged_inital-merge.missnp --make-bed --out reseq1kG_admixedpop_input_trial
        ```
        
    * Now try the merge again with the flipped file: 
    
        ```
      /opt/apps/rhel7/plink-1.90/plink --bfile reseq1kG_admixedpop_input --bmerge reseq1kG_admixedpop_input_trial --make-bed --out merged_trial
        ```
        
    * Did you get fewer errors this time? There are probably still some remaining. If so, unflip these other errors: 
    
        ```
        /opt/apps/rhel7/plink-1.90/plink --bfile reseq1kG_admixedpop_input_trial --flip merged_trial-merge.missnp --make-bed --out admixedpop_corrected
        ```
        
    * Remove any snps still causing errors:
    
        ```
        /opt/apps/rhel7/plink-1.90/plink --bfile admixedpop_corrected --exclude merged_trial-merge.missnp --make-bed --out admixedpop_tmp
      
        ```
        
        ```
        /opt/apps/rhel7/plink-1.90/plink --bfile reseq1kG_refpop_input --exclude merged_trial-merge.missnp --make-bed --out refpop_tmp
        ```
        
    * And finally, merge!

        ```
        /opt/apps/rhel7/plink-1.90/plink --bfile refpop_tmp --bmerge admixedpop_tmp --make-bed --out reseq1kG_refpop_admixedpop_autosomes
        ```
   
7. You can repeat the above process to merge in more populations. Once you have at least 3 populations, you can try PCA! I put a “prune_and_pca.sh” example scripts in your ForSS_1000G/ directory, but here is a brief summary.
   * For PCA, we want to prune the list of SNPs for linkage disequilibrium. Then use the list of pruned SNPs to extract those from a bed/bim/fam fileset. The run PCA and plot the output!
   * I sent you an example R script (sent over Slack) for plotting!
8. Run ADMIXTURE using the pruned bed file from step 7. I put a template script (admixture_autosomes.sh) in the ForSS_1000G directory. You can go ahead and run it when ready (this one may take a little bit more time), and I’ll send another R script for plotting the output

### Some Resources:
* Here's a useful blog post about doing a PCA, and there are also useful posts about ADMIXTURE and genetic data in general on this site: https://speciationgenomics.github.io/pca/ 
* Plink's documentation (there's a lot here! you don't need to go through it all, just know that it's here): https://www.cog-genomics.org/plink2 
* ADMIXTURE's documentation: https://pdfs.semanticscholar.org/c7b8/62051a0ed9fc2125e650da970bd0598449a6.pdf
