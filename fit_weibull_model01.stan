data{
  int N;
  real y[N];
}
parameters{
  real<lower=0> alpha;
  real<lower=0> sigma;
}
model{
  y~weibull(alpha, sigma);
}
