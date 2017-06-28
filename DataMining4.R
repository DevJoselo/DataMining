sc <- read.table("D:\\Rtmp\\synthetic_control.data", header=F, sep=" ")

str(iris)
d(1234)
ind <- sample(2,nrow(iris), replace =TRUE, prob = c(0.7, 0.3))
train.data <- iris[ind == 1, ]
test.data <- iris[ind == 2, ]
library(party)
install.packages('party')
library(party)
myFormula <-Species ~ Sepal.Length + Sepal.Width +Petal.Length + Petal.Width
iris_ctree <- ctree(myFormula, data = train.data)
table(predict(iris_ctree), train.data$Species)
print(iris_ctree)
plot(iris_ctree)

===============================================================================

dataDIABETES <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes1.csv", head=TRUE, sep=";")
str(dataDIABETES)
d(1234)

ind <- sample(2,nrow(dataDIABETES), replace =TRUE, prob = c(0.7, 0.3))
train.data <- dataDIABETES[ind == 1, ]
test.data <- dataDIABETES[ind == 2, ]
library(party)
install.packages('party')
library(party)
myFormula <-Diabetes ~ .
diabetes_ctree <- ctree(myFormula, data = train.data)
table(predict(diabetes_ctree), train.data$Diabetes)
print(diabetes_ctree)
plot(diabetes_ctree)

===============================================================================
# load the package
library(rpart)
# load data
data(iris)
# fit model
fit <- rpart(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="class")
# summarize accuracy
table(predictions, iris$Species)

===============================================================================
require(rpart)
require(rpart.plot)

data(iris)
str(iris)

table(iris$Species)

head(iris)

set.seed(9850)
g <- runif(nrow(iris))
irisr <- iris[order(g),]

irisr <- iris[order(g),]
str(irisr)

m3 <- rpart(Species ~ Sepal.Length + ., data=irisr[1:100,], method="class")
m3

rpart.plot(m3)

rpart.plot(m3, type=3, extra=101, fallen.leaves=T)
p3 <- predict(m3, irisr[101:150,],type="class")
table(irisr[101:150,5],predicted=p3)
table(irisr[101:150,5],rpart_predicted=p3)
table(irisr[101:150,5],C5.0_predicted=p3)

===============================================================================
PLOTEAR EN 3D
http://www.sthda.com/english/wiki/impressive-package-for-3d-and-4d-graph-r-software-and-data-visualization

===============================================================================

install.packages('rpart')
install.packages('rpart.plot')

require(rpart)
require(rpart.plot)

dataDIABETES <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes1.csv", head=TRUE, sep=";")

summary(dataDIABETES)

data(dataDIABETES)
str(dataDIABETES)

table(dataDIABETES$Diabetes)

head(dataDIABETES)

set.seed(9850)
g <- runif(nrow(dataDIABETES))
diabetesr <- dataDIABETES[order(g),]
str(diabetesr)

myFormula <- rpart(Diabetes ~ Pregnancies + ., data=diabetesr[1:614,], method="class")
myFormula

#formula: This is a formula object defining the attribute to predict and the
#feature used to predict. The formula is defined by a string such as
#outcome ~ feature1 + feature2 + feature3.

rpart.plot(myFormula)
rpart.plot(myFormula, type=0, extra=101, fallen.leaves=T)

#matrix de confusión
p1 <- predict(myFormula, diabetesr[1:768,],type="class")
table(diabetesr[1:768,9],predicted=p1)

#predicción
p3 <- predict(myFormula, diabetesr[614:768,],type="class")
table(diabetesr[614:768,9],predicted=p3)

#podando
myFormulaPoda <-prune(myFormula, cp=0.019953)
print(myFormulaPoda)
#par(mar = rep(0.1, 4))
rpart.plot(myFormulaPoda)
#text(myFormulaPoda, cex=0.8)



library(partykit)
tree_party<-as.party(myFormulaPoda)
print(tree_party, header=FALSE)

#table(diabetesr[101:150,9],rpart_predicted=p3)
#table(diabetesr[101:150,9],C5.0_predicted=p3)

===============================================================================
> myFormula <-Diabetes ~ Sepal.Length + Sepal.Width +Petal.Length + Petal.Width
> myFormula <-Diabetes ~ .

