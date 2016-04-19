##wordclound

library(tm)
library(wordcloud)
library(RColorBrewer)


##loads both txt files as a list of 2
thesiscloud <- Corpus(DirSource("scripts/wordcloud/"))

inspect(thesiscloud)

###from thesis-----------------------------------------------------------------------------------------------------------------
thesiscloud <- tm_map(thesiscloud[1], PlainTextDocument)

thesiscloud <- tm_map(thesiscloud, stripWhitespace)
thesiscloud <- tm_map(thesiscloud, tolower)
thesiscloud <- tm_map(thesiscloud, removeWords, stopwords('english'))
thesiscloud <- tm_map(thesiscloud, removeWords, c("may", "also", "will", "likely", "can", "leaf", "using", "figure", "high",
                                                  "specific", "gain", "mean", "high", "table", "used", "across"))
thesiscloud <- tm_map(thesiscloud, removeNumbers)
thesiscloud <- tm_map(thesiscloud, removePunctuation)

thesiscloud <- tm_map(thesiscloud, stemDocument)
thesiscloud <- tm_map(thesiscloud, PlainTextDocument)

png(filename = "images/thesiscloud2.png", width = 7, height = 7, units = "in", res= 600)
wordcloud(thesiscloud, max.words=100,random.order = FALSE,rot.per=0.35, use.r.layout=FALSE, bg = "transparent",
          colors=brewer.pal(8,"Dark2"))
dev.off()

###from HIA-----------------------------------------------------------------------------------------------------------------
thesiscloud2 <- tm_map(thesiscloud[2], PlainTextDocument)

hiacloud<- tm_map(thesiscloud2, stripWhitespace)
hiacloud <- tm_map(hiacloud, tolower)
hiacloud <- tm_map(hiacloud, removeWords, stopwords('english'))
thesiscloud <- tm_map(thesiscloud, removeWords, c("one", "use", "used", "likely", "better", "higher", "commonly", "following", "must",
                                                  "new", "also", "represents", "although", "overall", "large", "can"))
hiacloud <- tm_map(hiacloud, removeNumbers)
hiacloud <- tm_map(hiacloud, removePunctuation)

hiacloud <- tm_map(hiacloud, stemDocument)
hiacloud <- tm_map(hiacloud, PlainTextDocument)

png(filename = "images/hiacloud.png", width = 7, height = 7, units = "in", res= 600)
wordcloud(hiacloud, max.words=100,random.order = FALSE,rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8,"Paired"))
dev.off()


