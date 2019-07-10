transformed data{
  int Nplants = 100;
  real<lower=0, upper=1> p = 1.0;
  real alpha = 7.0;
  real beta = log(7.0);
  real ycens = 15;
}
generated quantities {
  real yactual[Nplants];
  real yobs[Nplants];
  real vobs[Nplants];
  
  for(n in 1:Nplants){
    yactual[n] = weibull_rng(alpha, exp(beta));
    yobs[n] = ceil(yactual[n]);
    if(yobs[n] > 8){
      vobs[n] = 0;
    } else {
      vobs[n] = 1;
    }
  }
}
