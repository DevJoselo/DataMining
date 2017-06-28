#Recipe 1. Creating scatter plots

plot(cars$dist~cars$speed)


plot(cars$dist~cars$speed, # y~x
main="Relationship between car distance & speed", #Plot Title
xlab="Speed (miles per hour)", #X axis title
ylab="Distance travelled (miles)", #Y axis title
xlim=c(0,30), #Set x axis limits from 0 to 30 ylim=c(0,140), #Set y axis limits from 0 to  30140  xaxs="i", #Set x axis style as internal 
yaxs="i", #Set y axis style as internal  
col="red", #Set the colour of plotting symbol to red 
pch=19) #Set the plotting symbol to filled dots

#Recipe 2. Creating line graphs

sales  <- read.csv("dailysales.csv",header=TRUE)

plot(sales$units~as.Date(sales$date,"%d/%m/%y"),
type="l", #Specify type of plot as l for line
main="Unit Sales in the month of January 2010",
xlab="Date",
ylab="Number of units sold",
col="blue")

lines(sales$units2~as.Date(sales$date,"%d/%m/%y"),
col="red")



#Recipe 3. Creating bar charts

sales<-read.csv("citysales.csv",header=TRUE)

#Vertical bars
barplot(sales$ProductA,
names.arg= sales$City,
col="black")

#Horizontal bars
barplot(sales$ProductA,
names.arg= sales$City,
horiz=TRUE,
col="black")

#Grouped bars with legend
barplot(as.matrix(sales[,2:4]), beside= TRUE,
legend=sales$City,
col=heat.colors(5),
border="white")

#Horizontal grouped bars with legend
barplot(as.matrix(sales[,2:4]), beside=TRUE,
legend=sales$City,
col=heat.colors(5),
border="white",
horiz=TRUE)

4. Creating histograms and density plots

hist(rnorm(1000))

hist(islands)

plot(density(rnorm(1000)))


5. Creating box plots

metals<-read.csv("metals.csv",header=TRUE)

boxplot(metals,
xlab="Metals",
ylab="Atmospheric Concentration in ng per cubic metre",
main="Atmospheric Metal Concentrations in London")

copper<-read.csv("copper_site.csv",header=TRUE)

boxplot(copper$Cu~copper$Source, 
xlab="Measurement Site",
ylab="Atmospheric Concentration of Copper in ng per cubic metre",
main="Atmospheric Copper Concentrations in London")


6. Adjusting X and Y axis limits

plot(cars$dist~cars$speed,
xlim=c(0,30),
ylim=c(0,150))


plot(cars$dist~cars$speed,
xlim=c(0,30),
ylim=c(0,150),
xaxs="i",
yaxs="i")


plot(cars$dist~cars$speed,
xlim=c(30,0),
ylim=c(0,150),
xaxs="i",
yaxs="i")


7. Creating heatmaps

heatmap(as.matrix(mtcars), 
Rowv=NA, 
Colv=NA, 
col = heat.colors(256), 
scale="column",
margins=c(2,8),
main = "Car characteristics by Model")

genes<-read.csv("genes.csv",header=T)

rownames(genes)<-colnames(genes)

image(x=1:ncol( genes),
y=1:nrow(genes),
z=t(as.matrix(genes)),
axes=FALSE,
xlab="",
ylab="" ,
main="Gene Correlation Matrix")

axis(1,at=1:ncol(genes),labels=colnames(genes),col="white",las=2,cex.axis=0.8)           
axis(2,at=1:nrow(genes),labels=rownames(genes),col="white",las=1,cex.axis=0.8)

8. Creating pairs plots

pairs(iris[,1:4])

plot(iris[,1:4],
main="Relationships between characteristics of iris flowers",
pch=19,
col="blue",
cex=0.9)


9. Creating multiple plot matrix layouts

par(mfrow=c(2,3))
plot(rnorm(100),col="blue",main="Plot No.1")
plot(rnorm(100),col="blue",main="Plot No.2")
plot(rnorm(100),col="green",main="Plot No.3")
plot(rnorm(100),col="black",main="Plot No.4")
plot(rnorm(100),col="green",main="Plot No.5")
plot(rnorm(100),col="orange",main="Plot No.6")


par(mfcol=c(2,3))
plot(rnorm(100),col="blue",main="Plot No.1")
plot(rnorm(100),col="blue",main="Plot No.2")
plot(rnorm(100),col="green",main="Plot No.3")
plot(rnorm(100),col="black",main="Plot No.4")
plot(rnorm(100),col="green",main="Plot No.5")
plot(rnorm(100),col="orange",main="Plot No.6")


market<-read.csv("dailymarket.csv",header=TRUE)

par(mfrow=c(3,1))

plot(market$revenue~as.Date(market$date,"%d/%m/%y"),
type="l", #Specify type of plot as l for line
main="Revenue",
xlab="Date",
ylab="US Dollars",
col="blue")

plot(market$profits~as.Date(market$date,"%d/%m/%y"),
type="l", #Specify type of plot as l for line
main="Profits",
xlab="Date",
ylab="US Dollars",
col="red")

plot(market$customers~as.Date(market$date,"%d/%m/%y"),
type="l", #Specify type of plot as l for line
main="Customer visits",
xlab="Date",
ylab="Number of people",
col="black")

10. Adding and formatting legends

rain<-read.csv("cityrain.csv",header=TRUE)

plot(rain$Tokyo,type="l",col="red",
ylim=c(0,300),
main="Monthly Rainfall in major cities",
xlab="Month of Year",
ylab="Rainfall (mm)",
lwd=2)
lines(rain$NewYork,type="l",col="blue",lwd=2)
lines(rain$London,type="l",col="green",lwd=2)
lines(rain$Berlin,type="l",col="orange",lwd=2) 

legend("topright",
legend=c("Tokyo","New York","London","Berlin"),
col=c("red","blue","green","orange"),
lty=1,lwd=2)


plot(rain$Tokyo,type="l",col="red",
ylim=c(0,250),
main="Monthly Rainfall in major cities",
xlab="Month of Year",
ylab="Rainfall (mm)",
lwd=2)
lines(rain$NewYork,type="l",col="blue",lwd=2)
lines(rain$London,type="l",col="green",lwd=2)
lines(rain$Berlin,type="l",col="orange",lwd=2)

legend("top",
legend=c("Tokyo","New York","London","Berlin"),
ncol=4,
cex=0.8,
bty="n",
col=c("red","blue","green","orange"),
lty=1,lwd=2)


11. Creating graphs with maps

install.packages("maps")

library(maps)

map()

map('world', fill = TRUE,col=heat.colors(10))

map("state", interior = FALSE)
map("state", boundary = FALSE, col="red", add = TRUE) 


install.packages("sp")
library(sp)

load(url("http://gadm.org/data/rda/GBR_adm1.RData"))

spplot(gadm,"Shape_Area")


12. Saving and exporting graphs

png("scatterplot.png")
plot(rnorm(1000))
dev.off()

png("scatterplot.png", height=600, width=600)
plot(rnorm(1000))
dev.off()


png("scatterplot.png", height=4, width=4,units="in")
plot(rnorm(1000))
dev.off()


png("scatterplot.png",res=600)
plot(rnorm(1000))
dev.off()

pdf("scatterplot.pdf")
plot(rnorm(1000))
dev.off()
===================================================================

#Recipe 1. Setting colors of points, lines and bars

plot(rnorm(1000),
col="red")

sales <- read.csv("dailysales.csv",header=TRUE)

plot(Sales$units~as.Date(Sales$date,"%d/%m/%y"),
type="l", #Specify type of plot as l for line
col="blue")

barplot(Sales$ProductA~Sales$City,
col="blue")


#Vector of colors

heat.colors(5)

barplot(as.matrix(sales[,2:4]), beside=T,
legend=sales$City,
col=c("red","blue","green","orange","pink"),
border="white")

