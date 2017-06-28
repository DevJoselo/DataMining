#DataTest
age <- c(23, 23, 23, 23, 26, 28, 33, 33, 34, 35, 37, 37, 38, 38, 40)
height <- c(180, 170, 191, 179, 172, 181, 181, 160, 154, 178, 187, 172, 175, 166, 177)
weight <- c(80, 72, 115, 71, 74, 91, 110, 70, 51, 80, 86, 82, 80, 60, 70)

#Funtions of ascending order
sort(age)
sort(height)
sort(weight)

#Results of each case
sort(age)
 [1] 23 23 23 23 26 28 33 33 34 35 37 37 38 38 40

sort(height)
 [1] 154 160 166 170 172 172 175 177 178 179 180 181 181 187 191

sort(weight)
 [1]  51  60  70  70  71  72  74  80  80  80  82  86  91 110 115

#Central tendency measures 

#Mean
Media <- mean(age)
Media
[1] 31.4

#Median
Mediana <- median(age)
Mediana
[1] 33

#Mode
moda <- function(x) {
	z <- table(as.vector(x));
	names(z)[z == max(z)]
	}

#Mode Age
moda(age)
[1] "23"
 
#Minimum value
min(age)
[1] 23

#Maximum value
max(age)
[1] 40

*********************
#Mean
Media <- mean(height)
Media
[1] 174.8667

#Median
Mediana <- median(height)
Mediana
[1] 177


#Mode
moda <- function(x) {
	z <- table(as.vector(x));
	names(z)[z == max(z)]
	}

moda(height)
[1] "172" "181"

#Min
min(height)
[1] 154

#Max
max(height)
[1] 191


*********************
#Mean
Media <- mean(weight)
Media
[1] 79.46667


#Median
Mediana <- median(weight)
Mediana
[1] 80


#Mode
moda <- function(x) {
	z <- table(as.vector(x));
	names(z)[z == max(z)]
	}
moda(weight)
[1] "80"

#Min
 min(weight)
[1] 51

#Max
max(weight)
[1] 115

****************************
#some function
mean, median, min, max, summary, var, sd, IQR, plot, hist, boxplot, scatterplot

Dispersion measure
- range
- quantiles
- 1st and 3rd Quartile
- Interquartile Range
- variance
- standard deviation

#range
rango <- xmax-xmin

range(age)
[1] 23 40

range(height)
[1] 154 191

range(weight)
[1]  51 115

#1st and 3rd Quartile
summary(age)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   23.0    24.5    33.0    31.4    37.0    40.0 

summary(height)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  154.0   171.0   177.0   174.9   180.5   191.0 

summary(weight)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  51.00   70.50   80.00   79.47   84.00  115.00 


#Interquartile Range

IQR(age)
[1] 12.5

IQR(height)
[1] 9.5

IQR(weight)
[1] 13.5


#Variance
s2 <- var(age)
s2
[1] 40.82857

#Standard deviation
s <- sqrt(s2)
[1] 6.389724


#Variance
s2 <- var(height)
s2
[1] 93.98095

#Standard deviation
s <- sqrt(s2)
s
[1] 9.694377


#Variance
s2 <- var(weight)
s2
[1] 278.8381

#Standard deviation
s <- sqrt(s2)
s
[1] 16.69845

#Histogram
hist(age)
hist(height)
hist(weight)

#BoxPlot
boxplot(age)
boxplot(height)
boxplot(weight)

#Plot
x <- height
y <- weight
plot(x,y,xlab="eje x",ylab="eje y", main="Plot Example", col=10, pch=7)


#Quantile
quantile(age,  probs = c(25, 50, 75)/100)
 25%  50%  75% 
24.5 33.0 37.0 

quantile(height,  probs = c(25, 50, 75)/100)
  25%   50%   75% 
171.0 177.0 180.5 

quantile(weight,  probs = c(25, 50, 75)/100)
 25%  50%  75% 
70.5 80.0 84.0 