myForm <- rpart(Diabetes ~ Pregnancies + Glucose + Bloodpressure + Skinfold + Insulin + BMI + Diabetespedigree + Age)
dia_ctree <- ctree(myFormula, data =train.data)
table(predict(dia_ctree), dbDi$Diabetes)

, data=diabetesr[1:500,], method="class")
> iris_ctree <- ctree(myFormula, data = train.data)
> table(predict(iris_ctree), train.data$Species)

===============================================================================
require(rpart)
set.seed(123456)
diabetes.rp <- rpart(Diabetes ~ ., method="class", data=dbDi, control=rpart.control(minsplit=4,cp=0.000001))
diabetes.prune <- prune(diabetes.rp,cp=0.1)
diabetes.pred <- predict(diabetes.prune,type="class")
table(diabetes.pred,dbDi$Diabetes)

===============================================================================
require(rpart)
set.seed(123456)
iris.rp <- rpart(Species ~ ., method="class", data=iris, control=rpart.control(minsplit=4,cp=0.000001))
summary(iris.rp)
plot(iris.rp)
text(iris.rp)


require(lattice)
trellis.par.set(col.whitebg())

xyplot(Petal.Width~Petal.Length,iris,groups=Species,pch=16,
col=c("red","green","blue"),
panel=function(x,y,groups,...){
panel.superpose(x,y,groups,...)
panel.abline(v=2.45,lty=2)
panel.segments(2.45,1.75,max(x)*2,1.75,lty=2)
panel.segments(4.95,min(y)*-2,4.95,1.75,lty=2)
panel.segments(2.45,1.65,4.95,1.65,lty=2)
panel.segments(4.95,1.55,max(x)*2,1.55,lty=2)
},
key=list(columns=3,col=c("red","green","blue"),
text=list(c("setosa","versicolor","virginica"))))

printcp(iris.rp)
#Classification tree:
rpart(formula = Species ~ Sepal.Length + Sepal.Width + Petal.Length +
Petal.Width, data = iris, method = "class",
control = rpart.control(minsplit = 4, cp = 1e-05))

with(iris.rp,plot(cptable[,3],xlab="Tree Number",
ylab="Resubstitution Error (R)",type="b"))

with(iris.rp,plot(cptable[,4],xlab="Tree Number",
ylab="Cross-Validated Error (R(cv))",type="b"))

plotcp(iris.rp)
with(iris.rp, {
lines(cptable[,2]+1,cptable[,3],type="b",col="red")
legend(locator(1),c("Resub. Error","CV Error","min(CV Error)+1SE"),
lty=c(1,1,2),col=c("red","black","black"),bty="n")
})

iris.prune <- prune(iris.rp,cp=0.1)
summary(iris.prune)

plot(iris.prune)
text(iris.prune)

require(lattice)
trellis.par.set(theme=col.whitebg())
xyplot(Petal.Width~Petal.Length,iris,groups=Species,pch=16,
col=c("red","green","blue"),main="Partitioned Plot",
panel=function(x,y,groups,...){
panel.superpose(x,y,groups,...)
panel.abline(v=2.45,lty=2)
panel.segments(2.45,1.75,max(x),1.75,lty=2)
},
key=list(columns=3,col=c("red","green","blue"),
text=list(c("setosa","versicolor","virginica"))))


iris.pred <- predict(iris.prune,type="class")
table(iris.pred,iris$Species)

plot.rpart(iris.prune,main="Version A")
text.rpart(iris.prune)



===============================================================================
data(dbDi)
str(dbDi)
table(dbDi$Diabetes)
head(dbDi)

set.seed(9850)
set.seed(123456)

diab.rp <- rpart(Diabetes ~ ., method="class", data=dbDi, control=rpart.control(minsplit=7,cp=0.000001))
summary(diab.rp)

> plot(diab.rp)
> text(diab.rp)
> require(lattice)
> trellis.par.set(col.whitebg())

diab.prune <- prune(diab.rp,cp=0.1)
summary(diab.prune)

> plot(diab.prune)
> text(diab.prune)


diab.pred <- predict(diab.prune,type="class")
table(diab.pred,dbDi$Diabetes)