barplot(as.matrix(sales[,2:4]), beside=T,
legend=sales$City,
col=c("red","blue","green","orange"),
border="white")

barplot(as.matrix(sales[,2:4]), beside=T,
legend=sales$City,
col=heat.colors(length(sales$City)),
border="white")




#Recipe 2. Setting plot background colors

par(bg="gray")
plot(rnorm(100))


plot(rnorm(1000),type="n")
x<-par("usr")
rect(x[1],x[3],x[2],x[4],col="lightgray ")
points(rnorm(1000))



#Recipe 3. Setting colors for text elements: axis labels, titles, plot titles and legends

plot(rnorm(100), 
main="Plot Title",
col.axis="blue",
col.lab="red",
col.main="darkblue")


par(col.axis="black",
col.lab="#444444",
col.main="darkblue")

plot(rnorm(100),main="plot")


title("Sales Figures for 2010", col.main="blue")

title(xlab="Month",ylab="Sales",col.lab="red")


title(xlab="X axis",col.lab="red")
title(ylab="Y axis",col.lab="blue")



#Recipe 4. Choosing color combinations and palettes

palette(c("red","blue","green","orange"))

palette("default")

install.packages("RColorBrewer")
library(RColorBrewer)

display.brewer.all()

brewer.pal(7,"YlOrRd")

display.brewer.pal(7,"YlOrRd")

palette(brewer.pal(7,"YlOrRd"))

pal1<- brewer.pal(7,"YlOrRd")



#Recipe 5. Setting fonts for annotations and titles 

par(family="serif",font=2)

names(pdfFonts())




#Recipe 6. Choosing plotting point symbol styles and sizes

rain<-read.csv("cityrain.csv")

plot(rnorm(100),pch=19,cex=2)

plot(rain$Tokyo,
ylim=c(0,250),
main="Monthly Rainfall in major cities",
xlab="Month of Year",
ylab="Rainfall (mm)",
pch=1)

points(rain$NewYork,pch=2)
points(rain$London,pch=3)
points(rain$Berlin,pch=4)

legend("top",
legend=c("Tokyo","New York","London","Berlin"),
ncol=4,
cex=0.8,
bty="n",
pch=1:4)






#Recipe 7. Choosing line styles and width

plot(rain$Tokyo,
ylim=c(0,250),
main="Monthly Rainfall in major cities",
xlab="Month of Year",
ylab="Rainfall (mm)",
type="l",
lty=1,
lwd=2)

lines(rain$NewYork,lty=2,lwd=2) 
lines(rain$London,lty=3,lwd=2)
lines(rain$Berlin,lty=4,lwd=2)

legend("top",
legend=c("Tokyo","New York","London","Berlin"),
ncol=4,
cex=0.8,
bty="n",
lty=1:4,
lwd=2)



#Recipe 8. Choosing box styles

par(bty="l")
plot(rnorm(100))


par(oma=c(1,1,1,1))
plot(rnorm(100),bty="l")
box(which="figure")


#Recipe 9. How to adjust axis labels and tick marks styles

plot(rnorm(100),xaxp=c(0,100,10))



#Recipe 10. How to format log axes

plot(10^c(1:5),log="y",type="b")


#Recipe 11. Setting graph margins and dimensions 

par(fin=c(6,6), 
pin=c(4,4))

par(mai=c(1,1,1,1),
omi=c(0.1,0.1,0.1,0.1))
===================================================================

#Recipe 1. Grouping data points within a scatter plot


library(lattice)
	
xyplot(mpg~disp,
data=mtcars,
groups=cyl,
auto.key=list(corner=c(1,1)))


