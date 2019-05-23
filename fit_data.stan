data{
  int Nobs;
  int yobs[Nobs];
}
parameters{
  real<lower=0> alpha;
  real<lower=0> sigma;
}
model{
  alpha ~ lognormal(5,2);
  sigma ~ lognormal(5,2);
  
  for(n in 1:Nobs){
    yobs[n] ~ weibull(alpha, sigma);
  }
}
