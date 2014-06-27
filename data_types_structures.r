# Vectors and operations
# dataframes and operations
# Vector creation and operations on vectors 

# creating a vector
vector1<-c(9,8,2,7) # OK
vector1


# create a second vector 
vector2<-c(1,2,5,1,2,1,4,1,"bob",9,1) # converts to string
vector2
# override the vector2 
vector2<-c(1,2,3,8)

# vector arithmetic 
vector1 + vector2
vector1 - vector2
vector1 * vector2
vector1 / vector2
# recycle
vector1 + c(1,2,3)



# vector indexing & slicing

# display 2nd element  
vector1[2]

#drop the second element
vector1[-2]

# index out boundary
vector1[10]
vector1
vector2

#logical selection
vector1[vector2=1]
############# end of vector ################


########### data frames #################
df <- data.frame(a=c(1,2,"4"),b=c(1,8,1))
df
# an inbuilt data frame
# use help to find the details 
mtcars
# name of the columns 
names(mtcars)
# accessing a row
mtcars[1,]
mtcars[c(1:9),]
mtcars[c(8:9),]

# selecting column 
mtcars$mpg
mtcars[,"mpg"]
mtcars[mtcars$mpg>1,]


mtcars[sample(nrow(mtcars), 5,replace=TRUE), ]

my.matrix <- matrix(c(0:29),nrow=15,ncol=2)
my.matrix[,1]

















 


