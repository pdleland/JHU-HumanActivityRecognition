# include the following packages
library(dplyr)
library(tidyr)

# define file refernce variables to all needed files
# 10,299 observations are included in this data set broken into training and testing files
# the main file for each grouping consits of a 561-feature vector with time and frequency domain variables
# a mAtching activity file defines each vector to an activity.  A matching subject file defines who performed the observation
# the training and test sets have identical layouts
# finally, files are provided that give measurement descriptions for the 561 column feature vector and activities
urlTrain <- "./data/train/X_train.txt"
urlTrainActivity <- "./data/train/y_train.txt"
urlTrainSubjects <- "./data/train/subject_train.txt"

urlTest <- "./data/test/X_test.txt"
urlTestActivity <- "./data/test/y_test.txt"
urlTestSubjects <- "./data/test/subject_test.txt"

urlNames <- "./data/features.txt"
urlActivities <- "./data/activity_labels.txt"

# read in all defined  text files
train <- read.csv(urlTrain, sep="", header = FALSE)
trainActivity <- read.csv(urlTrainActivity, header = FALSE)
trainSubjects <- read.csv(urlTrainSubjects, header = FALSE)

test <- read.csv(urlTest, sep="", header = FALSE)
testActivity <- read.csv(urlTestActivity, header = FALSE)
testSubjects <- read.csv(urlTestSubjects, header = FALSE)

activities <- read.csv(urlActivities, sep="", header = FALSE)


# assign column names to all dataframes. note the order adjustment
columnNames <- readLines(urlNames)
colnames(activities) <- c("activityID", "activity")

colnames(train) <- c(columnNames)
colnames(trainActivity) <- c("activityID")
colnames(trainSubjects) <- c("subject")

colnames(test) <- c(columnNames)
colnames(testActivity) <- c("activityID")
colnames(testSubjects) <- c("subject")


# join the subject and activity variables to the main data sets using column binding
train <- cbind(trainSubjects,train)
train <- cbind(trainActivity,train)
test <- cbind(testSubjects,test)
test <- cbind(testActivity,test)

# combine the training and test data sets into one using row binding.
# also bring in an adtivity description using merge
df <- rbind(train,test)
df <- merge(df,activities,by=c("activityID","activityID"))


# create a character vecor of the variables to be included in this analysis
# we are filetering for variables that involve mean and standard deviation only
filteredColumnNames <- grep(("mean()|std()"), columnNames, perl=TRUE, value=TRUE)

df <- df %>%
    select("subject", "activity", filteredColumnNames)
  
# remove the old column numbers that were prefixed to the column names
editColumnNames <- function(x) {sub("[0-9]* ", "", x)}
colnames(df) <- lapply(colnames(df), editColumnNames)


# create final tidy data set
df2 <- df %>%
    select(everything()) %>%
    gather("concatVar", "value", 3:81) %>%
    separate(col=concatVar, into=c("feature","measurement","axis"), sep="-") %>%
    group_by(subject, activity, feature, measurement) %>%
    summarize(mean_value = mean(value, na.rm = TRUE)) %>%
    arrange(subject, activity)
   
# write out tidy data set to physical CSV file 
write.csv(df2,file="./final.csv", row.names = FALSE)
write.table(df2,file="./final.txt", row.names=FALSE)

# use this to read the final tidy data set
tidy_set <- read.csv("./final.csv", header = TRUE, sep = ",")

    