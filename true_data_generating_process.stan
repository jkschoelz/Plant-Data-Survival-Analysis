transformed data{
  int Nplants = 15;
  real<lower=0, upper=1> p = 1.0;
  real alpha = 5.0;
  real sigma = 5.0;
}
generated quantities {
  real yobs[Nplants];
  
  for(n in 1:Nplants){
    yobs[n] = weibull_rng(alpha, sigma);
  }
}
