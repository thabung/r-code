setwd("/home/R/my-stuffs/learning/r-code")
# Load libraries
library(tm)

# file path, change this according or use file.choose() function
filepath <- "/tmp/rahul.txt"

# Function to generate corpus from a single file
generateCorpus <- function(filepath)
{
  # Read data from file
  vec <- scan(filepath, what = "", quiet = TRUE)
  # Collapse word vector
  vec <- paste(vec, collapse = " ")
  # Instantiate Corpus
  s.cor <- Corpus(VectorSource(vec))
  return(s.cor)
}

# Read the document
myCorpus <-  generateCorpus(filepath)

inspect(myCorpus)
# remove punctuation
myCorpus <- tm_map(myCorpus, removePunctuation)
# remove numbers
myCorpus <- tm_map(myCorpus, removeNumbers)

# stopwords for modi txt
#modiStopWords <- c("arnab","modi","Modi","Arnab" , "narendra" , "can")
rahulStopWords <- c("arnab","modi","Modi","Arnab" , "narendra" , "rahul")
myStopwords <- c(stopwords('english'), modiStopWords)

# Converting to Lower
myCorpus <- tm_map(myCorpus, tolower)
myCorpus <- tm_map(myCorpus, removeWords, myStopwords)

# Refer: http://stackoverflow.com/questions/24191728/documenttermmatrix-error-on-corpus-argument
myCorpus <- tm_map(myCorpus, PlainTextDocument)

# term document matrix 
docTdm <- TermDocumentMatrix(myCorpus, control = list(minWordLength = 1))
#findFreqTerms(myDtm, lowfreq=10)
library(wordcloud)
docMat <- as.matrix(docTdm)

# calculate the frequency of words
v <- sort(rowSums(docMat), decreasing=TRUE)
wordFreqName <- names(v)

wordFreqDataFrame <- data.frame(word=wordFreqName, freq=v)
wordcloud(wordFreqDataFrame$word, wordFreqDataFrame$freq, min.freq=10)



