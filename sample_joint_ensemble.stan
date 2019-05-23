data {
  int Nobs;
}
generated quantities {
  // model configuration
  real<lower=0> alpha = lognormal_rng(5,2);
  real<lower=0> sigma = lognormal_rng(5,2);
  
  // simulate data from observational model
  real yobs[Nobs];
  for(n in 1:Nobs){
    yobs[n] = weibull_rng(alpha, sigma);
  }
}
