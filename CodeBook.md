There are 50 fields in my tidy file, and they define as follow

1. Subject  is the subject , and there are 30 subjects in the study

2.  Activity is the activity.

3. tBodyAccmeanX 

4. tBodyAccmeanY 

5. tBodyAccmeanZ

6. tBodyAccstdX

7. tBodyAccstdY

8. tBodyAccstdZ

9. tGravityAccmeanX

10. tGravityAccmeanY

11. tGravityAccmeanZ

12. tGravityAccstdX

13.  tGravityAccstdY

14.  tGravityAccstdZ

15. tBodyAccJerkmeanX

16. tBodyAccJerkmeanY

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

