========= #naivebayes in Diabetes ==============================================================
packageurl <- "https://cran.r-project.org/bin/windows/contrib/3.5/naivebayes_0.9.1.zip"
install.packages(packageurl, repos=NULL, type="source")

library(naivebayes)
library(e1071)

dataDIABETES <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes1.csv", head=TRUE, sep=";")
model <- naiveBayes(Diabetes ~ ., data = dataDIABETES)
predict(model, dataDIABETES[1:10,-1])
predict(model, dataDIABETES[1:10,-1], type = "raw")
pred <- predict(model, dataDIABETES[,-1])
table(pred, dataDIABETES$Diabetes)

#plotear
nb <- naive_bayes(Diabetes ~ ., data = dataDIABETES)
plot(nb, ask = TRUE)

plot(nb, which = c(1, 2), ask = TRUE,
arg.num = list(col = 1:8, lty = 1, main = "Naive Bayes Plot"))
plot(nb, which = "New", arg.cat = list(color = 4:7))

================================================================================================
#naivebayes in Diabetes - cbind

detalle de la base de datos:

   [1. Number of times pregnant]
   [2. Plasma glucose concentration a 2 hours in an oral glucose tolerance test]
   [3. Diastolic blood pressure (mm Hg)]
   [4. Triceps skin fold thickness (mm)]
   [5. 2-Hour serum insulin (mu U/ml)]
   [6. Body mass index (weight in kg/(height in m)^2)]
   [7. Diabetes pedigree function]
   [8. Age (years)]
   [9. Class variable (0 or 1)]

dataDIABETES <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes1.csv", head=TRUE, sep=";")
dataDIABETES2 <- cbind(dataDIABETES, New = sample(letters[1:8], 768, TRUE))

nb <- naive_bayes(Diabetes ~ ., data = dataDIABETES)
plot(nb, ask = TRUE)

plot(nb, which = c(1, 2), ask = TRUE,
arg.num = list(col = 1:8, lty = 1, main = "Naive Bayes Plot"))
plot(nb, which = "New", arg.cat = list(color = 4:7))


================================================================================================
#solo para plotear
dataDIABETES <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes1.csv", head=TRUE, sep=";")
plot(dataDIABETES$Diabetes,
ylim=c(0,200),
main="Diabetes",
xlab="Month of Year",
ylab="Rainfall (mm)",
pch=1,col="red")
points(dataDIABETES$Glucose,pch=2,col="gray")
points(dataDIABETES$BMI,pch=6,col="blue")
legend("right",
legend=c("Glucose","BMI"),
ncol=1,
cex=0.8,
bty="n",
pch=1:10)