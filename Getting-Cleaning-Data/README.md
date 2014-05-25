There is a single script file for processing the dataset. It consists of two functions
* downloadDataset
* processDatasets

The downloadDataset function downloads the data from the website & unzips the zip file
to the working directory. 

The processDatasets function reads the different datasets into different data frames, 
It merges the different data frames, subsets the mean and std values from the resulting
dataset. It then creates a second data set with the average of each variable for each 
activity and each subject. This final tidy dataset is written back to the working 
directory as a text file