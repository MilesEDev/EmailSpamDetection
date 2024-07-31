


correlated <- cor(comb[,2:total_cols])

TooHighCorrelate<-c() 
TooHighID<-1
HeaderName<-c()

for(corColID in 1:(total_cols-1))
{
  colCorrelate<-correlated[,corColID]
  
  for(corCellID in 1:(total_cols-1))
  {
    if((colCorrelate[corCellID] > 0.95 | colCorrelate[corCellID] < -0.95) &  corCellID!=corColID)
    {
      TooHighCorrelate[TooHighID]<- colCorrelate[corCellID]
      HeaderName[TooHighID]<-names(comb)[corCellID+1]
      TooHighID<-TooHighID + 1
      
      
    }
  }
}


