
TotalVariances = c()

for(i in 1:(total_cols-1))
{
  
  TotalVariances[i]<-sqrt(z_score_stand[,i]^2)
}

TotalVariances