rpart.plot(diab.prune)



===============================================================================

Fitting the Model
The function rpart() is used to fit the decision tree. It is comprised of the following arguments that you can extract from the help file.


#formula y = x1+x2+x3+. . .
#data data where the above variables can be found
#na.action Default: omits observations with missing data in y
#method class or anova
#parms priors and loss matrix (class only)
#control parameters that control the model fitting

The model is controlled by the function rpart.control(). Arguments to this function are outlined below.

#minsplit minimum no. of observations in a node before a split occurs
#cp complexity parameter
#usesurrogate How to use surrogates for missing data:
			0 = display only
			1 = use surrogates to split variables with missing data.
			If all are missing, no split is created.
			2 = Breimans surrogate rule.
===============================================================================

Recursive Partitioning and Regression Trees
install.packages('rpart')
install.packages('rpart.plot')

dataDIABETES <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes.csv", head=TRUE, sep=";")

require(rpart)
require(rpart.plot)
data(dataDIABETES)
str(dataDIABETES)
table(dataDIABETES$Diabetes)
head(dataDIABETES)

set.seed(9850)
set.seed(123456)

sub <- c(sample(1:192, 96), sample(193:384, 96), sample(385:576, 96), sample(577:768, 96))
diabetes.rp <- rpart(Diabetes ~ ., method="class", data=dataDIABETES, control=rpart.control(minsplit=4,cp=0.000001))
summary(diabetes.rp)

#plot(diabetes.rp)
#text(diabetes.rp)

#require(lattice)
#trellis.par.set(col.whitebg())

diabetes.prune <- prune(diabetes.rp,cp=0.1)
# cp=.02 because want small tree for demo
summary(diabetes.prune)

print(diabetes.prune)
rpart.plot(diabetes.prune)

diabetes.pred <- predict(diabetes.prune,type="class")
table(diabetes.pred,dataDIABETES$Diabetes)

g <- runif(nrow(dataDIABETES))
diabetesr <- dataDIABETES[order(g),]
diabetesr <- dataDIABETES[order(g),]
str(diabetesr)
m3 <- rpart(Diabetes ~ Pregnancies + ., data=diabetesr[1:500,], method="class")
m3
rpart.plot(m3)
#rpart.plot(m3, type=3, extra=101, fallen.leaves=T)


===============================================================================
http://machinelearningmastery.com/non-linear-classification-in-r-with-decision-trees/

library(RWeka)
library(party)
str(dataDIABETES)

m1 <- J48(Diabetes~., data = dataDIABETES)
if(require("party", quietly = TRUE)) plot(m1)


===============================================================================
Pima Indians Diabetes Data Set
http://archive.ics.uci.edu/ml/datasets/Pima+Indians+Diabetes
===============================================================================

