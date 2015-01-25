#read files
testset<-read.table("./UCI HAR Dataset/test/X_test.txt")
testlabel<-read.table("./UCI HAR Dataset/test/y_test.txt")
testsubject<-read.table("./UCI HAR Dataset/test/subject_test.txt") 


trainset<-read.table("./UCI HAR Dataset/train/X_train.txt")
trainlabel<-read.table("./UCI HAR Dataset/train/y_train.txt")
trainsubject<-read.table("./UCI HAR Dataset/train/subject_train.txt")

feature<-read.table("./UCI HAR Dataset/features.txt")

#merge files into the test data and training data.
test<-cbind(testsubject,testlabel,testset)
train<-cbind(trainsubject,trainlabel,trainset)

#merge the training and test data
merged<-rbind(train,test)
colnames(merged)<-c("subject","label",make.names(as.character(feature[,2]), unique=TRUE))

#Extracts measurements on the mean and standard deviation for each measurement
merged1<-cbind(select(merged,contains(c("mean"))),select(merged,contains(c("std"))))
merged1<-cbind(merged[,1:2],merged1)

#Create factors for the labels and rename the labels.
merged1$label<-factor(merged1$label)
levels(merged1$label)<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
merged1$subject<-factor(merged1$subject)

#create new data for step 5.
newdata<-ddply(merged1,.(subject,label),summarise,mean(tBodyAcc.mean...X),                  mean(tBodyAcc.mean...Y),                   
           mean(tBodyAcc.mean...Z),                    mean(tGravityAcc.mean...X),                
           mean(tGravityAcc.mean...Y),                 mean(tGravityAcc.mean...Z),                
           mean(tBodyAccJerk.mean...X),                mean(tBodyAccJerk.mean...Y),               
           mean(tBodyAccJerk.mean...Z),                mean(tBodyGyro.mean...X),                  
           mean(tBodyGyro.mean...Y),                   mean(tBodyGyro.mean...Z),                  
           mean(tBodyGyroJerk.mean...X),               mean(tBodyGyroJerk.mean...Y),              
           mean(tBodyGyroJerk.mean...Z),               mean(tBodyAccMag.mean..),                 
           mean(tGravityAccMag.mean..),                mean(tBodyAccJerkMag.mean..),              
           mean(tBodyGyroMag.mean..),                  mean(tBodyGyroJerkMag.mean..) ,            
           mean(fBodyAcc.mean...X),                    mean(fBodyAcc.mean...Y),                   
           mean(fBodyAcc.mean...Z),                    mean(fBodyAcc.meanFreq...X),               
           mean(fBodyAcc.meanFreq...Y),                mean(fBodyAcc.meanFreq...Z),               
           mean(fBodyAccJerk.mean...X),                mean(fBodyAccJerk.mean...Y),               
           mean(fBodyAccJerk.mean...Z),                mean(fBodyAccJerk.meanFreq...X),           
           mean(fBodyAccJerk.meanFreq...Y),            mean(fBodyAccJerk.meanFreq...Z),           
           mean(fBodyGyro.mean...X),                   mean(fBodyGyro.mean...Y),                  
           mean(fBodyGyro.mean...Z),                   mean(fBodyGyro.meanFreq...X),              
           mean(fBodyGyro.meanFreq...Y),               mean(fBodyGyro.meanFreq...Z),              
           mean(fBodyAccMag.mean..),                   mean(fBodyAccMag.meanFreq..),              
           mean(fBodyBodyAccJerkMag.mean..),           mean(fBodyBodyAccJerkMag.meanFreq..),      
           mean(fBodyBodyGyroMag.mean..),              mean(fBodyBodyGyroMag.meanFreq..),         
           mean(fBodyBodyGyroJerkMag.mean..),          mean(fBodyBodyGyroJerkMag.meanFreq..),     
           mean(angle.tBodyAccMean.gravity.),          mean(angle.tBodyAccJerkMean..gravityMean.),
           mean(angle.tBodyGyroMean.gravityMean.),     mean(angle.tBodyGyroJerkMean.gravityMean.),
           mean(angle.X.gravityMean.),                 mean(angle.Y.gravityMean.),                
           mean(angle.Z.gravityMean.),                 mean(tBodyAcc.std...X),                    
           mean(tBodyAcc.std...Y),                     mean(tBodyAcc.std...Z),                    
           mean(tGravityAcc.std...X),                  mean(tGravityAcc.std...Y),                 
           mean(tGravityAcc.std...Z),                  mean(tBodyAccJerk.std...X),                
           mean(tBodyAccJerk.std...Y),                 mean(tBodyAccJerk.std...Z),                
           mean(tBodyGyro.std...X),                    mean(tBodyGyro.std...Y),                   
           mean(tBodyGyro.std...Z),                    mean(tBodyGyroJerk.std...X),               
           mean(tBodyGyroJerk.std...Y),                mean(tBodyGyroJerk.std...Z),               
           mean(tBodyAccMag.std..),                    mean(tGravityAccMag.std..),                
           mean(tBodyAccJerkMag.std..),                mean(tBodyGyroMag.std..),                  
           mean(tBodyGyroJerkMag.std..),               mean(fBodyAcc.std...X),                    
           mean(fBodyAcc.std...Y),                     mean(fBodyAcc.std...Z),                    
           mean(fBodyAccJerk.std...X),                 mean(fBodyAccJerk.std...Y),                
           mean(fBodyAccJerk.std...Z),                 mean(fBodyGyro.std...X),                   
           mean(fBodyGyro.std...Y),                    mean(fBodyGyro.std...Z),                   
           mean(fBodyAccMag.std..),                    mean(fBodyBodyAccJerkMag.std..),           
           mean(fBodyBodyGyroMag.std..),               mean(fBodyBodyGyroJerkMag.std..))

colnames(newdata)<-colnames(merged1)
