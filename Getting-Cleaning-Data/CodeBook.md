## Different variables, their datatypes and the data they hold in the tidy dataset 
Feature variables from 4 to 69 are normalized and bounded within [-1,1]
These feature variables begin with a "t" to indicate time domain feature and an "f" to indicate frequency feature.
To these letters were appended 
 a) body or gravity - to indicate body and gravity components of accleration and velocity
 b) acc or gyro - to indicate acceleration or velocity
 c) mean, std, jerkmean, jerkstd - to indicate different variable components of the feature
 d) x, y, z - to indicate the  axial dimensions along which the measure of the component was taken

activityid	        numeric     Values range from 1 to 6
activitydesc	        character   1 WALKING; 2 WALKING_UPSTAIRS; 3 WALKING_DOWNSTAIRS; 4 SITTING; 5 STANDING; 6 LAYING
subjectid	        numeric     Values range from 1 to 30
tbodyaccmean..x	        numeric
tbodyaccmean..y	        numeric
tbodyaccmean..z	        numeric
tgravityaccmean..x	numeric
tgravityaccmean..y	numeric
tgravityaccmean..z	numeric
tbodyaccjerkmean..x	numeric
tbodyaccjerkmean..y	numeric
tbodyaccjerkmean..z	numeric
tbodygyromean..x	numeric
tbodygyromean..y	numeric
tbodygyromean..z	numeric
tbodygyrojerkmean..x	numeric
tbodygyrojerkmean..y	numeric
tbodygyrojerkmean..z	numeric
tbodyaccmagmean..	numeric
tgravityaccmagmean..	numeric
tbodyaccjerkmagmean..	numeric
tbodygyromagmean..	numeric
tbodygyrojerkmagmean..	numeric
fbodyaccmean..x	        numeric
fbodyaccmean..y	        numeric
fbodyaccmean..z	        numeric
fbodyaccjerkmean..x	numeric
fbodyaccjerkmean..y	numeric
fbodyaccjerkmean..z	numeric
fbodygyromean..x	numeric
fbodygyromean..y	numeric
fbodygyromean..z	numeric
fbodyaccmagmean..	numeric
fbodyaccjerkmagmean..	numeric
fbodygyromagmean..	numeric
fbodygyrojerkmagmean..	numeric
tbodyaccstd..x	        numeric
tbodyaccstd..y	        numeric
tbodyaccstd..z	        numeric
tgravityaccstd..x	numeric
tgravityaccstd..y	numeric
tgravityaccstd..z	numeric
tbodyaccjerkstd..x	numeric
tbodyaccjerkstd..y	numeric
tbodyaccjerkstd..z	numeric
tbodygyrostd..x 	numeric
tbodygyrostd..y 	numeric
tbodygyrostd..z 	numeric
tbodygyrojerkstd..x	numeric
tbodygyrojerkstd..y	numeric
tbodygyrojerkstd..z	numeric
tbodyaccmagstd..	numeric
tgravityaccmagstd..	numeric
tbodyaccjerkmagstd..	numeric
tbodygyromagstd..	numeric
tbodygyrojerkmagstd..	numeric
fbodyaccstd..x  	numeric
fbodyaccstd..y  	numeric
fbodyaccstd..z  	numeric
fbodyaccjerkstd..x	numeric
fbodyaccjerkstd..y	numeric
fbodyaccjerkstd..z	numeric
fbodygyrostd..x 	numeric
fbodygyrostd..y	        numeric
fbodygyrostd..z  	numeric
fbodyaccmagstd..	numeric
fbodyaccjerkmagstd..	numeric
fbodygyromagstd..	numeric
fbodygyrojerkmagstd..	numeric



## Transformations performed on Raw data to arrive at tidy dataset
   ---------------------------------------------------------------
1) Read activity IDs and description into a dataframe
2) Read Feature IDs and names into a dataframe
3) Extracted the mean and standard deviation features from the Features dataset by grepping on mean and std
4) Renamed the mean and standard deviation variable names in the dataset
5) Read the training dataset into a dataframe
6) Merged the different training datasets and create a new dataframe
7) Read the test dataset into a dataframe
8) Merged the different test datasets and create a new dataframe
9) Combined the training and test datasets
10) Aggregated the variables and calculated their average based on subject and activity ids
11) Output tidy dataset to a text file in working directory