getwd()
library(sas7bdat)
library(tidyverse)
asthma <- read.sas7bdat("/home/guanshim/Kaggle/twosigma2018/longitudinal_homework/HW7/asthma_data.sas7bdat")
write.csv(asthma, "/home/guanshim/Kaggle/twosigma2018/longitudinal_homework/HW7/asthma.csv")

# means
colnames(asthma)
mean_asthma <- asthma %>% select(l1mmaxpm25, temperature, 
                                 humidity, asthma, l1cold) %>% na.omit()  %>% colMeans()
mean_asthma
# 1st quantiles
quan1_asthma <- asthma %>% select(l1mmaxpm25, temperature, 
                                  humidity, asthma, l1cold) %>% na.omit()  %>% apply(., 2, function(x){
                                    quantile(x, 0.25)}) 
quan1_asthma


## results from sas
# intercept for k = 2, 3, 4, and 5

############### l1mmaxpm25 temperature humidity l1cold ################
beta0 <- c(-2.2276, -3.0251, -3.8535, -4.7495)
# covariates
betas <- c(0.002118, -0.00497, -0.00260, 1.8464)
# predictors
mean_sas <- c(22.5505703, 41.8995519, 38.7578728, 1)
q1_sas <- c(12.0000000, 33.3333333, 27.9583333, 1)

## p >= 1 == 1
cum_mean <- exp(beta0)*exp(sum(betas*mean_sas) )/ (1 + exp(beta0)*exp(sum(betas*mean_sas) ))
## individual p 
p_mean <- c(1, cum_mean) - c(cum_mean, 0)
p_mean
sum(p_mean)

## for q1
cum_q1 <- exp(beta0)*exp(sum(betas*q1_sas) )/ (1 + exp(beta0)*exp(sum(betas*q1_sas) ))
p_q1 <- c(1, cum_q1) - c(cum_q1, 0)
p_q1
sum(p_q1)




