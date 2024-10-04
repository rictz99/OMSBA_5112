install.packages(tidyverse)
install.packages(haven)



library(tidyverse)
library(haven)


#create database nfhs
nfhs <- read_dta("IAHR52FL.dta")

#Create smaller database
nfhs_new <-  select(nfhs, hhid:shstruc)


# New database for Urban Households
nfhs_urban <- filter(nfhs_new, hv025 == 2)

#install ggplot2
library(ggplot2)

#Boxplot for distribution of household by type of urban area
ggplot(nfhs_urban, aes(x = "Urban", y = hv009)) +
  geom_boxplot() +
  labs(title = "Household Size Distribution in Urban Areas",
       x = "Type of Area",
       y = "Household Size") +
  theme_minimal()


#Group by type of urban area (hv025) and calculate mean and median houshold size

# Load the dplyr package
library(dplyr)

nfhs_urban_summary <- nfhs %>%
  group_by(hv026) %>%
  summarise(
    mean_household_size = mean(hv009, na.rm = TRUE),
    median_household_size = median(hv009, na.rm = TRUE)
  )
  
nfhs_urban_summary <- nfhs_urban_summary %>%
  mutate(urban_area_type = case_when(
    hv026 == 0 ~ "Large City",
    hv026 == 1 ~ "Small City",
    hv026 == 2 ~ "Town"
  ))




