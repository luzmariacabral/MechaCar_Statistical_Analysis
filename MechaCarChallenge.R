library(dplyr)
mechaCar_table <- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)  #importing MechaCar csv.
head(mechaCar_table)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data = mechaCar_table)  #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data = mechaCar_table))

#Deliverable 2 Suspension Coils
suspension_table <- read.csv('Suspension_Coil.csv', check.names = F, stringsAsFactors = F)  #importing Suspension coil csv.
head(suspension_table)
total_summary <- suspension_table %>% summarize(mean(PSI),median(PSI),sd(PSI),var(PSI))
total_summary
lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(mean(PSI),median(PSI),sd(PSI),var(PSI))
lot_summary

#Deliverable 3 t-test on suspension coils

t.test(subset(suspension_table, Manufacturing_Lot=='Lot1')$PSI,mu=1500) #compare sample v. population means
t.test(subset(suspension_table, Manufacturing_Lot=='Lot2')$PSI,mu=1500)