<
	1. Title: Pima Indians Diabetes Database

	2. Sources:
	   (a) Original owners: National Institute of Diabetes and Digestive and
	                        Kidney Diseases
	   (b) Donor of database: Vincent Sigillito (vgs@aplcen.apl.jhu.edu)
	                          Research Center, RMI Group Leader
	                          Applied Physics Laboratory
	                          The Johns Hopkins University
	                          Johns Hopkins Road
	                          Laurel, MD 20707
	                          (301) 953-6231
	   (c) Date received: 9 May 1990

	3. Past Usage:
	    1. Smith,~J.~W., Everhart,~J.~E., Dickson,~W.~C., Knowler,~W.~C., \&
	       Johannes,~R.~S. (1988). Using the ADAP learning algorithm to forecast
	       the onset of diabetes mellitus.  In {\it Proceedings of the Symposium
	       on Computer Applications and Medical Care} (pp. 261--265).  IEEE
	       Computer Society Press.

	       The diagnostic, binary-valued variable investigated is whether the
	       patient shows signs of diabetes according to World Health Organization
	       criteria (i.e., if the 2 hour post-load plasma glucose was at least 
	       200 mg/dl at any survey  examination or if found during routine medical
	       care).   The population lives near Phoenix, Arizona, USA.

	       Results: Their ADAP algorithm makes a real-valued prediction between
	       0 and 1.  This was transformed into a binary decision using a cutoff of 
	       0.448.  Using 576 training instances, the sensitivity and specificity
	       of their algorithm was 76% on the remaining 192 instances.

	4. Relevant Information:
	      Several constraints were placed on the selection of these instances from
	      a larger database.  In particular, all patients here are females at
	      least 21 years old of Pima Indian heritage.  ADAP is an adaptive learning
	      routine that generates and executes digital analogs of perceptron-like
	      devices.  It is a unique algorithm; see the paper for details.

	5. Number of Instances: 768

	6. Number of Attributes: 8 plus class 

	7. For Each Attribute: (all numeric-valued)
	   1. Number of times pregnant
	   2. Plasma glucose concentration a 2 hours in an oral glucose tolerance test
	   3. Diastolic blood pressure (mm Hg)
	   4. Triceps skin fold thickness (mm)
	   5. 2-Hour serum insulin (mu U/ml)
	   6. Body mass index (weight in kg/(height in m)^2)
	   7. Diabetes pedigree function
	   8. Age (years)
	   9. Class variable (0 or 1)

	8. Missing Attribute Values: Yes

	9. Class Distribution: (class value 1 is interpreted as "tested positive for
	   diabetes")

	   Class Value  Number of instances
	   0            500
	   1            268

	10. Brief statistical analysis:

	    Attribute number:    Mean:   Standard Deviation:
	    1.                     3.8     3.4
	    2.                   120.9    32.0
	    3.                    69.1    19.4
	    4.                    20.5    16.0
	    5.                    79.8   115.2
	    6.                    32.0     7.9
	    7.                     0.5     0.3
	    8.                    33.2    11.8
/>



library(kknn)
## Not run:
data(dataDIABETES)

(train.con <- train.kknn(Diabetes ~ ., data = dataDIABETES,
kmax = 25, kernel = c("rectangular", "triangular", "epanechnikov",
"gaussian", "rank", "optimal")))
plot(train.con)

(train.ord <- train.kknn(Diabetes ~ ., dataDIABETES, kmax = 25,
kernel = c("rectangular", "triangular", "epanechnikov", "gaussian",
"rank", "optimal")))
plot(train.ord)

(train.nom <- train.kknn(Diabetes ~ ., dataDIABETES, kmax = 25,
kernel = c("rectangular", "triangular", "epanechnikov", "gaussian",
"rank", "optimal")))
plot(train.nom)

## End(Not run)
data(glass)
glass <- glass[,-1]

(fit.glass1 <- train.kknn(Type ~ ., glass, kmax = 15, kernel =
c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 1))

(fit.glass2 <- train.kknn(Type ~ ., glass, kmax = 15, kernel =
c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 2))

plot(fit.glass1)
plot(fit.glass2)


MODELOS varios
=================Classification and Regression Trees====================

# load the package
library(rpart)
# load data
data(iris)
# fit model
fit <- rpart(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="class")
# summarize accuracy
table(predictions, iris$Species)

==================The following recipe demonstrates the C4.5 (called J48 in Weka)===================
# load the package
library(RWeka)
# load data
data(iris)
# fit model
fit <- J48(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)
=================PART====================
# load the package
library(RWeka)
# load data
data(iris)
# fit model
fit <- PART(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)
===============Bagging CART======================
# load the package
library(ipred)
# load data
data(iris)
# fit model
fit <- bagging(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="class")
# summarize accuracy
table(predictions, iris$Species)
===================Random Forest==================
# load the package
library(randomForest)
# load data
data(iris)
# fit model
fit <- randomForest(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)
===================Gradient Boosted Machine==================

# load the package
library(gbm)
# load data
data(iris)
# fit model
fit <- gbm(Species~., data=iris, distribution="multinomial")
# summarize the fit
print(fit)
# make predictions
predictions <- predict(fit, iris)
# summarize accuracy
table(predictions, iris$Species)

====================Boosted C5.0====================
# load the package
library(C50)
# load data
data(iris)
# fit model
fit <- C5.0(Species~., data=iris, trials=10)
# summarize the fit
print(fit)
# make predictions
predictions <- predict(fit, iris)
# summarize accuracy
table(predictions, iris$Species)