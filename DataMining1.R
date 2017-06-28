#Data Type
tipo de datos:
	-caracter
	-numeric
		-integer
		-complex
	-logical

#attributes
Nominal #names (Black, Red, White)
Binary #state (true, false)
Ordinal #rank (1,2,3; XS,S,M,L,XL)
Interval-scaled #not zero-point (Temperature in C or F)
Ratio-scaled #inherent zero-point (Counts, Temperature in K)
Discreto #int (Breed: Hereford, Braford; Age:18,19,20)
Continuous #real (Weight: 72,67; 87,98)

#If you want to see the attributes, use:
attributes()

x <- 1:100
x <- c(0.3, 0.9)				#numerico
x <- c(FALSE, TRUE)				#logico
x <- c("a", "neo", "trinity")	#caracter
x <- 19:49						#entero
x <- c(1+0i, 2+4i)				#complejo

para conocer el tipo de dato podemos usar la funcion mode()
mode(x)		integer
class(x)	numeric
typeof(t)

coerción: lo que genera que todos los objetos de un vector sean de la misma clase

y <- c(1.7, "a")
z <- c(TRUE, 2)
a <- c("a", TRUE)
mode(y)

coerción explicita: funcion as.*
	-as.numeric()
	-as.logical()
	-as.character()
	-as.integer()

> x <- 0:10
> x
 [1]  0  1  2  3  4  5  6  7  8  9 10
> class(x)
[1] "integer"

ahora convertiremos

a <- as.numeric(x)
b <- as.logical(x)
c <- as.character(x)
d <- as.integer(x)

class(x)
class(a)
class(b)
class(c)
class(d)

#MATRICES	matrix()

a <- matrix(nrow = 2, ncol =3)
b <- matrix(nrow = 4, ncol =3)

dim(a)
dim(b)

class(dim(a))
attributes(a)

ingresando datos en una matrix
a <- matrix(1:6, nrow = 2, ncol =3)

otra manera de ingresar datos en una matrix
> x <- 1:10
> x
 [1]  1  2  3  4  5  6  7  8  9 10

> dim(x) <- c(2,5)
> x
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10
 
 otra manera de crear una matrix
 x <- 1:9
 y <- 11:19

 cbind(x,y)
 rbind(x,y)

x <- matrix(1:16, 4, 4)
y <- matrix(rep(5,16), 4, 4)

x+y (suma de matrices)
x*y (multiplicacion de elementos de matrices)

x%*%y (multiplicacion de matrices)

#MANEJO DE FECHAS Y TIEMPOS
POSIXct desde (-) 01/01/1970 (+)
Sys.time()
typeof(t)

l = as.POSIXlt(t)

realizando la construccion de fecha

t <- Sys.time()
cat(t, "\n")
tiempo <- strftime(t,"%Y/%m/%d %H:%M:%S")

procedimiento inverso

miFecha1 <- c("2017/03/28 13:32:45")
miDate <- strptime(miFecha1, "%Y/%m/%d %H:%M:%S")

NA 		"not available"
NaN		"not a number"
x <-c(5,6,NA,9,10)
x <-c(5,6,NaN,NA,9,10)

is.na()
is.nan()

#DATAFRAME
data.frame()
read.csv()
read.table()
data.matrix()

[]		extrae elementos de la misma clase
[[]]	extrae elementos de una lista o dataframe
$		extrae elementos de un dataframe
example: database$variable1

x <-list(hola1 = 1:10, hola2 = 0.005)

x[1]
x[2]

airquality[1:7,]
no_faltantes <- complete.cases(airquality)
no_faltantes[1:7]
no_faltantes[no_faltantes,][1:5,]


#LEER Y ESCRIBIR DATOS
LEER
	read.table	*
	read.csv	*
	readLines
	source
	dget
	load
	unserialize

	read.csv
	read.csv2
	read.fortran
	read.socket

	PARAMETROS read.table
		file
		header
		sep
		colClasses
		nrows
		comment.char
		skip
		stringAsFactor

		read.table 
			por omision ignorarás las lineas con #
			descubrira cuantos reglores hay
			averiguara de que tipo es cada columna

ESCRIBIR
	write.table	*
	writeLines
	dump
	dput
	save
	serialize