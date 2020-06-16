# CODEBOOK
This codebook describes the variables, the data, and any transformations or work that you performed to clean up the data.

## Source study information:

Data comes from an experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the designers of the experiment captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


## Steps from getting the tidy data:

1) First, we must run the run_analysis.R script, which will automatically download the data from the link provided and save it on our computer. The code will also unzip the files. Please, remember to change the working directory to your own.
2) The data is read from the different folders provided in the dataset. Information on the train dataset (with 70% of the participants) are retrieved and stored as x_train, y_train and subject_train. They contain, respectively, the number of the feature, the activity ID and the number of the subject of the experiment. The same is done with the test dataset (containing the remaining 30% of observations). Data is stored as x_test, y_test and subject_test that represent respectively the feature number, ActivityId and subjectId
3) We rename the variables in both datasets so that they can be merged.
4) We merge the data
5) Among all the variables related to features, we select the ones containing the mean and standard deviations
6) We label the activity types
7) We export the tidy_dataset as a csv file: tidy_dataset.csv


## Description of variables in the final data (tidy_dataset):

- **ActivityType**: Labels the type of activity undertaking by the subject among the following ones: <br />
 WALKING <br />
 WALKING_UPSTAIRS <br />
 WALKING_DOWNSTAIRS <br />
 SITTING <br />
 STANDING <br />
 LAYING <br />

- **SubjectId**: A number characterising each of the subjects of the experiment

- **ActivityId**: A number characterising each of the activities of the experiment. Correspondence to the labels in ActiviTytype:

1 WALKING <br />
2 WALKING_UPSTAIRS <br />
3 WALKING_DOWNSTAIRS <br />
4 SITTING <br />
5 STANDING <br />
6 LAYING <br />

- **Variables related to the records obtained from each feature**. They are named as follows:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ <br />
tGravityAcc-XYZ <br />
tBodyAccJerk-XYZ <br />
tBodyGyro-XYZ <br />
tBodyGyroJerk-XYZ <br />
tBodyAccMag <br />
tGravityAccMag <br />
tBodyAccJerkMag <br />
tBodyGyroMag <br />
tBodyGyroJerkMag <br />
fBodyAcc-XYZ <br />
fBodyAccJerk-XYZ <br />
fBodyGyro-XYZ <br />
fBodyAccMag <br />
fBodyAccJerkMag <br />
fBodyGyroMag <br />
fBodyGyroJerkMag <br />

The set of variables that were estimated from these signals are: 

mean(): Mean value <br />
std(): Standard deviation

An indicator of the mean and std was them added to the name in order to facilitate the characterization of the variables.

For example: tBodyAcc-mean()-X corresponds to the mean (mean()) time (t) recorded by the Body Accelerator (BodyAcc) with gyroscope signal X
The rest of variables can be interpreted on a similar fashion.
