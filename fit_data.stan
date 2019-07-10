data{
  int Nobs;
  int Ncens;
  real yobs[Nobs];
  real ycens[Ncens];
}
transformed data {
  real yminus[Nobs];
  int Ntot = Nobs + Ncens;
  
  for(n in 1:Nobs){
    yminus[n] = yobs[n] - 1;
  }
}
parameters{
  real<lower=0> alpha;
  real beta;
}
model{
  beta ~ normal(0,4);
  alpha ~ lognormal(0,5);
  
  target += weibull_lpdf(yobs | alpha, exp(beta));
  target += weibull_lccdf(ycens | alpha, exp(beta));
}
generated quantities {
  real ypred[Ntot];
  
  for(n in 1:Ntot){
    ypred[n] = weibull_rng(alpha, exp(beta));
  }
}

