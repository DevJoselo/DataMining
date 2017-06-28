# COLLECT -> CLEAN -> ANALYZE -> REPORT

name <- c("Any", "Pitt", "Frank","Julia","Katy")
age <- c(28, 30, 21, 39, 35)
child <- c(FALSE, TRUE, TRUE, FALSE, TRUE)

#data.frame
df <- data.frame(name, age, child)

mydata = read.csv("C:\\Users\\01\\Downloads\\dados.csv")

#accessing like a list
$
[]
[[]]

#Ejemplo accessing $
datos20-30 <- datos[datos$gpodeedad=="20a30" & datos$sexo =="hombre", 10]

texto = toupper(texto$V1)

texto_col = data.frame(d)
names(texto_col) = c("V1")

texto_col$V1 = sub("([[:cm:]])","",texto_col$V1)

strDates <- as.character(d)

transform(d, char = as.numeric(char))

df <- data.frame(a = I("a \" quote"))
scan(pipe("sed -e s/,$// data"), sep=",")

#
ESTRUCTURAS DE CONTROL
	IF, ELSE
	FOR
	WHILE
	REPEAT
	BREAK
	NEXT
***************************************
# if
if(condicion){
	##operacion1
} else if(condicion2){
	##operacion2
}else{
	##operacion3
}

#example:

r <- 3
if(r == 4){
	x <- 1
}else{
	x <- 3
	y <- 4
}

> r
[1] 3
> x
[1] 3
> y
[1] 4
*****************************************
#for
for (i in 1:10){
	print(i)
}

#example:

misLetras <- c("a", "b", "c", "d")
for (letras in misLetras) {
	print (letras)
}

x <- matrix(seq(1, 18, 2),3,3)

for (i in seq_len(nrow(x))) {
	for (j in seq_len(ncol(x))) {
		print(x[i,j])
	}
}

var <- 0
for (i in 1:10) {
	for (j in 1:5) {
		var <- var + j
	}
}

*****************************************
#while
while (condicion){
	#operaciones
}

#example
contador <- 0
while(contador < 10){
	print(contador)
	contador <- contador +2
}


a <- 5
while(a>=3 && a <= 10){
	print(a)
	moneda <-rbinom(1, 1, 0.5)

	if(moneda == 1){
		a <- a + 1
	} else {
		a <- a - 1
	}
}


*********************************************
#repeat
repeat{
	#operaciones
	if(condicion){
		#condiciones
	}
	else{
		break
	}
}

********************************************
#for
for (i in 1:100) {
	if(i < 20){
		next
	}
	print(i)
}

*********************************************
#funtions
nombreFuncion <- function(argumentos){
	#operaciones
}

formals(); regresa una lista de todos los arguemntos formales de una función

*********************************************

Argumento "..."
paste(); concatena

**************FUNCIONES*******************

operaciones <- function(x,y){
  return(x+y)
}

operaciones(2,3)

Googles R Style Guide
https://google.github.io/styleguide/Rguide.xml

EXPRECIONES REGULARES

> age <- c(23, 23, 23, 22.5, 20)
> grep("\\.", age)
[1] 4
> 

wwww.diegocalvo.es/expresioes-regulares-enr/

extraer numeros de una cadena usando R
extraer caractaer numerico R
extraer caractaer con R

-------------------------PY

datos <- read.csv("C:\\Users\\01\\Downloads\\dados.csv", head=TRUE) #hacer la lectura tipo csv desde R

fecha <- datos$IndicaÃ.Ã.o.de.data.e.hora
sexo <- datos$Qual.seu.sexo.
edad <- datos$Qual.sua.idade.
altura <- datos$Qual.sua.altura.
peso <- datos$Qual.seu.peso.
graduacion <- datos$Em.que.ano.concluiu.sua.graduaÃ.Ã.o.
salario <- datos$Qual.o.valor.bruto.do.seu.salÃ.rio.ou.bolsa.
celular <- datos$Quanto.custou.seu.celular.

-----------------------ALTURA

normalizarAltura <- function(altura){
	altura <- gsub("\\D","",altura) #Elimina todo aquello que no sea digito
	altura <- as.numeric(altura) #convierte a numerico
	return(altura)
}

altura2 <- normalizarAltura(altura)
altura <- altura2

-----------------------PESO
datos <- read.csv("C:\\Users\\01\\Downloads\\dados.csv", head=TRUE)

normalizarPeso <- function(peso){
	peso <- gsub("\\D","",peso) #Elimina todo aquello que no sea digito
	peso <- as.numeric(peso) #Convierte a numerico
	return(peso)
}

