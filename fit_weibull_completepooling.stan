data{
  int N;          // Number of datapoints
  int M;          // Number of covariates
  matrix[N,M] X;  // Matrix of covariate values
  real y[N];      // survival outcomes
}
parameters{
  real<lower=0> alpha;
  real beta0;
  vector[M] beta;
}
model{
  beta0 ~ normal(0,5);
  beta ~ normal(0,1);
  y~weibull(alpha, exp(X*beta + beta0));
}
generated quantities{
  real yppf[N];
  
  yppf = weibull_rng(alpha, exp(X*beta + beta0));
}
