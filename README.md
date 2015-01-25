# Samsung-Data
 The script carries out the following performances as described in the project instructions:
1. "Merges the training and the test sets to create one data set."
2. "Extracts only the measurements on the mean and standard deviation for each measurement." 
3. "Uses descriptive activity names to name the activities in the data set"
4. "Appropriately labels the data set with descriptive variable names". 
5. "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."
(source: https://class.coursera.org/getdata-010/human_grading/view/courses/973497/assessments/3/submissions)

I calculated all the variables that contain the word "mean" or "std", which standard for mean and standard deviation measurements.
The raw data was in Hz, but the data offered was rescaled in [-1,1]. Hence, my data output will also be rescaled in [-1,1].
For more info on the original codebook, please refer to  README.txt, features_info.txt, features.txt, and activity_labels.txt in the project zip file.
