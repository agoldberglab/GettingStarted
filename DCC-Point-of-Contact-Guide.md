# DCC Point-of-Contact Guide
These notes are intended for the lab point-of-contact for the DCC. See below for notes on managing users, storage, etc.

Originally put together by Katharine Korunes (kkorunes@gmail.com) on 14 January 2022.

## Managing user access:
Here is the Research Toolkits self service portal for adding or managing DCC users: https://rtoolkits.web.duke.edu

## Goldberg lab storage:
Important directories:
- /hpc/home/netID --Each user has a 10GB personal home directory. There are a few shared directories where you can make your own “yourNetID/” subfolder (i.e., within each of these directories, please make yourself a "yourNetID/" directory (e.g., my (Katharine K) work directory is /work/klk37/) and work within that directory.
- /work --Temporary location for active analyses. This is ~500TB of unpartitioned space shared across all DCC users. This space is not backed up and files in /work are automatically deleted after 75 days.
- /hpc/group/goldberg --This is our lab directory, with 1TB of storage and 7 days of backups
- /datacommons/goldberg --This is our lab directory for archival storage. Use this for storing important (not intermediate or temporary) files and scripts. 

IMPORTANT NOTES ON DATACOMMONS STORAGE:
- The Datacommons directory is the Goldberg Lab's primary long-term storage. This directory is mounted to the cluster for easy access, but read/write won’t be as fast compared to /work or /hpc directories. 
- Storage capacity can be increased at any time-- the current cost associated is $80 per TB per year. This cost is based on the allocation, not on the amount actually used. To increase/decrease storage email rescomputing@duke.edu.
- This storage is not backed up-- lab members should always keep backups of important data and scripts in a secondary location not on the cluster.

## Globus
For large data transfers Duke Globus subscription can be used: https://oit.duke.edu/help/articles/kb0032536 
- This is a non-profit data management service run by the University of Chicago. See the link above for instructions, and note that some transfers may require permissions help from Research Computing (e.g., we needed Research Computing to allow CSHL write permissions to transfer the howler data).

## Computing Node
We have our own priority node on the DCC:
- Partition is "goldberg"
- NodeName=dcc-goldberg-01 CPUs=92 Realmemory=738430
