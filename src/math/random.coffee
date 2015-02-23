module.exports.Random = class Random
  # Uniform distribution
  @uniform: (min, max) ->
    return Math.random() * (max - min) + min;
  
  # Normal distribution, Gaussian distribution
  ## Box-Muller's method
  @norm: (mean, variance) ->
    rv1 = 1 - Math.random();
    rv2 = 1 - Math.random();
    if(0.5 - Math.random() > 0)
      return Math.sqrt(-2 * Math.log(rv1)) * Math.sin(Math.PI * 2 * rv2) * variance + mean;
    else
      return Math.sqrt(-2 * Math.log(rv1)) * Math.cos(Math.PI * 2 * rv2) * variance + mean;

  # Chi-squared distribution
  @chi: (k) ->
    ans = 0
    rv1 = 1 - Math.random();
    rv2 = 1 - Math.random();
    for i in [1..k]
      z = Math.sqrt(-2 * Math.log(rv1)) * Math.sin( 2.0 * Math.PI * rv2);
      ans += z * z;
    return ans

  # Cauchy distribution
  @cauchy: (mean, gamma) ->
    rv1 = 0.5 - Math.random();
    return mean + gamma * Math.tan(Math.PI * rv1);

  # Lognormal distribution
  @lognorm: (mean, variance) ->
    z = this.norm(mean, variance)
    return Math.exp(z);

  # Inverse gaussian distribution
  @igauss: (mean, lambda) ->
    rv = 1 - Math.random();
    x = this.chi(1)
    y = (mean + 0.5 * x * mean * mean/lambda) - ((0.5 * mean/lambda) * Math.sqrt(5 * mean * lambda * x + mean * mean * x * x)); 
     
    if( rv < mean / (mean + y) )
      return y;
    else
      return mean*mean/y;
  # Gamma distribution
  @gamma: (theta, kappa) ->
    int_kappa  = Math.floor(kappa);
    frac_kappa = kappa - int_kappa;
     
    x_int = 0;
    for i in [1..int_kappa]
      rv = 1 - Math.random();
      x_int += -Math.log(1 -rv);
     
    if(Math.abs(frac_kappa) < 0.01 )
      x_frac=0;
  
    else
      b=(Math.exp(1) + frac_kappa)/Math.exp(1);
      while(true)
        u = 1 - Math.random();
        p = b * u;
        uu = 1 - Math.random();
         
        if(p<=1.0)
          x_frac = Math.pow(p,1.0/frac_kappa);
          if(uu <= Math.exp(-x_frac))
            break;
        else
          x_frac =- Math.log((b-p)/frac_kappa);
          if(uu <= Math.pow(x_frac,frac_kappa-1.0))
            break;
     
    return (x_int + x_frac) * theta;