peso2 <- normalizarPeso(peso)

-----------------------SALARIO

EL OBJETIVO ES LIMPIAR LOS DATOS DE TAL MANERA QUE PUEDAN NOS PUEDA QUEDAR NUMEROS DE LA FORMA 6022,59 ó 10.000,00

datos <- read.csv("C:\\Users\\01\\Downloads\\dados.csv", head=TRUE)

normalizarSalario <- function(salario){
	salario<-substr(salario,1,11) 			#Extrae los 11 primeros caracteres
	salario<-gsub("[[:alpha:]]","",salario) #Elimina caracteres alfabeticos MAYUSCULA y minuscula
	salario<-gsub("\\$","",salario)			#Elimina el caracter $
	salario<-gsub("\\s","",salario)			#Elimina espacios
	salario<-gsub("\\.","",salario) 		#Elimina puntos, en nuestro caso hace referencia a mil
	salario<-gsub("\\,",".",salario) 		#Intercambia las comas por puntos
	salario<-as.numeric(salario) 			#Convierte a numerico
	salario<-round(salario)					#Redondea valor
	return(salario)
}

salario2 <- normalizarSalario(salario)

-----------------------CELULAR

normalizarCelular <- function(celular){
	celular<-gsub("[[:alpha:]]","",celular) #Elimina caracteres alfabeticos MAYUSCULA y minuscula
	celular<-gsub("\\$","",celular)			#Elimina el caracter $
	celular<-gsub("\\s","",celular)			#Elimina espacios
	celular<-gsub("\\,",".",celular) 		#Intercambia las comas por puntos
	celular<-as.numeric(celular) 			#Convertimos en numeric
	celular<-round(celular)					#Redondea valor
	return(celular)
}

celular2 <- normalizarCelular(celular)

fecha
sexo
edad
altura <- altura2
peso <- peso2
graduacion
salario <- salario2
celular <- celular2

fecha, sexo, edad, altura, peso, graduacion, salario, celular

normalizarRangos <- 

if( edad >= 23 && edad <= 99){
print ("Rango de edad estable")
}
if( normalizarAltura > 150 && normalizarAltura < 230 ){
print ("Rango de altura estable ")
}
if( normalizarPeso > 45 && normalizarPeso < 145 ){
print ("Rango de peso estable ")
}
if( graduacion > 2000 && graduacion <= 2016 ){
print ("Rango de graduacion estable")
}
if( normalizarSalario > 1000 && normalizarSalario < 15000 ){
print ("Rango de salario estable ")
}
if( normalizarCelular > 200 && normalizarCelular < 2000 ){
print ("Rango de celular estable ")
}
else{
print ("Revise")
}


	if( edad >= 23 && edad <= 99)
	if( altura > 150 && altura < 230 )
	if( peso > 45 && peso < 145 )
	if( graduacion > 2000 && graduacion <= 2016 )
	if( salario > 1000 && salario < 15000 )
	if( celular > 200 && celular < 2000 )

plot(edad,altura2,pch="23",xlab="Edad en años", ylab="Talla en cm")

Dataframe iris
plop(iris)
plot(iris$Sepal.Length, iris$Sepal.Width)

hist()

par()
param_orig <- par()
par(col.lab = "red")
hist(mtcars$mpg)

hist(mtcars$mpg,col.lab = "red")
plot(edad,graduacion,pch=16,xlab="Talla en cm", ylab="Año de egreso")

plot(sexo, edad, pch=16,xlab="Talla en cm", ylab="Año de egreso")
abline(regresion)

plot(sexo, edad, pch=16,xlab="Talla en cm", ylab="Año de egreso")
abline(regresion)

par(mfrow=c(1,1))
plot(edad,salario2,xlab="edad",ylab="salario")
plot(sexo,edad,xlab="sexo",ylab="edad") #grafico de dispercion
abline(lsfit(edad,salario2)) #regla de regresion estimada

reg <- lm(edad~salario2)
summary(m1)
reg<-lm(dist ~ speed)

reg<-lm(edad~salario2)
coeff=coefficients(reg)
eq = paste0("X = ", round(coeff[2],4), " * Y  + ", round(coeff[1],4))
plot(edad,salario2, xlab="Edad en años",ylab="Salario en Reales", main=eq)
abline(lsfit(edad,salario2),col="blue")

cor(edad,salario2)

