Sys.setenv(WNHOME = "C:\\Users\\Redwood\\Documents\\R\\win-library\\3.0\\WordNet-3.0") 
library("openNLP")
library("wordnet")
library("tm")

###############
# Parts of speech tagging. 
###############
pos_text <- "I like mango"
out<-tagPOS(pos_text,language="en")
unlist(strsplit(out,split=" "))
############### 
setDict("C:\\Users\\Redwood\\Documents\\R\\win-library\\3.0\\WordNet-3.0")

#
#this function takes sentence tokenize, removes stop words and returns the tokens
token_clean<-function(input_sentence){
  input_corpus<-c(input_sentence)
  corpus.tmp<-Corpus(VectorSource(input_corpus))
  corpus.tmp <- tm_map(corpus.tmp, removePunctuation)
  corpus.tmp <- tm_map(corpus.tmp, stripWhitespace)
  corpus.tmp <- tm_map(corpus.tmp, tolower)
  corpus.tmp <- tm_map(corpus.tmp, removeWords, stopwords("english")) 
  return_me<-unlist(strsplit(corpus.tmp[[1]]," "))
  return_me <-return_me[return_me!=""]
  return(return_me)
}


#generate synonyms for each word
generate_synonyms<-function(input_words){
   return_me<-c()
   verb<-unlist(sapply(input_words,synonyms,pos="VERB"))
   adverb<-unlist(sapply(input_words,synonyms,pos="ADVERB"))
   adjective<-unlist(sapply(input_words,synonyms,pos="ADJECTIVE"))
   noun<-unlist(sapply(input_words,synonyms,pos="NOUN"))
   return_me<-c(verb,adverb,adjective,noun)
   return(return_me)
   
}


# compare two sentences .. It uses the functions discussed above 
compare_sentences<-function(compare_with,compare_me){
  
  
  compare_me_vec<-token_clean(compare_me)
  compare_me_vec<-generate_synonyms(compare_me_vec)
  
  compare_with_vec<-token_clean(compare_with)
  compare_with_vec<-generate_synonyms(compare_with_vec)
  length(intersect(compare_me_vec,compare_with_vec))
  return(length(intersect(compare_me_vec,compare_with_vec)))
  
}

compare_me<-"The Smell of this flower is good"
compare_with<-c("The scent of the blossom is good ","He is nice guy","Delhi is the capital of India","Pink flower")
# call the function 
sapply(compare_with,compare_sentences,compare_me)

