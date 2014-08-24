## 1. Merge the training and the test sets to create one data set.
setwd("/Users/Amanda/RData/UCI HAR Dataset/")
##Read in data
activityLabels= read.table("activity_labels.txt",header=FALSE,na.strings="NA")
features= read.table("features.txt",header=FALSE,na.strings="NA")
##assign column names for activity Labels
##Features will be used as column names for Xtest and Xtrain
colnames(activityLabels)=c("activity_ID","activity_type")
##Read in test data
subjectTest= read.table("./test/subject_test.txt",header=FALSE,na.strings="NA")
Xtest=read.table("./test/X_test.txt",header=FALSE,na.strings="NA")
Ytest=read.table("./test/y_test.txt",header=FALSE,na.strings="NA")
##assign column names
colnames(subjectTest)="subject_ID"
colnames(Xtest)=features[,2]
colnames(Ytest)="activity_ID"
##Read in train data
subjectTrain= read.table("./train/subject_train.txt",header=FALSE,na.strings="NA")
Xtrain=read.table("./train/X_train.txt",header=FALSE,na.strings="NA")
Ytrain=read.table("./train/y_train.txt",header=FALSE,na.strings="NA")
##Assign column names
colnames(subjectTrain)="subject_ID"
colnames(Xtrain)=features[,2]
colnames(Ytrain)="activity_ID"
##Merge Training Data
MergeTrain=cbind(Xtrain,subjectTrain,Ytrain)
##Merge Testing Data
MergeTest=cbind(Xtest,subjectTest,Ytest)
##Merge all the data
MergeAll=rbind(MergeTrain,MergeTest)

##2.Extract only the measurements on the mean and standard deviation for each measurement.
##Subset Dataset
TidyData<-MergeAll[,c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,
                      266:271,345:350,424:429,503:504,516:517,529:530,542:543,562:563)]

##3. Uses descriptive activity names to name the activities in the data set
TidyData = merge(TidyData,activityLabels,by="activity_ID",all.x=TRUE)

##4. Appropriately labels the data set with descriptive variable names. 
##Below will clean up the column names from the features file
names<-colnames(TidyData)
names=gsub("\\()","",names)
names=gsub("mean","Mean",names)
names=gsub("std","StdDev",names)
names=gsub("-","",names)
names=gsub("^t","Time",names)
names=gsub("^f","Freq",names)
colnames(TidyData)=names

##5. Creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.  
TidyDataFinal<-aggregate(TidyData, by=list(Activity=TidyData$activity_type,Subject=TidyData$subject_ID),
                FUN=mean,na.rm=TRUE)
TidyDataFinal=TidyDataFinal[,c(1:2,4:69)]
write.csv(TidyDataFinal,"TidyDataFinal.csv")