reg<-lm(altura2~salario2)
coeff=coefficients(reg)
eq = paste0("X = ", round(coeff[2],4), " * Y  + ", round(coeff[1],4))
plot(altura2,salario2, xlab="Altura en cm",ylab="Salario en Reales", main=eq)
abline(lsfit(altura2,salario2),col="blue")

cor(altura2,salario2)

reg<-lm(graduacion~salario2)
coeff=coefficients(reg)
eq = paste0("X = ", round(coeff[2],4), " * Y  + ", round(coeff[1],4))
plot(graduacion,salario2, xlab="Año de graduación",ylab="Salario en Reales", main=eq)
abline(lsfit(graduacion,salario2),col="blue")

cor(graduacion,salario2)

datos <- read.csv("C:\\Users\\01\\Downloads\\dados.csv", head=TRUE)
mydata = read.table("C:\\Users\\01\\Downloads\\dados.txt", head=TRUE)

mydata = read.csv("C:\\Users\\01\\Downloads\\dados.csv")

datos3<-matrix(ncol=13,c(sexo, edad, altura, peso, graduacion, salario, celular),byrow=T)

data4 <- matrix(c(sexo, edad, altura, peso, graduacion, salario, celular), nrow = 13, ncol = 7, byrow = FALSE)

dimnames(datos4)<-list(c("1","2","3","4","5","6","7","8","9","10","11","12","13"), 
	c("fecha", "sexo", "edad", "altura", "peso", "graduacion", "salario", "celular"))

dimnames(datos4)<-list(c("1","2","3","4","5","6","7","8","9","10","11","12","13"), 
	c(sexo, edad, altura, peso, graduacion, salario, celular))

dimnames(datos4) <- list(c("1","2","3","4","5","6","7","8","9","10","11","12","13"), 
	c("fecha", "sexo", "edad", "altura", "peso", "graduacion", "salario", "celular"))


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
sexo, 	edad, 	altura, peso, 	graduacion, salario, 	celular
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
2, 		35, 	181, 	110, 	2009, 		6000, 		1000
2, 		23, 	180, 	80, 	2016, 		2167, 		470
1, 		23, 	160, 	70, 	2015, 		2358, 		600
2, 		38, 	173, 	73, 	2008, 		9000, 		800
2, 		34, 	170, 	72, 	2008, 		1500, 		300
1, 		23, 	154, 	51, 	2016, 		1500, 		1400
2, 		33, 	177, 	70, 	2007, 		6023, 		500
2, 		40, 	175, 	80, 	2009, 		7400, 		900
1, 		37, 	166, 	60, 	2001, 		8452, 		1000
2, 		37, 	172, 	80, 	2004, 		6000, 		800
2, 		28, 	181, 	91, 	2013, 		3200, 		700
2, 		38, 	178, 	80, 	2002, 		10000, 		800
2, 		23, 	187, 	85, 	2016, 		1500, 		685


> tr <- read.transactions("C:\\Users\\01\\Downloads\\datos2.txt",format = "basket", sep=',',rm.duplicates= TRUE)
Warning message:
In readLines(file, encoding = encoding) :
  incomplete final line found on 'C:\Users\01\Downloads\datos2.txt'

> tr
transactions in sparse format with
 13 transactions (rows) and
 17 items (columns)


require(arules)
dataEST <- read.transactions("C:\\Users\\JL\\Downloads\\dota2Dataset\\dota2Train.csv",format = "basket", sep=',')
dataEST <- read.transactions("C:\\Users\\JL\\Downloads\\datos2.csv",format = "basket", sep=';')


> dataEST
transactions in sparse format with
 13 transactions (rows) and
 15 items (columns)
> summary(dataEST)
> inspect(dataEST)
> itemFrequency(dataEST[,])
> itemFrequencyPlot(dataEST,support=0.25)
> itemFrequencyPlot(dataEST,topN=5)
> rule1 <-apriori(dataEST)

> rule1 <- apriori(dataEST, parameter=list(support=0.5,confidence=0.5))
> inspect(sort(rule1, by="lift")[1:23])


> length(dataEST)
> image(dataEST)

> plot(rules.all, method="graph")

 inspect(rules[1000], ruleSep = "---->", itemSep = " + ", setStart = "", setEnd ="", linebreak = FALSE)

 

Variable         Soporte                Nº Transacciones       Apariciones
Masculino     0.7692308              x 13                               = 10 (10 veces masculino de 13
Femenino      0.23077692            x 13                              = 3 (3 veces femenino de 13)
Adulto            0.6923077              x 13                               = 9 (9 veces adulto de los 13)

"We are drowning in information but starved for knowledge."
(John Naisbitt, 1982)