install.packages(“ggplot2")

library(ggplot2)
qplot(disp,mpg,data=mtcars,col= as.factor(cyl))



#Recipe 2. Highlighting grouped data points by colour, size and symbol type

library(ggplot2)

#By shape
qplot(disp,mpg,data=mtcars,shape=as.factor(cyl)) 


#By size
qplot(disp,mpg,data=mtcars,size=as.factor(cyl))


#Recipe 3. Labelling data points

plot(mpg~disp, data=mtcars)
text(258,22,"Hornet")


health<-read.csv("HealthExpenditure.csv",header=TRUE)
plot(health$Expenditure,health$Life_Expectancy,type="n")
text(health$Expenditure,health$Life_Expectancy,health$Country)


#Recipe 4. Correlation matrix using pairs plot


panel.cor <- function(x, y, ...)
{
    par(usr = c(0, 1, 0, 1))
    txt <- as.character(format(cor(x, y), digits=2))
    text(0.5, 0.5, txt,  cex = 6* abs(cor(x, y)))
}

pairs(iris[1:4], upper.panel=panel.cor)


#Recipe 5. Adding error bars

plot(mpg~disp,data=mtcars)

arrows(x0=mtcars$disp,
y0=mtcars$mpg*0.95,
x1=mtcars$disp,
y1=mtcars$mpg*1.05,
angle=90,
code=3,
length=0.04,
lwd=0.4)

#Horizontal
arrows(x0=mtcars$disp*0.95,
y0=mtcars$mpg,
x1=mtcars$disp*1.05,
y1=mtcars$mpg,
angle=90,
code=3,
length=0.04,
lwd=0.4)



#Recipe 6. Using jitter to distinguish closely packed data points

x <- rbinom(1000, 10, 0.25)
y <- rbinom(1000, 10, 0.25)
plot(x,y)

plot(jitter(x), jitter(y))



#Recipe 7. Adding linear model lines

plot(mtcars$mpg~mtcars$disp)
lmfit<-lm(mtcars$mpg~mtcars$disp)
abline(lmfit)	



#Recipe 8. Adding non-linear model curves

x <- -(1:100)/10
y <- 100 + 10 * exp(x / 2) + rnorm(x)/10
nlmod <- nls(y ~  Const + A * exp(B * x), trace=TRUE)

plot(x,y)
lines(x, predict(nlmod), col="red")


#Recipe 9. Adding non-parametric model curves with lowess

plot(cars, main = "lowess(cars)")
lines(lowess(cars), col = “blue")	
lines(lowess(cars, f=0.3), col = “orange")


#Recipe 10. Making  3-dimensional scatter plots

install.packages("scatterplot3d") 
library(scatterplot3d)

scatterplot3d(x=mtcars$wt,
  y=mtcars$disp,
  z=mtcars$mpg)

scatterplot3d(wt,disp,mpg, 	
pch=16, highlight.3d=TRUE, angle=20,
xlab="Weight",ylab="Displacement",zlab="Fuel Economy (mpg)",
type="h", 
main="Relationships between car specifications")



#Recipe 11. Making Quantile-Quantile plots

qqnorm(mtcars$mpg)
qqline(mtcars$mpg)

lmfit<-lm(mtcars$mpg~mtcars$disp)
par(mfrow=c(2,2))
plot(lmfit)


#Recipe 12. Displaying data density on axes

x<-rnorm(1000)
plot(density(x),type="l") 
rug(x)

metals<-read.csv("metals.csv")
plot(Ba~Cu,data=metals,xlim=c(0,100))
rug(metals$Cu)
rug(metals$Ba,side=2,col="red",ticksize=0.02)



#Recipe 13. Making scatter plots with smoothed density representation

n <- 10000
x  <- matrix(rnorm(n), ncol=2)
y  <- matrix(rnorm(n, mean=3, sd=1.5), ncol=2)
smoothScatter(x,y)

=========================================================================
#Recipe 1. Adding customized legends for multiple line graphs

rain<-read.csv("cityrain.csv")
plot(rain$Tokyo,type="b",lwd=2,
xaxt="n",ylim=c(0,300),col="black",
xlab="Month",ylab="Rainfall (mm)",
main="Monthly Rainfall in major cities")
axis(1,at=1:length(rain$Month),labels=rain$Month)
lines(rain$Berlin,col="red",type="b",lwd=2)
lines(rain$NewYork,col="orange",type="b",lwd=2)
lines(rain$London,col="purple",type="b",lwd=2)

legend("topright",legend=c("Tokyo","Berlin","New York","London"),
lty=1,lwd=2,pch=21,col=c("black","red","orange","purple"),
ncol=2,bty="n",cex=0.8,
text.col=c("black","red","orange","purple"),
inset=0.01)


legend(1,300,legend=c("Tokyo","Berlin","New York","London"),
lty=1,lwd=2,pch=21,col=c("black","red","orange","purple"),
horiz=TRUE,bty="n",bg="yellow",cex=1,
text.col=c("black","red","orange","purple"))


#Recipe 2. Using margin labels instead of legends for multiple line graphs

gdp<-read.table("gdp_long.txt",header=T)

library(RColorBrewer)
pal<-brewer.pal(5,"Set1")

par(mar=par()$mar+c(0,0,0,2),bty="l")

plot(Canada~Year,data=gdp,type="l",lwd=2,lty=1,ylim=c(30,60),col=pal[1],main="Percentage change in GDP",ylab="") 

mtext(side=4,at=gdp$Canada[length(gdp$Canada)],text="Canada",col=pal[1],line=0.3,las=2)

lines(gdp$France~gdp$Year,col=pal[2],lwd=2)

mtext(side=4,at=gdp$France[length(gdp$France)],text="France",col=pal[2],line=0.3,las=2)

lines(gdp$Germany~gdp$Year,col=pal[3],lwd=2)

mtext(side=4,at=gdp$Germany[length(gdp$Germany)],text="Germany",col=pal[3],line=0.3,las=2)
 
lines(gdp$Britain~gdp$Year,col=pal[4],lwd=2)

mtext(side=4,at=gdp$Britain[length(gdp$Britain)],text="Britain",col=pal[4],line=0.3,las=2)

lines(gdp$USA~gdp$Year,col=pal[5],lwd=2)

mtext(side=4,at=gdp$USA[length(gdp$USA)]-2,text="USA",col=pal[5],line=0.3,las=2)




#Recipe 3. Adding horizontal and vertical grid lines

rain<-read.csv("cityrain.csv")
plot(rain$Tokyo,type="b",lwd=2,
xaxt="n",ylim=c(0,300),col="black",
xlab="Month",ylab="Rainfall (mm)",
main="Monthly Rainfall in Tokyo")
axis(1,at=1:length(rain$Month),labels=rain$Month)
	
grid()


grid(nx=NA, ny=8,
lwd=1,lty=2,col="blue")


#Recipe 4. Adding marker lines at specific X and Y values using abline

Rrain <- read.csv("cityrain.csv")
plot(rain$Tokyo,type="b",lwd=2,
xaxt="n",ylim=c(0,300),col="black", 
xlab="Month",ylab="Rainfall (mm)",
main="Monthly Rainfall in Tokyo")
axis(1,at=1:length(rain$Month),labels=rain$Month)

abline(v=9) 

abline(h=150,col="red",lty=2)


#Recipe 5. Creating sparklines

rain <- read.csv("cityrain.csv")

par(mfrow=c(4,1),mar=c(5,7,4,2),omi=c(0.2,2,0.2,2)) 

for(i in 2:5)
{
	plot(rain[,i],ann=FALSE,axes=FALSE,type="l",col="gray",lwd=2) 
	
		mtext(side=2,at=mean(rain[,i]),names(rain[i]),
		las=2,col="black")

	mtext(side=4,at=mean(rain[,i]),mean(rain[i]),
	las=2,col="black")

	points(which.min(rain[,i]),min(rain[,i]),pch=19,col="blue")
	points(which.max(rain[,i]),max(rain[,i]),pch=19,col="red")
}


#Recipe 6. Plotting functions of a variable in the dataset

rain <- read.csv("cityrain.csv")

plot(rain$Berlin-rain$London,type="l",lwd=2, 
xaxt="n",col="blue",
xlab="Month",ylab="Difference in Rainfall (mm)",
main="Difference in Rainfall between Berlin and London (Berlin-London)")

axis(1,at=1:length(rain$Month),labels=rain$Month)

abline(h=0,col="red")


x<-1:100
y<-x^3-6*x^2+5*x+10
plot(y~x,type="l",main=expression(f(x)==x^3-6*x^2+5*x+10))


#Recipe 7. Formatting time series data for plotting

sales<-read.csv("dailysales.csv")
d1<-as.Date(sales$date,"%d/%m/%y")
d2<-strptime(sales$date,"%d/%m/%Y")


install.packages(“zoo”)
library(zoo) 
	
d3<-zoo(sales$units,as.Date(sales$date,"%d/%m/%y"))


#Recipe 8. Plotting the date or time variable on the X axis

sales<-read.csv("dailysales.csv")
plot(sales$units~as.Date(sales$date,"%d/%m/%y"),type="l",
xlab="Date",ylab="Units Sold")

plot(strptime(sales$date,"%d/%m/%Y"),sales$units,type="l",
xlab="Date",ylab="Units Sold")


library(zoo)
plot(zoo(sales$units,as.Date(sales$date,"%d/%m/%y")))


air<-read.csv("openair.csv")

plot(air$nox~as.Date(air$date,"%d/%m/%Y %H:%M"),type="l",
xlab="Time", ylab="Concentration (ppb)",
main="Time trend of Oxides of Nitrogen")


plot(zoo(air$nox,as.Date(air$date,"%d/%m/%Y %H:%M")),
xlab="Time", ylab="Concentration (ppb)",
main="Time trend of Oxides of Nitrogen")


#Recipe 9. Annotating axis labels in different human readable time formats

air<-read.csv("openair.csv")

plot(air$nox~as.Date(air$date,"%d/%m/%Y %H:%M"),type="l",
xaxt="n",
xlab="Time", ylab="Concentration (ppb)",
main="Time trend of Oxides of Nitrogen")

xlabels<-strptime(air$date, format = "%d/%m/%Y %H:%M")
axis.Date(1, at=xlabels[xlabels$mday==1 ], format="%b-%Y")



#Recipe 10. Adding vertical markers to indicate specific time events

air<-read.csv("openair.csv")

plot(air$nox~as.Date(air$date,"%d/%m/%Y %H:%M"),type="l",
xlab="Time", ylab="Concentration (ppb)",
main="Time trend of Oxides of Nitrogen")

abline(v=as.Date("25/12/2003","%d/%m/%Y"),col="red")


markers<-seq(from=as.Date("25/12/1998","%d/%m/%Y"),
to=as.Date("25/12/2004","%d/%m/%Y"),
by="year")	

abline(v=markers,col="red")


#Recipe 11. Plotting data with varying time averaging periods

air<-read.csv("openair.csv")

air$date = as.POSIXct(strptime(air$date, format = "%d/%m/%Y %H:%M", "GMT"))

means <- aggregate(air["nox"], format(air["date"],"%Y -%U"),mean, na.rm = TRUE)

means$date <- seq(air$date[1], air$date[nrow(air)],length = nrow(means))

plot(means$date, means$nox, type = "l")



means <- aggregate(air["nox"], format(air["date"],"%Y-%j"),mean, na.rm = TRUE)
means$date <- seq(air$date[1], air$date[nrow(air)],length = nrow(means))
plot(means$date, means$nox, type = "l",
xlab="Time", ylab="Concentration (ppb)",
main="Daily  Average Concentrations of Oxides of Nitrogen")



#Recipe 12. Creating stock charts 


install.packages("tseries")
library(tseries)

aapl<-get.hist.quote(instrument = "aapl", quote = c("Cl", "Vol"))

goog <- get.hist.quote(instrument = "goog", quote = c("Cl", "Vol"))

msft <- get.hist.quote(instrument = "msft", quote = c("Cl", "Vol"))

plot(msft$Close,main = "Stock Price Comparison" ,
,ylim=c(0,800)    ,col="red"  ,type="l"  ,lwd=0.5,
 ,pch=19  ,cex=0.6  ,xlab="Date" ,ylab="Stock Price (USD)")

lines(goog$Close,col="blue",lwd=0.5)
lines(aapl$Close,col="gray",lwd=0.5)

legend("top",horiz=T,legend=c("Microsoft","Google","Apple"),
col=c("red","blue","gray"),lty=1,bty="n")


install.packages("quantmod")
library(quantmod)

getSymbols("AAPL",src="yahoo") 
barChart(AAPL)

candleChart(AAPL,theme="white") 
=====================================================================
#Recipe 1. Creating Bar charts with more than one factor variable

install.packages("RColorBrewer")  #if not already installed
library(RColorBrewer) 

citysales<-read.csv("citysales.csv")

barplot(as.matrix(citysales[,2:4]), beside=TRUE,
        legend.text=citysales$City,
        args.legend=list(bty="n",horiz=TRUE),
        col=brewer.pal(5,"Set1"),
        border="white",
        ylim=c(0,100),
        ylab="Sales Revenue (1,000's of USD)",
        main="Sales Figures")

box(bty="l")


#Recipe 2. Creating stacked bar charts

install.packages("RColorBrewer")
library(RColorBrewer)

citysales<-read.csv("citysales.csv")

barplot(as.matrix(citysales[,2:4]),  
        legend.text=citysales$City,
        args.legend=list(bty="n",horiz=TRUE),
        col=brewer.pal(5,"Set1"),
        border="white",
        ylim=c(0,200),
        ylab="Sales Revenue (1,000's of USD)",
        main="Sales Figures")


citysalesperc<-read.csv("citysalesperc.csv") 

par(mar=c(5,4,4,8),xpd=T)

barplot(as.matrix(citysalesperc[,2:4]), 
        col=brewer.pal(5,"Set1"),
        border="white",
        ylab="Sales Revenue (1,000's of USD)", 
        main="Percentage Sales Figures") 

legend("right",legend=citysalesperc$City,bty="n",inset=c(-0.3,0),fill=brewer.pal(5,"Set1"))



#Recipe 3. Adjusting the orientation of bars – horizontal and vertical

barplot(as.matrix(citysales[,2:4]), beside=TRUE,horiz=TRUE,
        legend.text=citysales$City,
        args.legend=list(bty="n"),
        col=brewer.pal(5,"Set1"),
        border="white",
        xlim=c(0,100),
        xlab="Sales Revenue (1,000's of USD)",
        main="Sales Figures")

par(mar=c(5,4,4,8),xpd=T)
	
barplot(as.matrix(citysalesperc[,2:4]), horiz=TRUE,
        col=brewer.pal(5,"Set1"),
        border="white",
        xlab="Percentage of Sales",
        main="Perecentage Sales Figures")

legend("right",legend=citysalesperc$City,bty="n",
inset=c(-0.3,0),fill=brewer.pal(5,"Set1"))


#Recipe 4. Adjusting bar widths, spacing, colours and borders

barplot(as.matrix(citysales[,2:4]), beside=TRUE,
     legend.text=citysales$City,
     args.legend=list(bty="n",horiz=T),
     col=c("#E5562A","#491A5B","#8C6CA8","#BD1B8A","#7CB6E4"),
     border=FALSE,
     space=c(0,5),
     ylim=c(0,100),
     ylab="Sales Revenue (1,000's of USD)",
     main="Sales Figures")


barplot(as.matrix(citysales[,2:4]), beside=T,
        legend.text=citysales$City,
        args.legend=list(bty="n",horiz=T),
        ylim=c(0,100),
        ylab="Sales Revenue (1,000's of USD)",
        main="Sales Figures")


#Recipe 5. Displaying values on top of or next to the bars

x<-barplot(as.matrix(citysales[,2:4]), beside=TRUE,
        legend.text=citysales$City,
        args.legend=list(bty="n",horiz=TRUE),
        col=brewer.pal(5,"Set1"),
        border="white",
        ylim=c(0,100),
        ylab="Sales Revenue (1,000's of USD)",
        main="Sales Figures")

y<-as.matrix(citysales[,2:4])

text(x,y+2,labels=as.character(y))


#Horizontal bars
y<-barplot(as.matrix(citysales[,2:4]), beside=TRUE,horiz=TRUE,
        legend.text=citysales$City,
        args.legend=list(bty="n"),
        col=brewer.pal(5,"Set1"),
        border="white",
        xlim=c(0,100),
        xlab="Sales Revenue (1,000's of USD)",
        main="Sales Figures")

x<-as.matrix(citysales[,2:4])

text(x+2,y,labels=as.character(x))



#Recipe 6. Placing labels inside bars

rain<-read.csv("cityrain.csv")
	
y<-barplot(as.matrix(rain[1,-1]),horiz=T,col="white",yaxt="n",
main="Monthly Rainfall in Major CitiesJanuary",
xlab="Rainfall (mm)")

x<-0.5*rain[1,-1] 
text(x,y,colnames(rain[-1]))



#Recipe 7. Creating Bar charts with vertical error bars

sales<-t(as.matrix(citysales[,-1]))
colnames(sales)<-citysales[,1] 

x<-barplot(sales,beside=T,legend.text=rownames(sales),
args.legend=list(bty="n",horiz=T),
col=brewer.pal(3,"Set2"),border="white",ylim=c(0,100),
        ylab="Sales Revenue (1,000's of USD)",
        main="Sales Figures")

arrows(x0=x,
y0=sales*0.95,
x1=x,
y1=sales*1.05,
angle=90,
code=3,
length=0.04,
lwd=0.4)


#Creating a function
errorbars<-function(x,y,upper,lower=upper,length=0.04,lwd=0.4,...) {
arrows(x0=x,
y0=y+upper,
x1=x,
y1=y-lower,
angle=90,
code=3,
length=length,
lwd=lwd)
}

errorbars(x,sales,0.05*sales) 


#Recipe 8. Modifying dotplots by grouping variables

install.packages("reshape")
library(reshape)

sales<-melt(citysales)

sales$color[sales[,2]=="ProductA"] <- "red"
sales$color[sales[,2]=="ProductB"] <- "blue"
sales$color[sales[,2]=="ProductC"] <- "violet"

dotchart(sales[,3],labels=sales$City,groups=sales[,2],
col=sales$color,pch=19,
main="Sales Figures",
xlab="Sales Revenue (1,000's of USD)")


#Recipe 9. Making better readable pie charts with clockwise-ordered slices

browsers<-read.table("browsers.txt",header=TRUE)
browsers<-browsers[order(browsers[,2]),]

pie(browsers[,2],
labels=browsers[,1],
clockwise=TRUE,
radius=1,
col=brewer.pal(7,"Set1"),
border="white",
main="Percentage Share of Internet Browser usage")



#Recipe 10. Labelling a pie chart with percentage values for each slice 

	browsers<-read.table("browsers.txt",header=TRUE)
	browsers<-browsers[order(browsers[,2]),]
	
pielabels <- sprintf("%s = %3.1f%s", browsers[,1], 100*browsers[,2]/sum(browsers[,2]), "%")

pie(browsers[,2],
labels=pielabels,
clockwise=TRUE,
radius=1,
col=brewer.pal(7,"Set1"),
border="white",
cex=0.8,
main="Percentage Share of Internet Browser usage")



#Recipe 11. Adding a legend to a pie chart

	browsers<-read.table("browsers.txt",header=TRUE)
	browsers<-browsers[order(browsers[,2]),]
	
pielabels <- sprintf("%s = %3.1f%s", browsers[,1], 100*browsers[,2]/sum(browsers[,2]), "%")

pie(browsers[,2],
labels=NA,
clockwise=TRUE,
col=brewer.pal(7,"Set1"),
border="white",
radius=0.7,
cex=0.8,
main="Percentage Share of Internet Browser usage")

legend("bottomright",legend=pielabels,bty="n",
fill=brewer.pal(7,"Set1"))
===================================================================================
#Recipe 1. Visualising distributions as frequency or probability  

air<-read.csv("airpollution.csv")

hist(air$Nitrogen.Oxides,
     xlab="Nitrogen Oxide Concentrations",
     main="Distribution of Nitrogen Oxide Concentrations")


hist(air$Nitrogen.Oxides,
     freq=FALSE,
     xlab="Nitrogen Oxide Concentrations",
     main="Distribution of Nitrogen Oxide Concentrations")



#Recipe 2. Setting bin size and number of breaks

air<-read.csv("airpollution.csv")

hist(air$Nitrogen.Oxides,
     breaks=20,
     xlab="Nitrogen Oxide Concentrations",
     main="Distribution of Nitrogen Oxide Concentrations")

hist(air$Nitrogen.Oxides,
     breaks=c(0,100,200,300,400,500,600),
     xlab="Nitrogen Oxide Concentrations",
     main="Distribution of Nitrogen Oxide Concentrations")

#Recipe 3. Adjusting histogram styles: bar colours, borders and axes

air<-read.csv("airpollution.csv")

hist(air$Respirable.Particles,
     prob=TRUE,
     col="black",
     border="white",
     xlab="Respirable Particle Concentrations",
     main="Distribution of Respirable Particle Concentrations")


par(yaxs="i",las=1)
hist(air$Respirable.Particles,
     prob=TRUE,	
     col="black",
     border="white",
     xlab="Respirable Particle Concentrations",
     main="Distribution of Respirable Particle Concentrations")
box(bty="l")
grid(nx=NA,ny=NULL,lty=1,lwd=1,col="gray")



#Recipe 4. Overlaying density line over a histogram

par(yaxs="i",las=1)
hist(air$Respirable.Particles,
     prob=TRUE,
     col="black",
     border="white",
     xlab="Respirable Particle Concentrations",
     main="Distribution of Respirable Particle Concentrations")
box(bty="l")

lines(density(air$Respirable.Particles,na.rm=T),col="red",lwd=4)
grid(nx=NA,ny=NULL,lty=1,lwd=1,col="gray")



#Recipe 5. Multiple histograms along the diagonal of a pairs plot

panel.hist <- function(x, ...)
  {
    par(usr = c(par("usr")[1:2], 0, 1.5) )
    hist(x, prob=TRUE,add=TRUE,col="black",border="white")
  }


plot(iris[,1:4],
     main="Relationships between characteristics of iris flowers",
     pch=19,
     col="blue",
     cex=0.9,
     diag.panel=panel.hist)


#Recipe 6. Histograms in the margins of line and scatterplots

air<-read.csv("airpollution.csv")

#Set up the layout first
layout(matrix(c(2,0,1,3),2,2,byrow=TRUE), widths=c(3,1), heights=c(1,3), TRUE)

#Make Scatterplot
par(mar=c(5.1,4.1,0.1,0))
plot(air$Respirable.Particles~air$Nitrogen.Oxides,
     pch=19,col="black",
     xlim=c(0,600),ylim=c(0,80),
     xlab="Nitrogen Oxides Concentrations",
     ylab="Respirable Particle Concentrations")

#Plot histogram of X variable in the top row
par(mar=c(0,4.1,3,0))
hist(air$Nitrogen.Oxides,
     breaks=seq(0,600,100),
     ann=FALSE,axes=FALSE,
     col="black",border="white")

#Plot histogram of Y variable to the right of the scatterplot
yhist <- hist(air$Respirable.Particles,
              breaks=seq(0,80,10),
              plot=FALSE)

par(mar=c(5.1,0,0.1,1))
barplot(yhist$density,
        horiz=TRUE,
        space=0,axes=FALSE,
        col="black",border="white")
======================================================================================
#Recipe 1. Creating box plots with narrow boxes for small number of variables

air<-read.csv("airpollution.csv")

boxplot(air,las=1)

boxplot(air,boxwex=0.2,las=1)

par(las=1)

boxplot(air,width=c(1,2))

#Recipe 2. Grouping over a variable

metals<-read.csv("metals.csv")

boxplot(Cu~Source,data=metals,
		main="Summary of Copper (Cu) concentrations by Site")

boxplot(Cu~Source*Expt,data=metals,
		main="Summary of Copper (Cu) concentrations by Site")


#Recipe 3. Varying box widths by number of observations

metals<-read.csv("metals.csv")

boxplot(Cu ~ Source, data = metals,
        varwidth=TRUE,
        main="Summary of Copper concentrations by Site")



#Recipe 4. Creating box plots with notches

metals<-read.csv("metals.csv")

boxplot(Cu ~ Source, data = metals,
        varwidth=TRUE,
        notch=TRUE,	
        main="Summary of Copper concentrations by Site")


#Recipe 5. Including or excluding outliers

metals<-read.csv("metals.csv")

boxplot(metals[,-1], 
	outline=FALSE,
	main="Summary of metal concentrations by Site \n (without outliers)")



#Recipe 6. Creating horizontal box plots

metals<-read.csv("metals.csv")

boxplot(metals[,-1], 
	horizontal=TRUE,
	las=1,
	main="Summary of metal concentrations by Site")


#Recipe 7. Changing box styling

metals<-read.csv("metals.csv")

boxplot(metals[,-1],
        border = "white",
        col = "black",
        boxwex = 0.3,
        medlwd=1,
        whiskcol="black",
        staplecol="black",
        outcol="red",cex=0.3,outpch=19,
        main="Summary of metal concentrations by Site")

grid(nx=NA,ny=NULL,col="gray",lty="dashed")


#Recipe 8. Adjusting the extent of plot whiskers outside the box

metals<-read.csv("metals.csv")

boxplot(metals[,-1],
	range=1,
        border = "white",
        col = "black",
        boxwex = 0.3,
        medlwd=1,
        whiskcol="black",
        staplecol="black",
        outcol="red",cex=0.3,outpch=19,
        main="Summary of metal concentrations by Site \n (range=1) ")

boxplot(metals[,-1],
	range=0,
        border = "white",
        col = "black",
        boxwex = 0.3,
        medlwd=1,
        whiskcol="black",
        staplecol="black",
        outcol="red",cex=0.3,outpch=19,
        main="Summary of metal concentrations by Site \n (range=0)")


#Recipe 9. Showing number of observations 

metals<-read.csv("metals.csv")

b<-boxplot(metals[,-1],
	  xaxt="n",
        border = "white",
        col = "black",
        boxwex = 0.3,
        medlwd=1,
        whiskcol="black",
        staplecol="black",
        outcol="red",cex=0.3,outpch=19,
        main="Summary of metal concentrations by Site")

axis(side=1,at=1:length(b$names),labels=paste(b$names,"\n(n=",b$n,")",sep=""),mgp=c(3,2,0))


install.packages("gplots")
library(gplots)

boxplot.n(metals[,-1],
        border = "white",
        col = "black",
        boxwex = 0.3,
        medlwd=1,
        whiskcol="black",
        staplecol="black",
        outcol="red",cex=0.3,outpch=19,
        main="Summary of metal concentrations by Site")


#Recipe 10. Splitting a variable at arbitrary values into subsets

metals<-read.csv("metals.csv")

cuts<-c(0,40,80)
Y<-split(x=metals$Cu, f=findInterval(metals$Cu, cuts))

boxplot(Y,
        xaxt="n",            
        border = "white",
        col = "black",
        boxwex = 0.3,
        medlwd=1,           
	whiskcol="black",
        staplecol="black",
        outcol="red",cex=0.3,outpch=19,
        main="Summary of Copper concentrations",
	xlab="Concentration ranges",
	las=1)

axis(1,at=1:length(clabels),
     labels=c("Below 0","0 to 40","40 to 80","Above 80"),      
     lwd=0,lwd.ticks=1,col="gray")



boxplot.cuts<-function(y,cuts) {

Y<-split(metals$Cu, f=findInterval(y, cuts))

b<-boxplot(Y,
           xaxt="n",            
           border = "white",
           col = "black",
           boxwex = 0.3,
           medlwd=1,           
           whiskcol="black",
           staplecol="black",
           outcol="red",cex=0.3,outpch=19,
           main="Summary of Copper concentrations",
           xlab="Concentration ranges",
           las=1)

clabels<-paste("Below",cuts[1])
     
for(k in 1:(length(cuts)-1))
   {
    clabels<-c(clabels, paste(as.character(cuts[k]), "to",as.character(cuts[k+1])))
   }

clabels<-c(clabels, 
           paste("Above",as.character(cuts[length(cuts)])))

axis(1,at=1:length(clabels),
labels=clabels,lwd=0,lwd.ticks=1,col="gray")

}


boxplot.cuts(metals$Cu,c(0,30,60))

boxplot(Cu~Source,data=metals,subset=Cu>40)


#An alternative definition of boxplot.cuts()


boxplot.cuts<-function(y,cuts) {

 	f=cut(y, c(min(y[!is.na(y)]),cuts,max(y[!is.na(y)])), ordered_results=TRUE);
   Y<-split(y, f=f)
 
	b<-boxplot(Y,
   	        xaxt="n",            
      	     border = "white",
         	  col = "black",
              boxwex = 0.3,
	           medlwd=1,           
	           whiskcol="black",
           	  staplecol="black",
              outcol="red",cex=0.3,outpch=19,
              main="Summary of Copper concentrations",
	     		  xlab="Concentration ranges",
	     		  las=1)


	clabels = as.character(levels(f))
axis(1,at=1:length(clabels),
labels=clabels,lwd=0,lwd.ticks=1,col="gray")

}


boxplot.cuts(metals$Cu,c(0,40,80))
========================================================================

#Recipe 1. Creating heat maps of single Z variable with scale

sales<-read.csv("sales.csv")

install.packages("RColorBrewer")
library(RColorBrewer)

rownames(sales)<-sales[,1]
sales<-sales[,-1]
data_matrix<-data.matrix(sales)
	
pal=brewer.pal(7,"YlOrRd")

breaks<-seq(3000,12000,1500)

#Create layout with 1 row and 2 columns (for the heatmap and scale); the heatmap column is 8 times as wide as the scale column

layout(matrix(data=c(1,2), nrow=1, ncol=2), widths=c(8,1), heights=c(1,1))

#Set margins for the heatmap
par(mar = c(5,10,4,2),oma=c(0.2,0.2,0.2,0.2),mex=0.5)           


image(x=1:nrow(data_matrix),y=1:ncol(data_matrix), 	
      z=data_matrix,
      axes=FALSE,
      xlab="Month",
      ylab="",
      col=pal[1:(length(breaks)-1)], 
      breaks=breaks,
      main="Sales Heat Map")

axis(1,at=1:nrow(data_matrix),labels=rownames(data_matrix), col="white",las=1)
           
axis(2,at=1:ncol(data_matrix),labels=colnames(data_matrix), col="white",las=1)

abline(h=c(1:ncol(data_matrix))+0.5, 
       v=c(1:nrow(data_matrix))+0.5, col="white",lwd=2,xpd=FALSE)

breaks2<-breaks[-length(breaks)]

# Color Scale
par(mar = c(5,1,4,7)) 

# If you get a figure margins error while running the above code, enlarge the plot device or adjust the margins so that the graph and scale fit within the device.

image(x=1, y=0:length(breaks2),z=t(matrix(breaks2))*1.001,
      col=pal[1:length(breaks)-1],
      axes=FALSE,
      breaks=breaks,
      xlab="", ylab="",
      xaxt="n")

axis(4,at=0:(length(breaks2)-1), labels=breaks2, col="white", las=1)

abline(h=c(1:length(breaks2)),col="white",lwd=2,xpd=F)


#Recipe 2. Creating correlation heat maps

genes<-read.csv("genes.csv")

rownames(genes)<-genes[,1]
data_matrix<-data.matrix(genes[,-1])

pal=heat.colors(5)

breaks<-seq(0,1,0.2)

layout(matrix(data=c(1,2), nrow=1, ncol=2), widths=c(8,1), heights=c(1,1))

par(mar = c(3,7,12,2),oma=c(0.2,0.2,0.2,0.2),mex=0.5)           

image(x=1:nrow(data_matrix),y=1:ncol(data_matrix),
	   z=data_matrix,
      xlab="",
      ylab="",
      breaks=breaks,
      col=pal,
      axes=FALSE)


text(x=1:nrow(data_matrix)+0.75, y=par("usr")[4] + 1.25, 
     srt = 45, adj = 1, labels = rownames(data_matrix), 
     xpd = TRUE)

axis(2,at=1:ncol(data_matrix),labels=colnames(data_matrix),col="white",las=1)

abline(h=c(1:ncol(data_matrix))+0.5,v=c(1:nrow(data_matrix))+0.5,col="white",lwd=2,xpd=F)

title("Correlation between genes",line=8,adj=0)

breaks2<-breaks[-length(breaks)]

# Color Scale
par(mar = c(25,1,25,7))
image(x=1, y=0:length(breaks2),z=t(matrix(breaks2))*1.001
      ,col=pal[1:length(breaks)-1]
       ,axes=FALSE
       ,breaks=breaks
      ,xlab="",ylab=""
      ,xaxt="n")

axis(4,at=0:(length(breaks2)),labels=breaks,col="white",las=1)
abline(h=c(1:length(breaks2)),col="white",lwd=2,xpd=FALSE)



#Recipe 3. Summarising multivariate data in a single heat map

nba <- read.csv("nba.csv")

library(RColorBrewer)

rownames(nba)<-nba[,1]

data_matrix<-t(scale(data.matrix(nba[,-1])))

pal=brewer.pal(6,"Blues")

statnames<-c("Games Played", "Minutes Played", "Total Points", "Field Goals Made", "Field Goals Attempted", "Field Goal Percentage", "Free Throws Made", "Free Throws Attempted", "Free Throw Percentage", "Three Pointers Made", "Three Pointers Attempted", "Three Point Percentage", "Offensive Rebounds", "Defensive Rebounds", "Total Rebounds", "Assists", "Steals", "Blocks", "Turnovers", "Fouls")

par(mar = c(3,14,19,2),oma=c(0.2,0.2,0.2,0.2),mex=0.5)

#Heat map          
image(x=1:nrow(data_matrix),y=1:ncol(data_matrix),
      z=data_matrix,
      xlab="",
      ylab="",
      col=pal,
      axes=FALSE)

#X axis labels
text(1:nrow(data_matrix), par("usr")[4] + 1, 
     srt = 45, adj = 0, 
     labels = statnames,
     xpd = TRUE, cex=0.85)

#Y axis labels
axis(side=2,at=1:ncol(data_matrix),
     labels=colnames(data_matrix),
     col="white",las=1, cex.axis=0.85)

#White separating lines
abline(h=c(1:ncol(data_matrix))+0.5,
       v=c(1:nrow(data_matrix))+0.5,
       col="white",lwd=1,xpd=F)

#Graph Title
text(par("usr")[1]+5, par("usr")[4] + 12,
     "NBA per game performance of top 50corers", 
     xpd=TRUE,font=2,cex=1.5)

nba <- nba[order(nba$PTS),]


#Recipe 4. Creating contour plots

contour(x=10*1:nrow(volcano), y=10*1:ncol(volcano), z=volcano,
		  xlab="Metres West",ylab="Metres North", 
		  main="Topography of Maunga Whau Volcano")


par(las=1)

plot(0,0,xlim=c(0,10*nrow(volcano)),ylim=c(0,10*ncol(volcano)),type="n",xlab="Metres West",ylab="Metres North",main="Topography of Maunga Whau Volcano")

u<-par("usr")

rect(u[1],u[3],u[2],u[4],col="lightgreen")

contour(x=10*1:nrow(volcano),y=10*1:ncol(volcano),
		  volcano,col="red",add=TRUE)


#Recipe 5. Creating filled contour plots


filled.contour(x = 10*1:nrow(volcano), 
		y = 10*1:ncol(volcano), 
		z = volcano, color.palette = terrain.colors, 
		plot.title = title(main = "The Topography of Maunga Whau",
	        xlab = "Meters North", 
		ylab = "Meters West"),
		plot.axes = {axis(1, seq(100, 800, by = 100))
            	axis(2, seq(100, 600, by = 100))},
		key.title = title(main="Height\n(meters)"),
		key.axes = axis(4, seq(90, 190, by = 10))) 

#Increased detail and smoothness

filled.contour(x = 10*1:nrow(volcano), 
		y = 10*1:ncol(volcano), 
		z = volcano, 
		color.palette = terrain.colors, 
		plot.title = title(main = "The Topography of Maunga Whau",
		xlab = "Meters North", 
		ylab = "Meters West"),
		nlevels=100,
		plot.axes = {axis(1, seq(100, 800, by = 100))
            		    axis(2, seq(100, 600, by = 100))},
		key.title = title(main="Height\n(meters)"),
		key.axes = axis(4, seq(90, 190, by = 10))) 


#Recipe 6. Creating 3-dimensional surface plots

install.packages("rgl")
library(rgl)

z <- 2 * volcano
x <- 10 * (1:nrow(z))
y <- 10 * (1:ncol(z))

zlim <- range(z)
zlen <- zlim[2] - zlim[1] + 1

colorlut <- terrain.colors(zlen) 
col <- colorlut[ z-zlim[1]+1 ] 

rgl.open()
rgl.surface(x, y, z, color=col, back="lines")


#Recipe 7. Visualizing time Series as calendar heat maps

source("calendarHeat.R")

stock.data <- read.csv("google.csv")

install.packages("chron")
library("chron")

calendarHeat(dates=stock.data$Date, 
	     values=stock.data$Adj.Close, 
	     varname="Google Adjusted Close")


#Using the openair package

install.packages("openair")
library(openair)

calendarPlot(mydata)

mydata$sales<-rnorm(length(mydata$nox),mean=1000,sd=1500)

calendarPlot(mydata,pollutant="sales",main="Daily Sales in 2003")

=================================================================================

#Recipe 1. Plotting global data by countries on a world map

install.packages("maps")
library(maps)
install.packages("WDI")
library(WDI)
install.packages("RColorBrewer")
library(RColorBrewer)

colors = brewer.pal(7,"PuRd")
wgdp<-WDIsearch("gdp")
w<-WDI(country="all", indicator=wgdp[4,1], start=2005, end=2005)

w[63,1] <-  "USA"

x<-map(plot=FALSE)


x$measure<-array(NA,dim=length(x$names))

for(i in 1:length(w$country)) {

	for(j in 1:length(x$names)) {
		if(grepl(w$country[i],x$names[j],ignore.case=T))
		  x$measure[j]<-w[i,3]
	}

}

sd = data.frame(col=colours,values=seq(min(x$measure[!is.na(x$measure)]),
max(x$measure[!is.na(x$measure)])*1.0001,length.out=7))

#intervals color scheme
sc<-array("#FFFFFF",dim=length(x$names))

for (i in 1:length(x$measure))
	if(!is.na(x$measure[i]))
	sc[i]=as.character(sd$col[findInterval(x$measure[i],sd$values)])

breaks<-sd$values

layout(matrix(data=c(2,1), nrow=1, ncol=2), widths=c(8,1), heights=c(8,1))

# Color Scale first
par(mar = c(20,1,20,7),oma=c(0.2,0.2,0.2,0.2),mex=0.5)           
image(x=1, y=0:length(breaks),z=t(matrix(breaks))*1.001
      ,col=colours[1:length(breaks)-1]
       ,axes=FALSE
       ,breaks=breaks
      ,xlab="",ylab=""
      ,xaxt="n")

axis(4,at=0:(length(breaks)-1),labels=round(breaks),col="white",las=1)
abline(h=c(1:length(breaks)),col="white",lwd=2,xpd=F)


#Map
z<-map(col=sc,fill=TRUE,lty="blank")
map(add=TRUE,col="gray",fill=FALSE)
title("CO2 emissions (kg per 2000 US$ of GDP)")



#Recipe 2. Creating graphs with regional maps

library(maps)
library(RColorBrewer)


x<-map("state",plot=FALSE)

for(i in 1:length(rownames(USArrests))) {
	for(j in 1:length(x$names)) {
	 if(grepl(rownames(USArrests)[i],x$names[j],ignore.case=T))
		  x$measure[j]<-as.double(USArrests$Murder[i])
	}
}

colours <- brewer.pal(7,"Reds")

sd <- data.frame(col=colours,
					values=seq(min(x$measure[!is.na(x$measure)]),
					max(x$measure[!is.na(x$measure)])*1.0001, 
					length.out=7))

breaks<-sd$values

matchcol<-function(y) {
	as.character(sd$col[findInterval(y,sd$values)])
}


layout(matrix(data=c(2,1), nrow=1, ncol=2), 
		 widths=c(8,1),heights=c(8,1))

# Color Scale first
par(mar = c(20,1,20,7),oma=c(0.2,0.2,0.2,0.2),mex=0.5)           
image(x=1, y=0:length(breaks),z=t(matrix(breaks))*1.001
      ,col=colours[1:length(breaks)-1]
       ,axes=FALSE
       ,breaks=breaks
      ,xlab="", ylab="", xaxt="n")
axis(4,at=0:(length(breaks)-1),labels=round(breaks),col="white",las=1)
abline(h=c(1:length(breaks)),col="white",lwd=2,xpd=F)

#Map
map("state", boundary = FALSE, 
		col=matchcol(x$measure), 
		fill=TRUE,lty="blank")

map("state", col="white",add = TRUE)

title("Murder Rates by US State in 1973 \n (arrests per 100,000 residents)", line=2)


map("county", "new york")

map("state", region = c("california", "oregon", "nevada"))	

map('italy', fill = TRUE, col = brewer.pal(7,"Set1"))



install.packages("sp")
library(sp)

load(url("http://gadm.org/data/rda/FRA_adm1.RData"))

gadm$rainfall<-rnorm(length(gadm$NAME_1),mean=50,sd=15)

spplot(gadm,"rainfall", col.regions = rev(terrain.colors(gadm$rainfall)),
		main="Rainfall  (simulated) in French administrative regions")


#Recipe 3. Plotting data on Google maps

install.packages("rgdal")
library(rgdal)

install.packages("RgoogleMaps")
library(RgoogleMaps)

air<-read.csv("londonair.csv")

london<-GetMap(center=c(51.51,-0.116), 
		zoom =10, destfile = "London.png", 
		maptype = "mobile")

PlotOnStaticMap(london,lat = air$lat, lon = air$lon, 
		cex=2,pch=19,col=as.character(air$color))


london<-GetMap(center=c(51.51,-0.116),zoom =10, 
destfile = "London_satellite.png", maptype = "satellite")

PlotOnStaticMap(london,lat = air$lat, lon = air$lon,
		cex=2,pch=19,col=as.character(air$color))


GetMap(center=c(40.714728,-73.99867), zoom =14, 
		 destfile = "Manhattan.png", maptype = "hybrid");


#Using OpenStreetMap
GetMap.OSM(lonR= c(-74.67102, -74.63943), 
			  latR = c(40.33804,40.3556), 
			  scale = 7500, destfile = "PrincetonOSM.png")


#Recipe 4. Creating and reading KML data

install.packages("rgdal")
library(rgdal)
cities <- readOGR(system.file("vectors", 
										package = "rgdal")[1], "cities")

writeOGR(cities, "cities.kml", "cities", driver="KML")

df <- readOGR("cities.kml", "cities")




#Recipe 5. Working with ESRI shapefiles

install.packages("maptools")
library(maptools)

sfdata <- readShapeSpatial(system.file("shapes/sids.shp", package="maptools")[1], 
							  proj4string=CRS("+proj=longlat"))

plot(sfdata, col="orange", border="white", axes=TRUE)

#Output as shapefile
writeSpatialShape(sfdata,"xxpoly")


install.packages("shapefiles")
library(shapefiles)

sf<-system.file("shapes/sids.shp", package="maptools")[1]
sf<-substr(sf,1,nchar(sf)-4)
sfdata <- read.shapefile(sf)

write.shapefile(sfdata, "newsf")

=====================================================================================

#Recipe 1. Exporting graphs in high resolution image formats: PNG, JPEG, BMP, TIFF


png("cars.png",res=200,height=600,width=600)

plot(cars$dist~cars$speed,
main="Relationship between car distance and speed",
xlab="Speed (miles per hour)",
ylab="Distance travelled (miles)",
xlim=c(0,30),
ylim=c(0,140),
xaxs="i",
yaxs="i",
col="red",
pch=19)

dev.off()


png("cars.png",res=200,height=600,width=600)

par(mar=c(4,4,3,1),omi=c(0.1,0.1,0.1,0.1),mgp=c(3,0.5,0),
	 las=1,mex=0.5,
	 cex.main=0.6,cex.lab=0.5,cex.axis=0.5)

plot(cars$dist~cars$speed,
main="Relationship between car distance and speed",
xlab="Speed (miles per hour)",
ylab="Distance travelled (miles)",
xlim=c(0,30),
ylim=c(0,140),
xaxs="i",
yaxs="i",
col="red",
pch=19,
cex=0.5)

dev.off()


#Recipe 2. Exporting graphs in vector formats: SVG, PDF, PS

pdf("cars.pdf")

plot(cars$dist~cars$speed,
main="Relationship between car distance and speed",
xlab="Speed (miles per hour)",
ylab="Distance travelled (miles)",
xlim=c(0,30),
ylim=c(0,140),
xaxs="i",
yaxs="i",
col="red",
pch=19,
cex=0.5)

dev.off()


svg("3067_10_03.svg")
#plot command here
dev.off()

postscript("3067_10_03.ps")
#plot command here
dev.off()


#Exporting to SVG for Windows users
install.packages("Cairo")
library(Cairo)
CairoSVG("3067_10_03.svg")
#plot command here
dev.off()


pdf("multiple.pdf")

for(i in 1:3)
  plot(cars,pch=19,col=i)

dev.off()



pdf("multiple.pdf",colormodel=”cmyk”)

for(i in 1:3)
  plot(cars,pch=19,col=i)

dev.off()




#Recipe 3. Adding Mathematical and scientific notations (typesetting)

plot(air,las=1,
main=expression(paste("Relationship between ",PM[10]," and ",NO[X])),
xlab=expression(paste(NO[X]," concentrations (",mu*g^-3,")")),
ylab=expression(paste(PM[10]," concentrations (",mu*g^-3,")")))


demo(plotmath)


#Recipe 4. Adding text descriptions to graphs


par(mar=c(12,4,3,2))
plot(rnorm(1000),main="Random Normal Distribution")

desc<-expression(paste("The normal distribution has density ",
f(x) == frac(1,sqrt(2*pi)*sigma)~ plain(e)^frac(-(x-mu)^2,2*sigma^2)))

mtext(desc,side=1,line=4,padj=1,adj=0)

mtext(expression(paste("where ", mu, " is the mean of the distribution and ",sigma," the standard deviation.")),side=1,line=7,padj=1,adj=0)



dailysales<-read.csv("dailysales.csv")

par(mar=c(5,5,12,2))

plot(units~as.Date(date,"%d/%m/%y"),data=dailysales,type="l",las=1,ylab="Units Sold",xlab="Date")

desc<-"The graph below shows sales data for Product A in the month of January 2010. There were a lot of ups and downs in the number of units sold. The average number of units sold was around 5000. The highest sales were recorded on the 27th January, nearly 7000 units sold."

mtext(paste(strwrap(desc,width=80),collapse="\n"),side=3,line=3,padj=0,adj=0)

title("Daily Sales Trends",line=10,adj=0,font=2)



#Recipe 5. Using Graph Templates

themeplot<-function(x,theme,...) {
  i<-which(themes$theme==theme)
  par(bg=as.character(themes[i,]$bg_color),las=1)

  plot(x,type="n",...)
  
  u<-par("usr")
  plotcol=as.character(themes[i,]$plot_color)
  rect(u[1],u[3],u[2],u[4],col=plotcol,border=plotcol)
  
  points(x,col=as.character(themes[i,]$symbol_color),...)
  box()
}

themeplot(rnorm(1000),theme="white",pch=21,main="White")
themeplot(rnorm(1000),theme="lightgray",pch=21,main="Light Gray")
themeplot(rnorm(1000),theme="dark",pch=21,main="Dark")
themeplot(rnorm(1000),theme="pink",pch=21,main="Pink")






#Recipe 6. Choosing font families and styles under Windows, OS X and Linux

par(mar=c(1,1,5,1))
plot(1:200,type="n",main="Fonts under Windows",axes=FALSE,xlab="",ylab="")

text(0,180,"Arial \n(family=\"sans\", font=1)", 
	  family="sans",font=1,adj=0)
text(0,140,"Arial Bold \n(family=\"sans\", font=2)", 
	  family="sans",font=2,adj=0)
text(0,100,"Arial Italic \n(family=\"sans\", font=3)", 
	  family="sans",font=3,adj=0)
text(0,60,"Arial Bold Italic \n(family=\"sans\", font=4)", 
	  family="sans",font=4,adj=0)

text(70,180,"Times \n(family=\"serif\", font=1)", 
	  family="serif",font=1,adj=0)
text(70,140,"Times Bold \n(family=\"serif\", font=2)", 
	  family="serif",font=2,adj=0)
text(70,100,"Times Italic \n(family=\"serif\", font=3)", 
	  family="serif",font=3,adj=0)
text(70,60,"Times Bold Italic \n(family=\"serif\", font=4)", 
	  family="serif",font=4,adj=0)

text(130,180,"Courier New\n(family=\"mono\", font=1)",
	  family="mono",font=1,adj=0)
text(130,140,"Courier New Bold \n(family=\"mono\", font=2)", 
	  family="mono",font=2,adj=0)
text(130,100,"Courier New Italic \n(family=\"mono\", font=3)",
	  family="mono",font=3,adj=0)
text(130,60,"Courier New Bold Italic \n(family=\"mono\", font=4)", 
	  family="mono",font=4,adj=0)



windowsFonts(GE = windowsFont("Georgia"))

text(150,80,"Georgia",family="GE")


#Recipe 7. Choosing fonts for PostScripts and PDFs

pdf("fonts.pdf",family="AvantGarde")
plot(rnorm(100),main="Random Normal Distribution")
dev.off()


postscript("fonts.ps",family="AvantGarde")
plot(rnorm(100),main="Random Normal Distribution")
dev.off()


names(pdfFonts())

