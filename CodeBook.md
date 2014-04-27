There are 50 fields in my tidy file, and they are defined as follow

1. Subject  is the subject , and there are 30 subjects in the study

2.  Activity is the activity. There are total of six activities usch as WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,
    SITTING,STANDING, and LAYING

3. tBodyAccmeanX is the tBodyAcc mean for X

4. tBodyAccmeanY is the tBodyAcc mean for Y

5. tBodyAccmeanZ is the tBodyAcc mean for Z

6. tBodyAccstdX is the tBodyAcc standard deviation for X

7. tBodyAccstdY is the tBodyAcc standard deviation for Y

8. tBodyAccstdZ is the tBodyAcc standard deviation for Z

9. tGravityAccmeanX is the tGravityAcc mean for X

10. tGravityAccmeanY is the tGravityAcc mean for Y

11. tGravityAccmeanZ is the tGravityAcc mean for Z

12. tGravityAccstdX is the tGravityAcc standard deviation for X

13.  tGravityAccstdY is the tGravityAcc standard deviation for Y

14.  tGravityAccstdZ is the tGravityAcc standard deviation for Z

15. tBodyAccJerkmeanX is the tBodyAccJerk mean for X

16. tBodyAccJerkmeanY is the tBodyAccJerk mean for Y

17. tBodyAccJerkmeanZ is the tBodyAccJerk mean for Z

18. tBodyAccJerkstdX  is the tBodyAccJerk std for X

19. tBodyAccJerkstdY   is the tBodyAccJerk std for Y

20. tBodyAccJerkstdZ   is the tBodyAccJerk std for Z

21. tBodyGyromeanX   is the tBodyGyro mean  for X

22. tBodyGyromeanY is the tBodyGyro mean  for Y

23. tBodyGyromeanZ is the tBodyGyro mean  for Z

24. tBodyGyrostdX is the tBodyGyro std  for X

25.  tBodyGyrostdY is the tBodyGyro std  for Y

26.  tBodyGyrostdZ is the tBodyGyro std  for Z

27. tBodyGyroJerkmeanX is the tBodyGyroJerk mean for X

28. tBodyGyroJerkmeanY is the tBodyGyroJerk mean for Y

29. tBodyGyroJerkmeanZ is the tBodyGyroJerk mean for Z

30. tBodyGyroJerkstdX is the tBodyGyroJerk std for X

31.  tBodyGyroJerkstdY is the tBodyGyroJerk std for Y

32. tBodyGyroJerkstdZ is the tBodyGyroJerk std for Z

33. fBodyAccmeanX is the fBodyAcc mean for X

34. fBodyAccmeanY is the fBodyAcc mean for Y

35. fBodyAccmeanZ is the fBodyAcc mean for Z

36.  fBodyAccstdX is the fBodyAcc std for X

37. fBodyAccstdY is the fBodyAcc std for Y

38. fBodyAccstdZ is the fBodyAcc std for Z

39. fBodyAccJerkmeanX  is the fBodyAccJerk mean for X

40. fBodyAccJerkmeanY is the fBodyAccJerk mean for Y

41. fBodyAccJerkmeanZ is the fBodyAccJerk mean for Z 

42. fBodyAccJerkstdX is the fBodyAccJerk std for X

43. fBodyAccJerkstdY is the fBodyAccJerk std for Y

44. fBodyAccJerkstdZ is the fBodyAccJerk std for Z

45. fBodyGyromeanX is the fBodyGyromean mean for X

46. fBodyGyromeanY is the fBodyGyromean mean for Y

47. fBodyGyromeanZ is the fBodyGyromean mean for Z

48.  fBodyGyrostdX is the fBodyGyromean  std for X

49. fBodyGyrostdY is the fBodyGyromean  std for Y

50. fBodyGyrostdZ is the fBodyGyromean  std for Z


Next, I describe the steps I took for my data transformations

1. Step one is to merges the training and the test sets to create one data set. 
   From my train directory in my c drive "c:/dung/github/UCI HAR Dataset/train", I read the X Train data set, Y train      data  set, and subject train data set . I then bind them all together by the column binds. 
   This is my R code swhoing the combining:
     setwd ("c:/dung/github/UCI HAR Dataset/train")
     train1 <- read.table ("X_train.txt",header=FALSE)
     ncol (train1)
     nrow (train1)
     head (train1)
     train2 = read.table ("y_train.txt",header=FALSE)
     ncol (train2)
     nrow (train2)
     head (train2)
     train2 [1:50,1]
     subject = read.table ("subject_train.txt",header=FALSE)
     ncol (subject)
     train.df <- cbind (train1,train2,subject)
     head (train.df)
     nrow (train.df)
     ncol (train.df)
     str (train.df)
     colnames (train.df[,1:10])
     train.df[1,1:15]
   
    Similarly from my test directory, I did the similar column binding with my test dataset.
    I then add the testing data frame to the training data frame as shown as follow in my R code:
        
     ## merge to data frame
     ## Step 1 : get big data frame of combine test and train data
     ncol (train.df)
     ncol(test.df)
     big.df = rbind(train.df,test.df)
     big.df [1,1:10]
     nrow (big.df)
     ncol (big.df)


2. Step two is to extract only the measurements on the mean and standard deviation for each measurement of my data   
    frame. My R code is as following:
   toMatch <- c(".*mean\\(\\).*-X$", ".*std\\(\\).*-X$",".*mean\\(\\).*-Y$",".*std\\(\\).*-Y$",".*mean\\(\\).*-Z$",".*std\\(\\).*-Z$")
  I then removed "()" and "-" from my data frame. My Code is as follow:
   selectbig_colnames = gsub ("-","",selectbig_colnames)
   selectbig_colnames = gsub ("\\(\\)","",selectbig_colnames)

3. Step 3 is to use descriptive activity names to name the activities in the data set. 

4. Appropriately labels the data set with descriptive activity names. 

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

