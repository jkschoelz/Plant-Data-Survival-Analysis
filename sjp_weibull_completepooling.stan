data {
  int n_covariates;                    // Number of variables
  int n_samples;                       // total number of plants investigated
  matrix[n_samples, n_covariates] X;   // covariate matrix
}
parameters {}
model {}
generated quantities {
  real beta0;                   // frailty parameter
  vector[n_covariates] beta;    // effect parameter
  real<lower = 0> alpha;        // shape parameter
  vector[n_samples] sigma;      // scale parameter
  real beta_tot;
  vector[n_samples] ypriorpred;          // failure times
  
  beta0 = normal_rng(0,1);
  for(i in 1:n_covariates){
    beta[i] = normal_rng(0,1);
  }
  alpha = fabs(normal_rng(0,0.1));
  
  for(i in 1:n_samples) {
    beta_tot = 0;
    for(j in 1:n_covariates){
      beta_tot += exp(beta0 + X[i,j]*beta[j]);
    }
    sigma[i] = exp(beta_tot);
  } 
  for(i in 1:n_samples) {
    ypriorpred[i] = weibull_rng(alpha, sigma[i]);
  }
}
