---
title: "README"
output: html_document
---
Where to get the Data
======================
The data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  on August 22, 2014

#All the files were read in except for the inertial signals files and the "features info" file
##Column names were assigned to the activity labels file
##Column names were assigned to the Xtest and Xtrain files using the "features"

###The individual test and train files were column binded together 
###The test and train files were row binded together

###The data were subset using column numbers. The variables chosen were those that were specifically named "-mean()" or "-std()". The FreqMean and Freqstd were not chosen because thsoe were not true, simple means.

###The descriptive activity names were assigned using the activity_ID that corresponded to each activity as found in the "activity_labels" file.

###The variable names were cleaned up according to good data science standards. All nonstandard characters were removed (eg. () and -). Also any non-intuitive abbreviations (eg. t or f) were changed to more self-explanatory labels (eg. time and freq).

###Finally, the means of the variables by activity and subject were found using the aggregate command. The data file was written as a comma separated value file for ease of reading by any future users/clients.
