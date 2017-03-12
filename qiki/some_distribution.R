# exponential distribution（指数分布）
set.seed(1)
x<-seq(-1,2,length.out=100)
y<-dexp(x,0.5)
win.graph(width=8, height=8)
plot(x,y,col="red",xlim=c(0,2),ylim=c(0,5),type='l', 
	xaxs="i", yaxs="i",ylab='density',xlab='',
	main="The Exponential Density Distribution")
lines(x,dexp(x,1),col="green", lwd = 2)
lines(x,dexp(x,2),col="blue", lwd = 2)
lines(x,dexp(x,5),col="orange", lwd = 2)

legend("topright", legend = paste("rate=", c(.5, 1, 2, 5)),
	lwd=2,col=c("red", "green","blue","orange"))

set.seed(1)
x<-seq(-1,2,length.out=100)
y<-pexp(x,0.5)
win.graph(width=8, height=8)
plot(x,y,col="red",xlim=c(0,2),ylim=c(0,1),type='l',
	xaxs="i", yaxs="i",ylab='density',xlab='',
	main="The Exponential Cumulative Distribution Function")
lines(x,pexp(x,1),col="green", lwd = 2)
lines(x,pexp(x,2),col="blue", lwd = 2)
lines(x,pexp(x,5),col="orange", lwd = 2)

legend("bottomright", legend = paste("rate=", c(.5, 1, 2, 5)),
	lwd = 2, col = c("red", "green", "blue", "orange"))


# gamma distribution（伽马分布）
set.seed(1)
x<-seq(0,10,length.out=100)
y<-dgamma(x,1,2)

plot(x,y,col="red",xlim=c(0,10),ylim=c(0,2),type='l',
	xaxs="i", yaxs="i",ylab='density',xlab='',
	main="The Gamma Density Distribution")

lines(x,dgamma(x,2,2),col="green", lwd = 2)
lines(x,dgamma(x,3,2),col="blue", lwd = 2)
lines(x,dgamma(x,5,1),col="orange", lwd = 2)
lines(x,dgamma(x,9,1),col="black", lwd = 2)

legend("topright", legend = paste("shape=", c(1, 2, 3, 5, 9), " rate=",
c(2, 2, 2, 1, 1)),
	lwd = 2, col = c("red", "green", "blue", "orange", "black"))

set.seed(1)
x<-seq(0,10,length.out=100)
y<-pgamma(x,1,2)

plot(x,y,col="red",xlim=c(0,10),ylim=c(0,1),type='l',
	xaxs="i", yaxs="i",ylab='density',xlab='',
	main="The Gamma Cumulative Distribution Function")

lines(x,pgamma(x,2,2),col="green", lwd = 2)
lines(x,pgamma(x,3,2),col="blue", lwd = 2)
lines(x,pgamma(x,5,1),col="orange", lwd = 2)
lines(x,pgamma(x,9,1),col="black", lwd = 2)

legend("bottomright", legend = paste("shape=", c(1, 2, 3, 5, 9), " rate=",
	c(2, 2, 2, 1, 1)),
	lwd = 2, col = c("red", "green", "blue", "orange", "black"))

# normal distribution（正态分布）
set.seed(1)
x <- seq(-5,5,length.out=100)
y <- dnorm(x,0,1)
  
plot(x,y,col="red",xlim=c(-5,5),ylim=c(0,1),type='l',
	xaxs="i", yaxs="i",ylab='density',xlab='',
	main="The Normal Density Distribution")

lines(x,dnorm(x,0,0.5),col="green", lwd = 2)
lines(x,dnorm(x,0,2),col="blue", lwd = 2)
lines(x,dnorm(x,-2,1),col="orange", lwd = 2)

legend("topright", legend = paste("m=", c(0, 0, 0, -2), " sd=",
	c(1, 0.5, 2, 1)),
	lwd = 2, col = c("red", "green", "blue", "orange"))

set.seed(1)
x <- seq(-5,5,length.out=100)
y <- pnorm(x,0,1)

plot(x,y,col="red",xlim=c(-5,5),ylim=c(0,1),type='l',
	xaxs="i", yaxs="i",ylab='density',xlab='',
	main="The Normal Cumulative Distribution")

lines(x,pnorm(x,0,0.5),col="green", lwd = 2)
lines(x,pnorm(x,0,2),col="blue", lwd = 2)
lines(x,pnorm(x,-2,1),col="orange", lwd = 2)

legend("bottomright", legend = paste("m=", c(0, 0, 0, -2), " sd=",
	c(1, 0.5, 2, 1)),
	lwd=2,col=c("red", "green","blue","orange"))