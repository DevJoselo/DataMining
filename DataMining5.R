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


> #The code
dataDIABETES <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes1.csv", head=TRUE, sep=";")
library(RWeka) 
library(randomForest) 
library(party) 
if(require(mlbench, quietly = TRUE) && require(party, quietly = TRUE)) 
m1 <- J48(Diabetes~., data = dataDIABETES) 
m1
summary(m1) 
plot(m1) 
predictions <- predict(m1, dataDIABETES[,1:8])
table(predictions, dataDIABETES$Diabetes)

===============================================================================
#J48
# load the package
library(RWeka)
# load data
dataDIABETES <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes1.csv", head=TRUE, sep=";")
dataDIABETES
# fit model
fit <- J48(Diabetes~., data=dataDIABETES)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, dataDIABETES[,1:8])
# summarize accuracy
table(predictions, dataDIABETES$Diabetes)
# plot
m1 <- J48(Diabetes~., data = dataDIABETES)
if(require("party", quietly = TRUE)) plot(m1)



dataDIABETES %>% 
  ggvis(x = input_select(c('Glucose', 'Diabetes'), map = as.name)) %>% 
  layer_points(y = ~Glucose, fill = ~Diabetes)



dataDIABETES %>% 
  ggvis(x = input_select(c('BMI', 'Glucose'), map = as.name)) %>% 
  layer_points(y = ~BMI, fill = ~Diabetes)

dataDIABETES %>%
ggvis( x = ~BMI, y = ~Glucose, fill := “red” ,size := 300, opacity := 0.3 ) %>%
layer_points()

  dataDIABETES %>% 
  ggvis(x = input_select(c('BMI', 'Glucose'), map = as.name)) %>% 
  layer_points(y = ~BMI, fill = ~Diabetes)



ggvis(dataDIABETES, props(x = ~Diabetes, y = ~Age)) +
  layer_point(props(fill = ~factor(cyl)))

ggvis(dataDIABETES, by_group(cyl), props(x = ~Diabetes, y = ~Age)) +
  layer_point(props(fill = ~factor(cyl))) +
  layer_smooth(method = "lm", props(stroke = ~factor(cyl)))

===============================================================================
#Trabajo de mineria de datos - clasificación

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

#sub <- c(sample(1:192, 96), sample(193:384, 96), sample(385:576, 96), sample(577:768, 96))
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
#CONSIDEDAR TMB EL GENERICO{****}

diabetes.pred <- predict(diabetes.prune,type="class")
table(diabetes.pred,dataDIABETES$Diabetes)

#AQUI ESTA EL GENERICO{****}
g <- runif(nrow(dataDIABETES))
diabetesr <- dataDIABETES[order(g),]
diabetesr <- dataDIABETES[order(g),]
str(diabetesr)
m3 <- rpart(Diabetes ~ Pregnancies + ., data=diabetesr[1:500,], method="class")
m3
rpart.plot(m3)
#rpart.plot(m3, type=3, extra=101, fallen.leaves=T)