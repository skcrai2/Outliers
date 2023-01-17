#let's load the library and the data and take a look at it

library(faraway)
require(faraway)
data(sat)
head(sat)

#now we have to make some changes to the data to check our assumptions

by.math <- sat[order(sat$math),]
by.verbal <- sat[order(sat$verbal),]
by.salary <- sat[order(sat$salary),]
attach(sat)
out <- lm(total ~ expend + ratio + salary + takers)
summary(out)

#Use studentized residuals (also called jackknife residuals, or cross-validated residuals)

asdf <- rstudent(out)
asdf[which.max(abs(asdf))]

#The studentized residual with the largest magnitude is -3.124428. Comparing that to the critical value for 
#a two-tailed family error rate of 5%

qt(0.05/(50*2), 44)

##### Bonferroni adjustment… 44 = n-p-1 = 50 -5-1 (n=# of records, p=#of model parameters)

#Conclude the 48th record (West Virginia) is not an outlier