# CODE BOOK – Getting and Cleaning Data Course Project

## DATA SET:

TidyData.txt (or TidyData.csv)

## INFO ABOUT DATA SET:

README.md


## VARIABLES:

- `Subject`

	Integer 1-30, which identifes the human volunteer subject number 

- `Activity`

Human activity identifier (1 of 6 possible options)
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING(STANDING
LAYING

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals Time Acceleration - XYZ and Time Gyroscope -XYZ. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The data set contains Mean and Standard Deviation (STD) of variables, as listed below.

These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into Body and Gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

TimeBodyAccelerometerMeanX
TimeBodyAccelerometerMeanY
TimeBodyAccelerometerMeanZ
TimeBodyAccelerometerSTDX
TimeBodyAccelerometerSTDY
TimeBodyAccelerometerSTDZ
TimeGravityAccelerometerMeanX
TimeGravityAccelerometerMeanY
TimeGravityAccelerometerMeanZ
TimeGravityAccelerometerSTDX
TimeGravityAccelerometerSTDY
TimeGravityAccelerometerSTDZ
TimeBodyGyroscopeMeanX
TimeBodyGyroscopeMeanY
TimeBodyGyroscopeMeanZ
TimeBodyGyroscopeSTDX
TimeBodyGyroscopeSTDY
TimeBodyGyroscopeSTDZ


Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals:

TimeBodyAccelerometerJerkMeanX
TimeBodyAccelerometerJerkMeanY
TimeBodyAccelerometerJerkMeanZ
TimeBodyAccelerometerJerkSTDX
TimeBodyAccelerometerJerkSTDY
TimeBodyAccelerometerJerkSTDZ
TimeBodyGyroscopeJerkMeanX
TimeBodyGyroscopeJerkMeanY
TimeBodyGyroscopeJerkMeanZ
TimeBodyGyroscopeJerkSTDX
TimeBodyGyroscopeJerkSTDY
TimeBodyGyroscopeJerkSTDZ

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm:

TimeBodyAccelerometerMagnitudeMean
TimeBodyAccelerometerMagnitudeSTD
TimeGravityAccelerometerMagnitudeMean
TimeGravityAccelerometerMagnitudeSTD
TimeBodyAccelerometerJerkMagnitudeMean
TimeBodyAccelerometerJerkMagnitudeSTD
TimeBodyGyroscopeMagnitudeMean
TimeBodyGyroscopeMagnitudeSTD
TimeBodyGyroscopeJerkMagnitudeMean
TimeBodyGyroscopeJerkMagnitudeSTD

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing:

FrequencyBodyAccelerometerMeanX
FrequencyBodyAccelerometerMeanY
FrequencyBodyAccelerometerMeanZ
FrequencyBodyAccelerometerSTDX
FrequencyBodyAccelerometerSTDY
FrequencyBodyAccelerometerSTDZ
FrequencyBodyAccelerometerMeanFreqX
FrequencyBodyAccelerometerMeanFreqY
FrequencyBodyAccelerometerMeanFreqZ
FrequencyBodyAccelerometerJerkMeanX
FrequencyBodyAccelerometerJerkMeanY
FrequencyBodyAccelerometerJerkMeanZ
FrequencyBodyAccelerometerJerkSTDX
FrequencyBodyAccelerometerJerkSTDY
FrequencyBodyAccelerometerJerkSTDZ
FrequencyBodyAccelerometerJerkMeanFreqX
FrequencyBodyAccelerometerJerkMeanFreqY
FrequencyBodyAccelerometerJerkMeanFreqZ
FrequencyBodyGyroscopeMeanX
FrequencyBodyGyroscopeMeanY
FrequencyBodyGyroscopeMeanZ
FrequencyBodyGyroscopeSTDX
FrequencyBodyGyroscopeSTDY
FrequencyBodyGyroscopeSTDZ
FrequencyBodyGyroscopeMeanFreqX
FrequencyBodyGyroscopeMeanFreqY
FrequencyBodyGyroscopeMeanFreqZ
FrequencyBodyAccelerometerMagnitudeMean
FrequencyBodyAccelerometerMagnitudeSTD
FrequencyBodyAccelerometerMagnitudeMeanFreq
FrequencyBodyAccelerometerJerkMagnitudeMean
FrequencyBodyAccelerometerJerkMagnitudeSTD
FrequencyBodyAccelerometerJerkMagnitudeMeanFreq
FrequencyBodyGyroscopeMagnitudeMean
FrequencyBodyGyroscopeMagnitudeSTD
FrequencyBodyGyroscopeMagnitudeMeanFreq
FrequencyBodyGyroscopeJerkMagnitudeMean
FrequencyBodyGyroscopeJerkMagnitudeSTD
FrequencyBodyGyroscopeJerkMagnitudeMeanFreq

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

AngleTimeBodyAccelerometerMean,Gravity
AngleTimeBodyAccelerometerJerkMean,GravityMean
AngleTimeBodyGyroscopeMean,GravityMean
AngleTimeBodyGyroscopeJerkMean,GravityMean
AngleX,GravityMean
AngleY,GravityMean
AngleZ,GravityMean

## TRANSFORMATIONS:

The zip file was downloaded from the following link: at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

R programming code was used to apply the following tranformations: 
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names (names of labels were corrected and special characters were removed from the labels)
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

