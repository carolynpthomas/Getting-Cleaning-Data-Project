## Study Design
The purpose of this project is to demonstrate collecting, working with, and cleaning a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Variables used in the tidy data set
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The following is a list of the variables in the tidy data set. 
  (Note: triaxial variables are denoted by (X,Y,Z))
* subjectID
* activityID
* timeBodyAcceleration-Mean
* timeBodyAcceleration-Std (X,Y,Z)
* timeGravityAcceleration-Mean (X,Y,Z)
* timeGravityAcceleration-Std (X,Y,Z)
* timeBodyAccelerationJerk-Mean (X,Y,Z)
* timeBodyAccelerationJerk-Std (X,Y,Z)
* timeBodyGyroscope-Mean (X,Y,Z)
* timeBodyGyroscope-Std (X,Y,Z)
* timeBodyGyroscopeJerk-Mean (X,Y,Z)
* timeBodyGyroscopeJerk-Std (X,Y,Z)
* timeBodyAccelerationMagnitude-Mean
* timeBodyAccelerationMagnitude-Std
* timeGravityAccelerationMagnitude-Mean
* timeGravityAccelerationMagnitude-Std
* timeBodyAccelerationJerkMagnitude-Mean
* timeBodyAccelerationJerkMagnitude-Std
* timeBodyGyroscopeMagnitude-Mean
* timeBodyGyroscopeMagnitude-Std
* timeBodyGyroscopeJerkMagnitude-Mean
* timeBodyGyroscopeJerkMagnitude-Std
* frequencyBodyAcceleration-Mean
* frequencyBodyAcceleration-Std (X,Y,Z)
* frequencyBodyAcceleration-MeanFreq (X,Y,Z)
* frequencyBodyAccelerationJerk-Mean (X,Y,Z)
* frequencyBodyAccelerationJerk-Std (X,Y,Z)
* frequencyBodyAccelerationJerk-MeanFreq (X,Y,Z)
* frequencyBodyGyroscope-Mean (X,Y,Z)
* frequencyBodyGyroscope-Std (X,Y,Z)
* frequencyBodyGyroscope-MeanFreq (X,Y,Z)
* frequencyBodyAccelerationMagnitude-Mean
* frequencyBodyAccelerationMagnitude-Std
* frequencyBodyAccelerationMagnitude-MeanFreq
* frequencyBodyBodyAccelerationJerkMagnitude-Mean
* frequencyBodyBodyAccelerationJerkMagnitude-Std
* frequencyBodyBodyAccelerationJerkMagnitude-MeanFreq
* frequencyBodyBodyGyroscopeMagnitude-Mean
* frequencyBodyBodyGyroscopeMagnitude-Std
* frequencyBodyBodyGyroscopeMagnitude-MeanFreq
* frequencyBodyBodyGyroscopeJerkMagnitude-Mean
* frequencyBodyBodyGyroscopeJerkMagnitude-Std
* frequencyBodyBodyGyroscopeJerkMagnitude-MeanFreq

## Transformations
This data set was cleaned up in the following ways:
1. The training and the test sets were merged into one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set:
  - changed variables starting with "t" to start with "time"
  - changed variables starting with "f" to start with "frequency"
  - removed "()" from variable names
  - capitalized Mean and Std (where Std stands for standard deviation)
  - changed "acc" to "Acceleration"
  - changed "gyro" to "Gyroscope"
  - changed "mag" to "Magnitude"
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.
