#knn
RawData <- read.table("diabetes.data",sep = ",",header=FALSE)
RawData <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes1.csv", head=TRUE, sep=";")

responseY <- as.matrix(RawData[,dim(RawData)[2]])
predictorX <- as.matrix(RawData[,1:(dim(RawData)[2]-1)])


pca <- princomp(predictorX, cor=T) # principal components analysis using correlation matrix
pc.comp <- pca$scores
pc.comp1 <- -1*pc.comp[,1]
pc.comp2 <- -1*pc.comp[,2]



library(class)
X.train <- cbind(pc.comp1, pc.comp2)
model.knn <- knn(train=X.train, test=X.train, cl=responseY, k=19, prob=T)

plot(model.knn, X.train, pch=16,xlab="Talla en cm", ylab="Año de egreso")
plot(model.knn, method="graph")

featurePlot(x=RawData[,1:8], y=RawData[,9], plot="pairs", auto.key=list(columns=3))
featurePlot(x=RawData[,1:4], y=RawData[,5], plot="density", scales=list(x=list(relation="free"), y=list(relation="free")), auto.key=list(columns=3)


=========================================================================================================
#Redes neurales

iris <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes1.csv", head=TRUE, sep=";")

data(iris)
head(iris)

fold.test <- sample(nrow(iris), nrow(iris) / 3)
test <- iris[fold.test, ]
train <- iris[-fold.test, ]

ann <- neuralnet(as.numeric(Species) ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, train, hidden = c(10,5))
ann

plot(ann, rep = "best")

par(mfrow=c(2,2))
gwplot(ann, selected.covariate = "Sepal.Length")
gwplot(ann, selected.covariate = "Sepal.Width")
gwplot(ann, selected.covariate = "Petal.Length")
gwplot(ann, selected.covariate = "Petal.Width")

output <- compute(ann, test[ , c("Sepal.Length", "Sepal.Width", 
                                 "Petal.Length", "Petal.Width")])

result <- data.frame(
  Real = test$Species, 
  Predicted = levels(iris$Species)[round(output$net.result)])
result

table(result$Predicted, result$Real)