#obtenemos los cluster

res<-kmeans(diabetes,3)

res$cluster
res$centers
res$tooss
res$withinss
res$tot.withinss
res$betweenss
res$size
res$iter
res$ifault

kmeans(diabetes, centers, iter.max = 10, nstart = 1,
algorithm = c("Hartigan-Wong", "Lloyd", "Forgy","MacQueen"),
trace=FALSE)

OK_9781784390860-R_FOR_DATA_SCIENCE
========================================================
In R programming, we have clustering tools for:

• K-means clustering
• K-medoids clustering
• Hierarchical clustering
• Expectation-maximization
• Density estimation
================K-medoids clustering=====================
#K-medoid clustering is calculated in R programming with the pam function:
library(cluster)
result <- pam(diabetes, 3, FALSE, "euclidean")
plot(result$data, col=result$clustering)
summary(result)

fit <- Mclust(data)
summary(fit)
plot(fit)

===========================================================
http://www.statmethods.net/advstats/cluster.html

# Prepare Data
mydata <- na.omit(mydata) # listwise deletion of missing
mydata = data[,-9]


diabetes <- scale(mydata)# standardize variables


library(cluster) 
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, 
  	labels=2, lines=0)