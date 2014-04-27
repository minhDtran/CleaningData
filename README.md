CleaningData
============

  To produce a tidy data set with fifty columns describe in my CodeBook.md based on the data located in my computer 's c drive. It is located at   "c:\dung\github\UCI HAR Dataset". The dataset represents data collected from the Samsung Galaxy S smartphone. The data could be obtained from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
####My Script which produced the data set is located at /CleaningData/run_analysis.R

There are five steps that I took for my data transformations in order to produce my tidy data set with fifty columns.
The fifty columns are described as following: subject,activity , and the means and standard deviations of various X, Y, and Z. For more information on the fifty columns elements and how they are defined, please visit my /CleaningData/CodeBook.md.  
My five steps data transformation are as following:

    Step one is to merge training and test data sets to create one big data set.
    Step two is to extracts the values of  the means and standard deviations for each measurement. 
    Step three is to uses the decribed activity names to label activities in the data set
    Step four is to appropriately name the data set with descriptive activity names. 
    Step five is to create a  tidy data set with the average of each variable for each activity and each subject, and to write the final result to a file located in my c drive.
    
    For more information on my processes and columns description of my tidy data set, please visit codebook at my repo /CleaningData/Codebook.md.
    For more information on my code, please visit my R code at /CleaningData/run_analysis.R
