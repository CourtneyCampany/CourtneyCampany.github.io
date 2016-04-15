##wordclound

library(tm)
library(wordcloud)
library(RColorBrewer)

thesiscloud <- Corpus(DirSource("wordcloud/"))
inspect(thesiscloud)

thesiscloud <- tm_map(thesiscloud, PlainTextDocument)


thesiscloud <- tm_map(thesiscloud, stripWhitespace)

thesiscloud <- tm_map(thesiscloud, tolower)

thesiscloud <- tm_map(thesiscloud, removeWords, stopwords('english'))

thesiscloud <- tm_map(thesiscloud, removeNumbers)

thesiscloud <- tm_map(thesiscloud, removePunctuation)


thesiscloud <- tm_map(thesiscloud, stemDocument)
thesiscloud <- tm_map(thesiscloud, PlainTextDocument)

wordcloud(thesiscloud, max.words=100,random.order = FALSE,rot.per=0.35, use.r.layout=FALSE, colors=rainbow(8))
