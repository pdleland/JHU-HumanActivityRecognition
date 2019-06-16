---
title: "Week 4 Programming Assignment"
author: "Paul Leland"
date: "June 15, 2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

### Background 
JHU Data Science Specialization - Getting and Cleaning Data - through Cousera.

This markdown file is a modification and extension to the original feature_info.txt and README.txt files 
by the authors listed below. Content from the original files appears in its own section denoted by - OA**.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. The data in this assignment 
represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

Per dimensionengineering.com, an accelerometer is an electromechanical device that will measure acceleration forces. 
These forces may be static, like the constant force of gravity pulling at your feet, 
or they could be dynamic - caused by moving or vibrating the accelerometer.

What are Accelerometers are useful for? By measuring the amount of static acceleration due to gravity, 
you can find out the angle the device is tilted at with respect to the earth. By sensing the amount of 
dynamic acceleration, you can analyze the way the device is moving. 

An accelerometer can help your project understand its surroundings better. 
Is it driving uphill? Is it going to fall over when it takes another step? 
Is it flying horizontally or is it dive bombing your professor? 
A good programmer can write code to answer all of these questions using the data provided by an accelerometer. 

The next four OA** sections below include the information given by the original authors as to the 
data given in the data set, and how to read and interpret its layout.  This infomration should be read to help
orient the reader to the make up of the data set.  See the MAIN ASSIGNMENT section of this mark down document for a discussion of the actions taken in cleaning and tidying this data set.


### Original README file - OA** 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


For each record it is provided:  
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
- Triaxial Angular velocity from the gyroscope.   
- A 561-feature vector with time and frequency domain variables.   
- Its activity label.   
- An identifier of the subject who carried out the experiment.  

The dataset includes the following files:  
- 'README.txt'  
- 'features_info.txt': Shows information about the variables used on the feature vector.  
- 'features.txt': List of all features.  
- 'activity_labels.txt': Links the class labels with their activity name.  
- 'train/X_train.txt': Training set.  
- 'train/y_train.txt': Training labels.  
- 'test/X_test.txt': Test set.  
- 'test/y_test.txt': Test labels.  
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.   
    Its range is from 1 to 30.   
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample.   
    Its range is from 1 to 30.   

Notes: 
- Features are normalized and bounded within [-1,1].  
- Each feature vector is a row on the text file.  

For more information about this dataset contact: activityrecognition@smartlab.ws  


### Feature Selection - OA** 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and 
tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency 
of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration 
signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the 
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Features - OA** 
tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

### Variables estimated from these signals are - OA**  

mean(): mean value   
std(): Standard deviation  
mad(): Median absolute deviation     
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

The complete list of variables of each feature vector is available in 'features.txt'  


# MAIN ASSIGNMENT  
The original data set included 7,352 observations in a training set and 2,947 observations in a test set.
10,299 total observations are included in this data set broken into the training and testing files. The main file for each grouping consits of a 561-feature vector with time and frequency domain variables. A matching activity file defines each vector to an activity. A matching subject file defines who performed the observation. The training and test sets have identical layouts. Finally, files are provided that give measurement descriptions for the 561 column feature vector and activities.

The original data was far from tidy as there were:
1) no column names included in the main tables
2) numerical column numbers associated with a text file of titles that were not needed once assembled
3) associated subject and activity tables were in separate text files and not included in the main data set
4) multiple variables or data dimension contained in columns
5) 561 measurements spanned across the columns from item 4


### Subset of variables used in this assignement:
The assignment required that we filter the set of variables to only include measurements  
that related to mean and standard deviation.  The following variables were selected:  
mean(): Mean value    
std(): Standard deviation   
meanFreq()  

The other variables were filtered using the following command:  
filteredColumnNames <- grep(("mean()|std()"), columnNames, perl=TRUE, value=TRUE)

### Separtion and naming of variables:
Step 8 below performs a gathering and spliting of the measurements to arrive at the following form:

Subject / Activity / Feature / Measurement / Axis / Value

The axis column was included in a separate field for this analysis but can be easily rolled up if not
needed.  Including it did introduce some NA values on certain observations.

The variable names above are simplified and meaningful, contain a single measurement for each column
and are therefore in good tidy form.

The next sections discuss the script used to transform the data.

### STEP 1: Create file URLs
Define file reference variables to all needed files
the original data source is:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Files were downloaded and stored on a local hard drive.
 
urlTrain <- "./data/train/X_train.txt"  
urlTrainActivity <- "./data/train/y_train.txt"  
urlTrainSubjects <- "./data/train/subject_train.txt"  

urlTest <- "./data/test/X_test.txt"  
urlTestActivity <- "./data/test/y_test.txt"  
urlTestSubjects <- "./data/test/subject_test.txt"  

urlNames <- "./data/features.txt"  
urlActivities <- "./data/activity_labels.txt"   

### STEP 2: read in all defined  text files  
train <- read.csv(urlTrain, sep="", header = FALSE)  
trainActivity <- read.csv(urlTrainActivity, header = FALSE)  
trainSubjects <- read.csv(urlTrainSubjects, header = FALSE)  

test <- read.csv(urlTest, sep="", header = FALSE)  
testActivity <- read.csv(urlTestActivity, header = FALSE)  
testSubjects <- read.csv(urlTestSubjects, header = FALSE)  

activities <- read.csv(urlActivities, sep="", header = FALSE)  


### STEP 3: assign column names to all dataframes. note the order adjustment  
columnNames <- readLines(urlNames)  
colnames(activities) <- c("activityID", "activity")  

colnames(train) <- c(columnNames)  
colnames(trainActivity) <- c("activityID")  
colnames(trainSubjects) <- c("subject")  

colnames(test) <- c(columnNames)  
colnames(testActivity) <- c("activityID")  
colnames(testSubjects) <- c("subject")  


### STEP 4: join the subject and activity variables to the main data sets using column binding  
train <- cbind(trainSubjects,train)  
train <- cbind(trainActivity,train)  
test <- cbind(testSubjects,test)  
test <- cbind(testActivity,test)  


### STEP 5: combine the training and test data sets into one using row binding. bring in an activity description using merge  
df <- rbind(train,test)  
df <- merge(df,activities,by=c("activityID","activityID"))  


### STEP 6: filter unwanted variables from the data set    
filteredColumnNames <- grep(("mean()|std()"), columnNames, perl=TRUE, value=TRUE)  

df <- df %>%  
    select("subject", "activity", filteredColumnNames)  
  
### STEP 7: remove the old column numbers that were prefixed to the column names  
editColumnNames <- function(x) {sub("[0-9]* ", "", x)}  
colnames(df) <- lapply(colnames(df), editColumnNames)  


### STEP 8:  create final tidy data set and save off file  
df2 <- df %>%  
    select(everything()) %>%  
    gather("concatVar", "value", 3:81) %>%  
    separate(col=concatVar, into=c("feature","measurement","axis"), sep="-") %>%  
    group_by(subject, activity, feature, measurement) %>%  
    summarize(mean_size = mean(value, na.rm = TRUE)) %>%  
    arrange(subject, activity)  
    
write.csv(df2,file="./final.csv", row.names = TRUE, sep = ",")  


### Original Authors:  
Human Activity Recognition Using Smartphones Dataset  
Version 1.0    

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Universit� degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  

License:  
Use of this dataset in publications must be acknowledged by referencing the following publication [1]   
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed  
to the authors or their institutions for its use or misuse. Any commercial use is prohibited.  
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.  

