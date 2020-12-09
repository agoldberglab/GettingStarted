library(ggplot2)

#Make a tab-delimited table with two columns: "IDs" and "Pop". 
  #IDs should be the "Sample names" from the original spreadsheet, and Pop should be the Population codes.
  #You can go ahead and make one big table with all the samples/populations we're working with.
  #an easy way to do this is by making an excel column with those 2 columns from the original excel file, then File -> Save as -> select file format 'Tab delimited (.txt)"
  #Now read this table in:
IDsPops1000G <- read.table("/Users/klk37/Google Drive/Project_Admixture_Americas/IDsPops1000G.txt", header = TRUE)

#For the PCA you want to plot, provide the path to the file that ends in .eigenvec
pcs <- read.table("/Users/klk37/Google Drive/Project_Admixture_Americas/reseq1kG_autosomes_pca.eigenvec", header = FALSE)

#The second column in the eigenvec file is the sample IDs, so you can use those in conjunction with your populations table to figure out which data points belong to which populations:
pcsgrp <- merge(x= pcs, y= IDsPops1000G, by.x = 'V2',by.y = 'IDs')

#Check that you have the number of samples per population that you expect:
#(you can edit these commands to count any population you want to check)
length(which(pcsgrp$Pop=='CLM'))
length(which(pcsgrp$Pop=='IBS'))
length(which(pcsgrp$Pop=='YRI'))

#Now try plotting! The 3rd and 4th columns of the eigenvec file are the first 2 principal components. Here's code for plotting those:
ggplot(data=pcsgrp, aes(x=V3, y=V4)) + 
  geom_point(aes(color=Pop), size = 6, alpha = 0.4)+
  #scale_x_continuous(limits = c(-.08, 0.08))+
  #scale_y_continuous(limits = c(-.08, 0.08))+
  theme_classic()+
  scale_color_brewer(palette="Dark2")+
  labs(title="PCA")+
  labs(x="PC1", y="PC2")
