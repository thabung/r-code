
xAxis <- c(1:5)
yAxis <- c(6:10)

# plot the points on the graph
plot(xAxis,yAxis)

# get some sample data from a simulated function
sampleData <- rnorm(100)
yAxis <- c(1:100)
#colors <- ifelse(sampleData>0, 2 , 3)
#col = colors
plot(sampleData,yAxis ,main = "FTAG example" , xlab = "RNorm" , ylab = "0-100" ,type = "p" )

# boxPlot
boxPlotData = c(1,3,5,7,9)
boxplot(boxPlotData)





# Drawing a map
library(maps)
library(mapdata)
map("world","India")

########### Geocoding ################
#install.packages(c("RJSONIO","RCurl" , "RgoogleMaps" ,"ggmap"))
library(RCurl)
library(RJSONIO)
library(RgoogleMaps)

# Get the Latitude and Longitude of a place
getGeoCode <- function(gcStr)
{
  
  library("RJSONIO") #Load Library
  gcStr <- gsub(' ','%20',gcStr) #Encode URL Parameters
  #Open Connection
  connectStr <- paste('http://maps.google.com/maps/api/geocode/json?sensor=false&address=',gcStr, sep="") 
  con <- url(connectStr)
  data.json <- fromJSON(paste(readLines(con), collapse=""))
  close(con)
  #Flatten the received JSON
  data.json <- unlist(data.json)
  lat <- data.json["results.geometry.location.lat"]
  lng <- data.json["results.geometry.location.lng"]
  gcodes <- as.double(c(lng, lat))
  names(gcodes) <- c("Lng", "Lat")
  return (gcodes)
}

latLong <- getGeoCode("Bangalore")
#latLong <- as.double(latLong)


library(ggmap)

al1 = get_map(location=latLong, zoom = 11, maptype= 'roadmap')
al1MAP = ggmap(al1)
al1MAP












