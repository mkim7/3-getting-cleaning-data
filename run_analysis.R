# download from url and unzip
setwd("C:/Users/Owner/Documents/R")
zipurl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./data")){dir.create("./data")}
download.file(zipurl, destfile="./data/project.zip")
unzip("./data/project.zip", exdir="./data")

# name files
subject_train = read.table("./data/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
X_train = read.table("./data/UCI HAR Dataset/train/X_train.txt", header=FALSE)
Y_train = read.table("./data/UCI HAR Dataset/train/Y_train.txt", header=FALSE)
subject_test = read.table("./data/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
X_test = read.table("./data/UCI HAR Dataset/test/X_test.txt", header=FALSE)
Y_test = read.table("./data/UCI HAR Dataset/test/Y_test.txt", header=FALSE)
activity = read.table("./data/UCI HAR Dataset/activity_labels.txt", header=FALSE)
features = read.table("./data/UCI HAR Dataset/features.txt", header=FALSE)

# assign column names
colnames(subject_train) = "subjectID"
colnames(X_train) = features[,2]
colnames(Y_train) = "activityID"
colnames(subject_test) = "subjectID"
colnames(X_test) = features[,2]
colnames(Y_test) = "activityID"
colnames(activity) = c('activityID', 'activityType')

# Beginning of project, step-by-step

# 1. Merges the training and the test sets to create one data set.
train = cbind(Y_train, subject_train, X_train)
test = cbind(Y_test, subject_test, X_test)
alldata = rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# to idenfity columns that we want, use following:
good <- grep("-mean\\(\\)|-std\\(\\)", features[,2])

# subset "alldata" based on the above, keeping only those that meet requirement
alldata2 = alldata[,good]

# 3. Uses descriptive activity names to name the activities in the data set
# merge "alldata2" with "activity," by "activityID"
alldata3 = merge(alldata2, activity, by='activityID', all.x=TRUE)

# 4. Appropriately labels the data set with descriptive variable names.

# assign name to colnames of "alldata3", replace names using for loop, then reassign those changed names to colnames of "alldata3"
newcolumns  = colnames(alldata3)
for (i in seq(along = newcolumns))
{
        newcolumns[i] = gsub("\\()", "", newcolumns[i])
        newcolumns[i] = gsub("Mag", "Magnitude", newcolumns[i])
        newcolumns[i] = gsub("^(t)", "time", newcolumns[i])
        newcolumns[i] = gsub("^(f)", "frequency", newcolumns[i])
        newcolumns[i] = gsub("BodyBody", "Body", newcolumns[i])
        newcolumns[i] = gsub(",", "", newcolumns[i])
        
}
colnames(alldata3) = newcolumns

# completed cleaning
finaldata <- alldata3

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## https://class.coursera.org/getdata-004/forum/thread?thread_id=262 regarding how tidy data should look

# covert "finaldata" to data table
final.table <-data.table(finaldata)

# calculate average of each variable for each activity, each subset
tidy.table <-final.table[, lapply(.SD, mean), by=list(activityID,subjectID)]

#save tidy data
write.table(tidy.table, file = 'uci-tidydata.txt', sep="\t")
