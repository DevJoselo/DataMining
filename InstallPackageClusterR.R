CLUSTERING
Using packages ClusterR
Gaussian Mixture Models, K-Means, Mini-Batch-Kmeans and K-Medoids Clustering


https://cran.r-project.org/web/packages/ClusterR/ClusterR.pdf


install.packages("ClusterR")
library("ClusterR")

data(iris)
dat=iris[,-5]
dat=center_scale(dat)

pca_dat=stats::princomp(dat)$scores[,1:2]
km = KMeans_rcpp(pca_dat, clusters = 3, num_init = 5, max_iters = 100)
plot_2d(pca_dat, km$clusters, km$centroids)