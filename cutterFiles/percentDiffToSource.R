
numrows<-nrow(comb)
comb_copy<-comb

spamRows<-which(comb_copy$Email.Class>0)
nonSpam<-which(comb_copy$Email.Class<1)
diffRows <- length(nonSpam) - length(spamRows)
NonSamples<-nonSpam

while(length(NonSamples) > 2172)
{
  random<-sample(1:length(nonSpam),1, replace=T) 
  NonSamples<-NonSamples[-random]
  
}
length(NonSamples)
nrow(comb_copy)-diffRows
comb_copy<-comb_copy[-NonSamples,]

spamRows<-which(comb_copy$Email.Class>0)
nonSpam<-which(comb_copy$Email.Class<1)
nrow(comb_copy)
s = c()
name = c()
for(diffID in 2:total_cols)
{
  spamWordCol <-comb_copy[spamRows,diffID]
  countSpamCol<-sum(spamWordCol)
  nonSpamWordCol<-comb_copy[nonSpam,diffID]
  countNonSpamCol<-sum(nonSpamWordCol)
  total<-countSpamCol + countNonSpamCol
  percSpam<-countSpamCol/total
  percNonSpam<-countNonSpamCol/total
  diff<-percNonSpam - percSpam
  s[diffID-1]<-diff
  name[diffID-1]<-names(comb_copy[diffID])
}
s<-s[1:3001]
percentRange <- data.frame(col_name=name, col_s=s)
sortedPercentDec<-percentRange[order(percentRange$col_s, decreasing = TRUE),]

sortedPercentInc<-percentRange[order(percentRange$col_s, decreasing = FALSE),]

toGraph<-tail(sortedPercentDec,10)
toGraph 


nrow(sortedPercentInc)
middleWords<-sortedPercentInc[sortedPercentInc$col_s < 0.1 & sortedPercentInc$col_s > -0.1,]
nrow(middleWords)
middleWords
vectorNames = middleWords$col_name
vectorNames
wordFreq = c()
freqID<-1

for(value in vectorNames)
{
  
  wordFreq[freqID]<-sum(comb_copy[,value])
  freqID<-freqID+1
}
wordFreq
vectorNames<-percentRange$col_name
freqID<-1
for(value in vectorNames)
{
  wordFreq[freqID]<-sum(comb_copy[,value])
  freqID<-freqID+1
}
percentRangeWordFreq<-data.frame(col_name=name, col_s=s,col_freq=wordFreq)

percentRangeWordFreqSort<-percentRangeWordFreq[order(percentRangeWordFreq$col_freq, decreasing = FALSE),]

tail(percentRangeWordFreqSort,200)

