data {
  int n_covariates;                    // Number of plant ecotypes (other than control plants) + number of trials
  int n_samples;                       // total number of plants investigated
  matrix[n_samples, n_covariates] X;   // covariate matrix
}
parameters {}
model {}
generated quantities {
  real<lower = 0> alpha;        // shape parameter
  vector[n_covariates] beta;    // effect parameters
  vector[n_samples] betatot;
  vector[n_samples] sigma;
  vector[n_samples] ypriorpred;  // prior predictive values
  
  alpha = 0.1;
  
  for(i in 1:n_covariates){
    beta[i] = normal_rng(0,1);
  }
  
  for (i in 1:n_samples){
    betatot[i] = 0;
    for (j in 1:n_covariates) {
      betatot[i] += X[i,j]*beta[j];
    }
    sigma[i] = exp(betatot[i]);
    ypriorpred[i] = weibull_rng(alpha, sigma[i]);
  }

  
}
