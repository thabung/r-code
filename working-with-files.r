#Reading external Files into R

mtcarsDataFrame <- read.csv(file.choose())
# Get the structure
str(mtcarsDataFrame)
# Get the rows and columns
dim(mtcarDataFrame)
# Get the statistics
summary(mtcarDataFrame)


# write to external file
write.csv(mtcars,"/tmp/mtcars.csv", sep=",")

# Reading an excel file
library(gdata)  
help(read.xls)
excelData = read.xls(file.choose() , sheet = 1) 

# How about Running Sql on data frame :)
# More info : http://code.google.com/p/sqldf/
library(sqldf)
sqldf("select * from mtcars where mpg = 21.0")



