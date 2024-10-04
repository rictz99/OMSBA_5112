install.packages(tidyverse)
install.packages(haven)



library(tidyverse)
library(haven)


#create database nfhs
nfhs <- read_dta("IAHR52FL.dta")

#Create smaller database
nfhs_new <-  select(nfhs, hhid:shstruc)




