## Good one with working sqldf statements

## training data
##setwd ("c:/dung/dataCleaning/UCI HAR Dataset/train")
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

## testing data 

##setwd ("C:/dung/dataCleaning/UCI HAR Dataset/test")
setwd ("C:/dung/github/UCI HAR Dataset/test")
test1 <- read.table ("X_test.txt",header=FALSE)
ncol (test1)
nrow (test1)
head (test1)


test2 = read.table ("y_test.txt",header=FALSE)
ncol (test2)
nrow (test2)
head (test2)

subjectTest = read.table ("subject_test.txt",header=FALSE)
ncol(subject)

test.df <- cbind (test1,test2,subjectTest)
head (test.df)
nrow (test.df)
ncol (test.df)

str (test.df)
colnames (test.df[,1:10])
test.df[1,1:15]


## merge to data frame
## Step 1 : get big data frame of combine test and train data
ncol (train.df)
ncol(test.df)
big.df = rbind(train.df,test.df)
big.df [1,1:10]
nrow (big.df)
ncol (big.df)


activity.vector = big.df [,ncol(big.df)-1]
activity.vector




subject.vector = big.df [,ncol(big.df)]
subject.vector



## 


## getting data column from features txt contains only mean () or std ()
setwd ("c:/dung/github/UCI HAR Dataset")
features <- read.table ("features.txt",header=FALSE)
features

## good notes http://docs.activestate.com/activetcl/8.5/expect4win/regex.html

## Step 2 : begin of get selected column from feature.txt file that match mean() and std() of X, Y, and Z

toMatch <- c(".*mean\\(\\).*-X$", ".*std\\(\\).*-X$",".*mean\\(\\).*-Y$",".*std\\(\\).*-Y$",".*mean\\(\\).*-Z$",".*std\\(\\).*-Z$")




matchesvalues <- unique (grep(paste(toMatch,collapse="|"), 
                              features$V2, value=TRUE))

matchesindices <- unique (grep(paste(toMatch,collapse="|"), 
                               features$V2, value=FALSE))

matchesindices

## end of step 2

## step 3 : get selected column of big dat frame from step 1

selectedbig.df = big.df [,matchesindices]
options(max.print=5.5E5) 
print (selectedbig.df)


## end of step 3


## Step 4: replace the name of column with actual feature names and activity labels names
colnames (selectedbig.df) = matchesvalues
head (selectedbig.df)

## ------------------>>>>>>>>  777777777 --->>>>>>   print out col name of selected big data frame

saveselectedbigcolnames = colnames (selectedbig.df)
selectbig_colnames = colnames (selectedbig.df)
## ----------------->>> end of print out col names of selected big data frame

## remove - from it
selectbig_colnames = gsub ("-","",selectbig_colnames)
## remove () from it too
selectbig_colnames = gsub ("\\(\\)","",selectbig_colnames)


## see if () and - are removed

selectbig_colnames

## assign colnames back to selectedbig.df

names (selectedbig.df) = selectbig_colnames

selectedbig.df [1:10,1:10]
######## 77777777777777777777777 end

## replace activity vector with activity label name ==> this is actual in step 3

## 1 WALKING
##2 WALKING_UPSTAIRS
## 3 WALKING_DOWNSTAIRS
## 4 SITTING
## 5 STANDING
## 6 LAYING
activity.vector1 = replace (activity.vector,activity.vector == 1,"WALKING")
activity.vector2 = replace (activity.vector1,activity.vector1 == 2,"WALKING_UPSTAIRS")
activity.vector3 = replace (activity.vector2,activity.vector2 == 3,"WALKING_DOWNSTAIRS")
activity.vector4 = replace (activity.vector3,activity.vector3 == 4,"SITTING")
activity.vector5 = replace (activity.vector4,activity.vector4 == 5,"STANDING")
activity.vectorFinal = replace (activity.vector5,activity.vector5 == 6,"LAYING")
activity.vectorFinal

## end of replace activity name with actual activity label name

### ------------>>>>>>> 777777       adding two more columns activity and subject to the end of the selectedbig.df
## add activity vector to existing selectedbig.df

selectedbig.df [,"Activity"]  = activity.vectorFinal

## add subject vector to existing selectedbig.df
selectedbig.df [,"Subject"] = subject.vector

selectedbig.df [1:100,]
## end of step 4


## step 5 : create tidy file based on each subject 's activity 

## check number of columns of selectedbig data frame and columns name

ncol (selectedbig.df)
colnames (selectedbig.df)

## construct a df with 50 variables and labels them 
tidy.df = data.frame()

number_of_columns = 50
tidy.df = data.frame(t(rep(NA,number_of_columns)))
##you can change number_of_columns according to your need


tidy.df <- tidy.df[-1,]
##Remove all NAs

tidy.df



NumberSubjects = 6
subjectActivity = c("WALKING",
                    "WALKING_UPSTAIRS",
                    "WALKING_DOWNSTAIRS",
                    "SITTING",
                    "STANDING",
                    "LAYING")


install.packages ("sqldf")
library (sqldf)
install.packages ("tcltk")
library (tcltk)
install.packages ("data.table")
library (data.table)







selected = data.frame(selectedbig.df)

selected [1:10,1:10]


colnamesSelectedDf = colnames (selected)

colnamesSelectedDf








## write output to text file

## use sink : sink("myfile.txt", append=TRUE, split=TRUE) 



tidycolnames = c (saveselectedbigcolnames[50],saveselectedbigcolnames[49],saveselectedbigcolnames[1:48])
tidycolnames


countTotalField = 0
for (i in 1: 6)
  
{
  for (j in subjectActivity)
  {
    ## set up data frame for 50 elements
    ddf = data.frame ()
    
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
  }
}  ## good for
print (countTotalField)  ### good count = 1728, and result8 = some of -0.9471368 ,and -0.9635715

