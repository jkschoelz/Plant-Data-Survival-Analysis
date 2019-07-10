functions {
  real weibullCure_lpdf(vector y, vector nu, real alpha, real sigma, real theta){
    return nu*weibull_lpdf(y, alpha, sigma) + theta*ln(theta) + theta*weibull_cdf(y | alpha, sigma);
  }
  real weibullCure_rng(real alpha, real beta, real theta){
    
  }
}
data {}
transformed data {
  int N = 20; // Number of Samples
  real alpha = 3.0;
  real sigma = 3.0;
  real theta = 2.0
}
parameters {}
model {}
generated quantities {
  real y[N];
  
  for(n in 1:N){
    y = weibullCure_rng(alpha, beta, theta)  
  }  
  
}