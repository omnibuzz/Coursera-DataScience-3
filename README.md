# Human Activity Recognition Using Smartphones Dataset

The associated R file run_analysis.R does the following:
Uses the following files in the working directory:
  - Data Files: They are available in the UCI HAR Dataset Directory
    - 'train/X_train.txt': Training set - Recorded observations- A 561-feature vector with time and frequency domain variables.
    - 'train/y_train.txt': Training labels - Refers the the activity code corresponding to the entry in the X_Train.txt
    - 'train/subject_train.txt' : Subject Identifiers - refers to the subjects - the line number corresponds to the line number of the observation. 
    - 'test/X_test.txt': Test set - Recorded observations- A 561-feature vector with time and frequency domain variables.
    - 'test/y_test.txt': Test labels - Refers the the activity code corresponding to the entry in the X_test.txt
    - 'test/subject_test.txt' : Subject Identifiers - refers to the subjects - the line number corresponds to the line number of the observation.
  a. UCI HAR Dataset\Activity_labels.txt - This file is used to get the friendly name of the activity for the code presen in y_train.txt and y_test.txt
  b. UCI HAR Dataset\features.txt - The column names in the order of apprearance of columns in x_train.txt and x_test.txt

It reads the files and vertically joins the train files and similarly vertically joins the test files so that the reading can be associated to the Subject and activity. And the two resulting files are horizontally joined to get the full set observations. 

The measurements that are not required (every observation other than mean and standard deviation) are filtered out.
The resulting file is then grouped by the activity and the subject while all the measures are averaged and the resulting file is written out to the working directory. 
