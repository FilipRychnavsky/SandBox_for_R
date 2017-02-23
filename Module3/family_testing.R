##Critical t values in R
##For a 2 - sided test(say with 99 % confidence) you can use the critical value
abs(qt(0.01 / 2, 40)) # 99% confidence, 2 sided

#The critical value of the two-sided t-statistic at 480 degrees of freedom is 1.96. The t-ststistic of 0.35 is smaller than this critical value.
abs(qt(0.05 / 2, 480))
