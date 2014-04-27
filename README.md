CleaningData
============

  To produce a tidy data set with fifty columns describe in my CodeBook.md based on the data located in my computer 's c drive. It is located at   "c:\dung\github\UCI HAR Dataset". The dataset represents data collected from the Samsung Galaxy S smartphone. The data could be obtained from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
####My Script which produced the data set is located at /CleaningData/run_analysis.R

There are five steps that I took for my data transformations in order to produce my tidy data set with fifty columns.
The fifty columns are described as following: subject,activity , and the means and standard deviations of various X, Y, and Z. For more information on the fifty columns elements and how they are defined, please visit my /CleaningData/CodeBook.md.  


    1. Step one is to merge the training and the test sets to create a training data frame. From my train directory in my c drive "c:/dung/github/UCI HAR Dataset/train", I read the X Train data set, Y train data set, and subject train data set . I then bind them all together by the column binds. This is my R code swhoing the combining: setwd ("c:/dung/github/UCI HAR Dataset/train") train1 <- read.table ("X_train.txt",header=FALSE) ncol (train1) nrow (train1) head (train1) train2 = read.table ("y_train.txt",header=FALSE) ncol (train2) nrow (train2) head (train2) train2 [1:50,1] subject = read.table ("subject_train.txt",header=FALSE) ncol (subject) train.df <- cbind (train1,train2,subject) head (train.df) nrow (train.df) ncol (train.df) str (train.df) colnames (train.df[,1:10]) train.df[1,1:15]

    Similarly from my test directory, I did the similar column binding with my test dataset to create a testing data frame. I then add the testing data frame to the training data frame as shown as follow in my R code:

    ## merge testing and training data frames ## Step 1 : get big data frame of combine test and train data ncol (train.df) ncol(test.df) big.df = rbind(train.df,test.df) big.df [1,1:10] nrow (big.df) ncol (big.df)

    2. Step two is to extract only the measurements on the mean and standard deviation for each measurement of my data
    frame. My R code is as following: toMatch <- c(".mean\(\).-X$", ".std\(\).-X$",".mean\(\).-Y$",".std\(\).-Y$",".mean\(\).-Z$",".std\(\).-Z$") .I then removed "()" and "-" from my data frame. My Code is as follow: selectbig_colnames = gsub ("-","",selectbig_colnames) selectbig_colnames = gsub ("\(\)","",selectbig_colnames)

    Step three is to use descriptive activity names to name the activities in the data set. I then replace activity of the dataset by their labels names. The code is activity.vector1 = replace (activity.vector,activity.vector == 1,"WALKING") activity.vector2 = replace (activity.vector1,activity.vector1 == 2,"WALKING_UPSTAIRS") activity.vector3 = replace (activity.vector2,activity.vector2 == 3,"WALKING_DOWNSTAIRS") activity.vector4 = replace (activity.vector3,activity.vector3 == 4,"SITTING") activity.vector5 = replace (activity.vector4,activity.vector4 == 5,"STANDING") activity.vectorFinal = replace (activity.vector5,activity.vector5 == 6,"LAYING") activity.vectorFinal. I then combine the activi column into my data frame. The code is selectedbig.df [,"Activity"] = activity.vectorFinal

    Step four is to label the data set with descriptive activity names. The first column contains the subject name, the second column contains the activity , and the third to the fifty columns contain the mean and the standad deviation of field three to field fifty of my tidy data fields described from my codebook. My rcode for combining all of my fifty columns is as following: tidycolnames = c (saveselectedbigcolnames[50],saveselectedbigcolnames[49],saveselectedbigcolnames[1:48])

    Step five is to creates a second, independent tidy data set with the average of each variable for each activity and each subject. I create a tidy data frame and to write the tidy data frame into my text file located in my computer's C drive. My code is as following:

countTotalField = 0 for (i in 1: 30)

{ for (j in subjectActivity) { ## set up data frame for 50 elements ddf = data.frame ()

numberofColumns = 50
ddf = data.frame (t(rep(NA,numberofColumns)))
ddf = ddf [-1,]
## append subject to data frame
dfIndex = 1;
ddf [1,dfIndex] = i
## append activity to data frame
dfIndex = dfIndex + 1
ddf [1,dfIndex] = j
for (myField in colnamesSelectedDf [1:48])
{
  q12 =  paste (c("select avg(", myField, ") from selected where Activity = ","'", j ,"'"," and Subject = ","'",i,"'"),collapse="")
  q12
  result12 =  sqldf (q12)  
  ##print (result9)
  countTotalField = countTotalField + 1
  dfIndex = dfIndex + 1
  ddf [1,dfIndex] = result12
}
## print out df index
print (dfIndex)
## print out data frame
names(ddf) = tidycolnames

print (ddf)
sink("c:/dung/github/myfile.txt", append=TRUE, split=TRUE) 
print (ddf)
sink()

} }
print (countTotalField) 
