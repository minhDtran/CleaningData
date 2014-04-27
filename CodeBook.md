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

17. tBodyAccJerkmeanZ 

18. tBodyAccJerkstdX 

19. tBodyAccJerkstdY

20. tBodyAccJerkstdZ

21. tBodyGyromeanX

22. tBodyGyromeanY

23. tBodyGyromeanZ

24. tBodyGyrostdX

25.  tBodyGyrostdY

26.  tBodyGyrostdZ 

27. tBodyGyroJerkmeanX 

28. tBodyGyroJerkmeanY 

29. tBodyGyroJerkmeanZ 

30. tBodyGyroJerkstdX

31.  tBodyGyroJerkstdY 

32. tBodyGyroJerkstdZ 

33. fBodyAccmeanX 

34. fBodyAccmeanY 

35. fBodyAccmeanZ

36.  fBodyAccstdX 

37. fBodyAccstdY 

38. fBodyAccstdZ 

39. fBodyAccJerkmeanX 

40. fBodyAccJerkmeanY 

41. fBodyAccJerkmeanZ 

42. fBodyAccJerkstdX 

43. fBodyAccJerkstdY 

44. fBodyAccJerkstdZ 

45. fBodyGyromeanX 

46. fBodyGyromeanY 

47. fBodyGyromeanZ

48.  fBodyGyrostdX 

49. fBodyGyrostdY 

50. fBodyGyrostdZ


Next, I describe the steps I took for my data transformations

1. Merges the training and the test sets to create one data set. 
   From my train directory in my c drive "c:/dung/github/UCI HAR Dataset/train", I read the X Train data set, Y train      data  set, and subject train data set . I then bind them all together by the column binds. 
   Similarly from my test directory, I did the similar column binding with my test dataset.
   I then add the testing data frame to the training dat frame


2. Extracts only the measurements on the mean and standard deviation for each measurement.
   I use xgrep command to attract th emean()-x, mean()-y,  mean(z),std()-x, std()-y, std()-z out of my data frame. I       then use gsub function to remove the () and - out. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive activity names. 

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

