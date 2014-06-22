3-getting-cleaning-data
=======================
This repo was made for the course project for the Coursera course "Getting and Cleaning data."

##Raw Data
Files were obtained from this url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##run_analysis.R<br/>
This script will<br/>
<li>
<ol>Download and unzip files from the url above.</ol>
2. Merge test and training sets.
3. Keep only the columns that are related to mean and standard deviation.
4. Add activity names and uses descriptive variables
5. Creates a tidy data set with averages of each variable per subject, per activity.
6. Saves the tidy data set from 5. as "uci-tidydata.txt" in the working directory.
</li>