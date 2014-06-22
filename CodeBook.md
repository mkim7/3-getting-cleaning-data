README -- Codebook
=======================

## Data & Variables

Data is based on experiments carried out with 30 test subjects. Each person performed six activities, as indicated in activity_labels.txt, wearing the Samsung Galaxy S II device on the waist.
With the device, 3-axial linear  acceleration and 3-axial angular velocity were captured. The obtained dataset has been randomly divided into two sets, training data and test data.

For this exercise, only variables related to mean and standard deviation were kept.

## Files included

The resulting files are as follows:
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

## Data transformation

To create a tidy data set, the following five steps were taken:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. ppropriately labels the data set with descriptive activity names.
5. reates a second, independent tidy data set with the average of each variable for each activity and each subject.


