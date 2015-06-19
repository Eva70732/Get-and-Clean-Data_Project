
# download dataset and unpack zip file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                "Project.zip", method="curl")
unzip('Project.zip')
###############################################################################

#Task 1:
##read files X_train.txt, X_test.txt and features.txt
X_train <- read.table("./train/X_train.txt")
X_test <- read.table("./test/X_test.txt")
features <- read.table("features.txt")

##create "X part" of tidy final dataset
X_features <- c(as.character(features[,2]))
X_table <- rbind(X_train, X_test)
names(X_table) <- X_features

##read subject_train.txt and subject_test.txt files
S_train <- read.table('./train/subject_train.txt')
S_test <- read.table('./test/subject_test.txt')

##create "Subject part" of final dataset
S_table <- rbind(S_train, S_test)
names(S_table) <- c('Subject')

##read y_train.txt and y_test.txt files
y_train <- read.table("./train/y_train.txt")
y_test <- read.table("./test/y_test.txt")

##create "Activity part" of final dataset
y_table <- rbind(y_train, y_test)
names(y_table) <- c("Activity")

##create final dataset (not nesessary but just for double-check)
mydata <- cbind(X_table, S_table, y_table)
###############################################################################

#Task 2: 
## find numbers of columns which names have "mean()" or "std()"
meanfilter <- grep("mean()", X_features, fixed = TRUE) 
stdfilter <- grep("std()", X_features, fixed = TRUE) 
colfilter <- c(meanfilter, stdfilter)

##extract columns where mean() or std() are shown
X_filter <- X_table[, colfilter]

##create filtered final dataset
mydata <- cbind(X_filter, S_table, y_table)
###############################################################################

#Task 3:
##read activity_labels.txt file
y_labels <- read.table('activity_labels.txt')

##replace Activity codes in mydata with descriptive labels from y_labels
mydata$Activity <- as.character(sapply(mydata$Activity, switch, '1'='WALKING', '2'='WALKING_UPSTAIRS', '3'='WALKING_DOWNSTAIRS', '4'='SITTING', '5'='STANDING', '6'='LAYING'))
###############################################################################

#Task 4: all columns have their names according to features_info.txt, 
#as it all of variables were correctly labeled in Tasks 1-3 
###############################################################################

#Task 5
##tranfer mydata to data.table
library(data.table)
library(reshape2)
mydata <- as.data.table(mydata)
## melt data.table 
melt_data <- melt(mydata, id=c("Subject", "Activity"), measure.vars = colnames(X_filter))
## create an independent data.table where all mean(data) is grouped by subject, by activity
tidy_data <- dcast(melt_data, Subject + Activity ~ variable, mean)

#save tidy_data as .txt file
write.table(tidy_data, file="tidy_data.txt", row.name=FALSE, sep=" ")