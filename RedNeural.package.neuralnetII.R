# Data
library(neuralnet)
n     <- sample(1:150,20)
Train <- iris[-n,]
Test  <- iris[n,]
clase <- c("setosa","versicolor","virginica")
 
 
# Class
Train$setosa     <- ifelse(Train$Species == "setosa"     , TRUE, FALSE)
Train$versicolor <- ifelse(Train$Species == "versicolor" , TRUE, FALSE)
Train$virginica  <- ifelse(Train$Species == "virginica"  , TRUE, FALSE)
 
 
# Form
form <- as.formula(paste("setosa+versicolor+virginica ~ ", #variables a Predecir
                         paste(names(within(
                           Train,rm(Species,
                                    setosa,
                                    versicolor,
                                    virginica))), #Variables no predictoras a eliminar
                           collapse="+") ))
 
 
# Model
model.net <- neuralnet(form,
                        data      = Train, 
                        algorithm = "rprop+", # ver nota sobre rprop+
                        threshold = 0.1,      # ver nota sobre threshold
                        hidden    = 3         # ver nota sobre hidden
                        )
 
 
# Prediction
predict_prb        <- as.data.frame(compute(model.net, within(Test,rm(Species)))$net.result)
names(predict_prb) <- clase
predict_class      <- colnames(predict_prb)[apply(predict_prb,1,which.max)]
 
 
 
# Matriz confution
(MC <- table(Test$Species,predict_class))
 
 
# Plot
plot(model.net)