#### READ IN DATA ######

# Method #1 (dialog box)
# This line will pull up a dialog box that lets you choose the .csv file you want to load, then it loads the data into an object called "myData":
myData <- read.csv(file.choose(),header = TRUE)

# Method #2 (file name is in the code)
# another option is to write out the name of the file and the path where it's located
# the path you'll write out will be relative to the current "working directory"
# To figure out the current working directory do this:
getwd()
# To change the working directory, do this (you'll need to replace the string in quotes with the one that is appropriate for your computer)
setwd("/Users/Marilyn/Documents/InformationVisualizationCourses/summer2016/Rfiles/data") 
# The next line reads a .csv files and stores it in a variable called "myData"
# 'sep' specifies what character separates the columns in the data file
# 'header' tells R that the data file has a header (with the name of each column)
myData <-read.csv("PewCollegeDataCleaned.csv",sep=",",header=TRUE)


###### EXAMINE THE DATA #####
# I like to do this whenever I load data to be sure that it looks the way I expect it to

# First just type the name of the object (R will print the contents in the Console window)
myData

#the head() function will show the first few rows
head(myData)


#The dim() function tells you the dimensions of the data frame (it gives 2 numbers: first the number of rows then the number of columns)
dim(myData)

# The names() function prints out the column names
names(myData)

# The summary() function shows minimum, maximum, missing values, and some other values
summary(myData)

# Extra: In addition to looking at the whole object, you can view a single column by typing its name followed by a $ symbol then the name of a column like this:
myData$Cohort

######## CREATING A LINE CHART ################

# There are many ways to create a line chart in R. For this exercise, you'll use the very basic plot() function. The syntax is −
#   plot(v,type,col,xlab,ylab,main)
#     v - is an object (a "vector") containing the numeric values.
#     type - use "p" to draw only points, "l" to draw only lines and "o" to draw both points and lines.
#     xlab - is the label for x axis.
#     ylab - is the label for y axis.
#     main is the Title of the chart.
#     col is the color of the points and lines.
#     lwd is the thickness of the lines (it takes a number without quotes around it)
#     ylim can be used to specify the lower and upper limits of the y axis (with rare exception,  you should always start the y axis at zero)
#         the form is this: ylim = c(0,<insert upper limit number here>)

# You'll draw one line at a time so to prepare for that you need to create new objects that contain the data for just 1 line
#     (in this case, one set for each level of education).
# The first line below says "create an object called 'bachelors' and fill it with a subset of the object
#   called "myData" that has the text 'Bachelor's degree or more' in the column called 'education'":
bachelors <- subset(myData, myData$education == "Bachelor's degree or more")
highSchool <- subset(myData, myData$education == "High school graduate")
twoYear <- subset(myData, myData$education == "Two-year degree/Some college")

# Now we want to get just the income values for each line (each education level).
# The first line below says "create an object called 'bachelorsIncome' and fill it with the contents of the "income" colum in the "bachelors" object
bachelorsIncome<-bachelors$income
highSchoolIncome<-highSchool$income
twoYearIncome<-twoYear$income

# Now draw the chart and first line with the plot function
plot(highSchoolIncome,type = "o",col = "#d1a72b", xlab = "cohort", ylab = "income", main = "value of education", ylim=c(0,45000),lwd =5)

# Add additional lines with the lines()function.
lines(bachelorsIncome, type = "o", col = "#1d6859", lwd =5)
lines(twoYearIncome, type = "o", col = "#97782d", lwd =5)


