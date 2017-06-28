#clustering

> results <- kmeans(diabetes, 3)
> table(data$Diabetes, results$cluster)


plot(iris[c("Petal.Length", "Petal.Width")], col = results$cluster)
plot(iris[c("Petal.Length", "Petal.Width")], col = iris$Species)
plot(iris[c("Sepal.Length", "Sepal.Width")], col = results$cluster)
plot(iris[c("Petal.Length", "Sepal.Width")], col = results$cluster)
=======================================================================================================
=======================================================================================================
#import data
utilities = read.table("C:\\Users\\JL\\Downloads\\data\\dCluster.txt", head=TRUE, sep=";")

#normalización
z <- diabetes
m <- apply(z,2,mean)
s <- apply(z,2,sd)
z <- scale(z,m,s)

#distance euclidiana
distance <- dist(z)
distance
print(distance,digits=3)


#Cluster Dendrogram with Complete Linkage
hc.c <- hclust(distance)
plot(hc.c, labels=data$diabetes)
plot(hc.c, hang = -1) #only numbers

#Cluster Dendrogram with Average Linkage
hc.a <- hclust(distance, method = "average")
plot(hc.a, hang = -1)

#cluster Membership
member.c <-cutree(hc.c,3)
member.a <-cutree(hc.a,3)
table(member.c, member.a)

#Cluster Means
aggregate(z,list(member.c),mean)
aggregate(diabetes[,-c(1,1)],list(member.c),mean)

#Silhouette Plot
library(cluster)
plot(silhouette(cutree(hc.c,3),distance))

#Scree Plot (Número de Cluster en función de posibles resultados)
wss <- (nrow(z)-1)*sum(apply(z,2,var)) 
for (i in 2:20) wss[i] <- sum(kmeans(z, centers=i)$withinss)
plot(1:20, wss, type="b", xlab="Number of Clusters", ylab="Within group SS")

#K-Means Clustering
kc <- kmeans(z,3)
kc$totss

plot(Sales~D.Demand,utilities)
plot(Sales~D.Demand,utilities, col=kc$cluster)

========================================================================================

data <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv", sep=";")
data <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00292/Wholesale customers data.csv", sep=",")

library(NbClust)
set.seed(2365)
NbClust(diabetes, diss = NULL, distance = "euclidean", min.nc = 2, max.nc =8, method = "ward.D2", index = "all", alphaBeale = 0.1)

Optimal number of clusters (9781784390860-R_FOR_DATA_SCIENCE)
We can have R figure out the optimal number of clusters using the NbClust package.
The NbClust function runs over each of the number of clusters proposed using a
series of indices (30) that measure the centers and distances, tallying a vote of each
index set for a preferred number of clusters. The results clearly point to a majority
decision, such as "n indices recommend m clusters."
The NbClust function looks like the following:

========================================================================================
============optimal number of clusters


install.packages("NbClust")
library(NbClust)
set.seed(2365)
data <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes1.csv", head=TRUE, sep=";")
diabetes = data[,-9]
mydata = data[,-9]
diabetes <- scale(mydata)

#results <- kmeans(diabetes, 3)
#results$cluster
#results$size
nc <- NbClust(diabetes, min.nc=2, max.nc=8, method="kmeans")

###### Conclusion ######
According to the majority rule, the best number of clusters is  3 
###### del modelo nbclust se obtiene el numero de cluster 3

========================================================================================

library(mva)
library(cluster)

#Calcular disimilaridades 
#(con base en la distancia euclidiana):

diss <- daisy(diabetes)


#Particionar en tres clusters los estados usando la matriz de disimilaridades y solicitar 
#la componente clustering. 
#‘pam’ minimiza la suma de las disimilaridades:

clus <- pam(diss, 3, diss = TRUE)$clustering

#Graficar los clusters identificando 
#interactivamente puntos deseados

if(interactive())
clusplot(diss, clus, lines=3,diss = TRUE, 
color=TRUE,col.p="black",labels=1) 

========================================================================================

install.packages("car")
library(car)
scatterplotMatrix(data)
summary(diabetes)

#Correlation
cor(diabetes)

#Visualizing correlations
install.packages('corrgram')
library(corrgram)
corrgram(data)

#cluster dendogram with AU/BP values (%)
install.packages("pvclust")
library(pvclust)
pv <- pvclust(diabetes)
pv
plot(pv)

#grafico
library(car)
scatterplot(diabetes$Glucose, diabetes$BMI)

#cor plot
install.packages("corrplot")
library(corrplot)
corrplot(cor(diabetes), method="number", tl.cex=0.5)
========================================================================================

> kmeans.res<-kmeans(data,centers=3)
> table(data$Diabetes, kmeans.res$cluster)


km    <- kmeans(diabetes,3)
dissE <- daisy(diabetes)
dE2   <- dissE^2
sk2   <- silhouette(km$cl, dE2)
table(data$Diabetes, km$cluster)
plot(sk2)

library(cluster)
library(fpc)

dat <- iris[, -5] # without known classification 
# Kmeans clustre analysis
clus <- kmeans(dat, centers=3)
# Fig 01
plotcluster(diabetes, km$cluster)
clusplot(diabetes, km$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)
========================================================================================

Medoids clusters
There is another package available to estimate the number of clusters using
medoids, called fpc. Medoids use minimal dissimilarity to all objects in a cluster
as the determinant (as opposed to distance in kmeans). The pamk function looks
like the following:

========================================================================================
#otro modelo con 2 cluster

install.packages("fpc")
library(fpc)

best<-pamk(diabetes)
best

library(cluster)
plot(pam(diabetes,best$nc))

======================================================================================== 

datos <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv", sep=";")
datos <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00292/Wholesale customers data.csv", sep=",")
datos <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00246/3D_spatial_network.txt", sep=",")
https://archive.ics.uci.edu/ml/machine-learning-databases/00386/fma.txt

x <- mvrnorm(n=100, mu=c(5,5),Sigma=matrix(c(1/2,0,0,1/2),nrow=2,ncol=2))
y <- mvrnorm(n=100, mu=c(6.5,8),Sigma=matrix(c(1/2,0,0,1/2),nrow=2,ncol=2))
z <- mvrnorm(n=100, mu=c(8,5),Sigma=matrix(c(1/2,0,0,1/2),nrow=2,ncol=2))

datos<-rbind(Glucose, BMI, Age)
datos<-rbind(x,y,z)
plot(datos)

kmeans.res<-kmeans(diabetes,centers=3)
table(data$Diabetes, kmeans.res$cluster)

plot(diabetes,col=kmeans.res$cluster)
points(kmeans.res$centers,cex=2,col=11,pch=19)
points(matrix(colMeans(datos),nrow=1,ncol=2),cex=3,col=12,pch=19)
kmeans.res$totss
kmeans.res$betweenss
kmeans.res$tot.withinss

=======================================================================================================

> kmeans.res<-kmeans(diabetes,centers=3)
> table(data$Diabetes, kmeans.res$cluster)


 library(pheatmap)
> library(NbClust)
> set.seed(2365)
data <- read.csv("C:\\Users\\JL\\Downloads\\data\\diabetes1.csv", head=TRUE, sep=";")
mydata = data[,-9]
diabetes <- scale(mydata)


clst=hclust(dist(diabetes))
clst

Call:
hclust(d = dist(diabetes))
Cluster method   : complete 
Distance         : euclidean 
Number of objects: 768 

pheatmap(diabetes)