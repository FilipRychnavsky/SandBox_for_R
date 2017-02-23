comp.ci <- function(vec, quantile = 0.05) {
    ## Compute the upper and lower emperical quantiles
    lower <- quantile / 2.0
    upper <- 1.0 - lower
    c(quantile(vec, probs = lower, na.rm = TRUE),
    quantile(vec, probs = upper, na.rm = TRUE))
}

dist.summary <- function(dist, name, num.bins = 120) {
    ## function to plot and print a summary
    ## of the distribution  
    maxm <- max(dist)
    minm <- min(dist)
    bw <- (maxm - minm) / num.bins
    breaks <- seq(minm - bw / 2, maxm + bw / 2, by = bw)
    hist(dist, col = 'blue', breaks = breaks, xlab = name,
       main = paste('Distribution of ', name))

    std <- round(sd(dist), digits = 2)
    print(paste('Summary of', name, '; with std = ', std))
    print(summary(dist))
}

sim.normal <- function(num, mean = 600, sd = 30) {
    ## Simulate from a Normal distribution
    dist = rnorm(num, mean, sd)
    titl = paste('Normal: ', as.character(num), ' values')
    dist.summary(dist, titl)
    print('Empirical 95% CIs')
    print(comp.ci(dist))
    NULL
}

nums <- c(100, 1000, 10000, 100000)
lapply(nums, sim.normal)