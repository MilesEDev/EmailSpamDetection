total_cols<-3002

toChop<-length(names(imp_set))*0.20



for(i in 1:1)
{
  source("C:/Users/Miles/OneDrive/Documents/myRprogram/Rass/CutterFiles/correlationCutterToSource.R")
  source("C:/Users/Miles/OneDrive/Documents/myRprogram/Rass/CutterFiles/percentDiffToSource.R")
  source("C:/Users/Miles/OneDrive/Documents/myRprogram/Rass/CutterFiles/totalVarianceToSource.R")
    
  percentRangeWordFreq$col_s<-sqrt(percentRangeWordFreq$col_s^2)
  
  
  correlated<-sqrt(correlated^2)
  
  scores<-c() 
  
  maxCor<-c() 
  for(i in 1:(total_cols-1))
  {
    maxCor[i]<-max(correlated[-i,i])
  }
  
  
  
  max(correlated[,i])
  
  for(i in 1:(total_cols-1))
  {
    scores[i]<-(1-maxCor[i]) * percentRangeWordFreq$col_s[i] * TotalVariances[i]
  }
  
  
  
  sortedScores<-sort(scores, decreasing=F)
  
  sortedScores
  
  
  
  getIndex<-which(scores==sortedScores[1])
  ToRemove<-getIndex[1]
  names(imp_set)[getIndex]
  total_cols<-total_cols-1
  comb<-comb[-getIndex]
  imp_set<-comb
}
