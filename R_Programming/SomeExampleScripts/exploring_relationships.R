install.packages("mfp", dependencies=TRUE)
library(mfp)
data(bodyfat)
head(bodyfat)
plot(bodyfat$abdomen, bodyfat$siri, xlab="Abdomen", ylab="Percent body fat", pch=21)
abline(lm(mpg~wt), col="red")
lines(lowess(bodyfat$abdomen, bodyfat$siri), col="red", lwd="3")
library(car)
scatterplot(mpg ~ wt | cyl, data=mtcars, xlab="Weight of Car", ylab="Miles Per Gallon",
main="Enhanced Scatter Plot", labels=row.names(mtcars)) 

install.packages("car")
library(car)
data(mtcars)
#Simple scatterplot matrix
pairs(~mpg+disp+drat+wt, data=mtcars, main="Simple scatterplot matrix")

## Default S3 method:
scatterplotMatrix(x, var.labels=colnames(x), 
    diagonal=c("density", "boxplot", "histogram", "oned", "qqplot", "none"), 
    adjust=1, nclass,
    plot.points=TRUE, smoother=loessLine, smoother.args=list(), smooth, span,
    spread = !by.groups, reg.line=lm,
    transform=FALSE, family=c("bcPower", "yjPower"),
    ellipse=FALSE, levels=c(.5, .95), robust=TRUE,
    groups=NULL, by.groups=FALSE, 
    labels, id.method="mahal", id.n=0, id.cex=1, id.col=palette()[1],
    col=if (n.groups == 1) palette()[3:1] else rep(palette(), length=n.groups),
    pch=1:n.groups, lwd=1, lty=1, 
    cex=par("cex"), cex.axis=par("cex.axis"), cex.labels=NULL, 
    cex.main=par("cex.main"), 
    legend.plot=length(levels(groups)) > 1, row1attop=TRUE, ...)

# Scatterplot Matrices from the lattice Package
library(lattice)
splom(mtcars[c(1,3,5,6)], groups=cyl, data=mtcars,
   panel=panel.superpose,
   key=list(title="Three Cylinder Options",
   columns=3,
   points=list(pch=super.sym$pch[1:3],
   col=super.sym$col[1:3]),
   text=list(c("4 Cylinder","6 Cylinder","8 Cylinder")))) 

#The gclus package provides options to rearrange the variables so that those with higher 
#correlations are closer to the principal diagonal. It can also color code the cells to 
#reflect the size of the correlations.

# Scatterplot Matrices from the glus Package
library(gclus)
dta <- mtcars[c(1,3,5,6)] # get data
dta.r <- abs(cor(dta)) # get correlations
dta.col <- dmat.color(dta.r) # get colors
# reorder variables so those with highest correlation
# are closest to the diagonal
dta.o <- order.single(dta.r)
cpairs(dta, dta.o, panel.colors=dta.col, gap=.5,
main="Variables Ordered and Colored by Correlation" ) 

#When there are many data points and significant overlap, scatterplots become less 
#useful. There are several approaches that be used when this occurs. The hexbin(x, y) 
#function in the hexbin package provides bivariate binning into hexagonal cells (it 
#looks better than it sounds).

# High Density Scatterplot with Binning
library(hexbin)
x <- rnorm(1000)
y <- rnorm(1000)
bin<-hexbin(x, y, xbins=50)
plot(bin, main="Hexagonal Binning") 

#Finally, you can save the scatterplot in PDF format and use color transparency to 
#allow points that overlap to show through (this idea comes from B.S. Everrit in HSAUR).

# High Density Scatterplot with Color Transparency
pdf("c:/scatterplot.pdf")
x <- rnorm(1000)
y <- rnorm(1000)
plot(x,y, main="PDF Scatterplot Example", col=rgb(0,100,0,50,maxColorValue=255), pch=16)
dev.off()

#You can create a 3D scatterplot with the scatterplot3d package. Use the function 
#scatterplot3d(x, y, z).

# 3D Scatterplot

library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt,disp,mpg, main="3D Scatterplot")

# 3D Scatterplot with Coloring and Vertical Drop Lines
library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt,disp,mpg, pch=16, highlight.3d=TRUE,
  type="h", main="3D Scatterplot") 

# 3D Scatterplot with Coloring and Vertical Lines
# and Regression Plane

library(scatterplot3d)
attach(mtcars)
s3d <-scatterplot3d(wt,disp,mpg, pch=16, highlight.3d=TRUE,
  type="h", main="3D Scatterplot")
fit <- lm(mpg ~ wt+disp)
s3d$plane3d(fit)

#You can also create an interactive 3D scatterplot using the plot3D(x, y, z) function 
#in the rgl package. It creates a spinning 3D scatterplot that can be rotated with the 
#mouse. The first three arguments are the x, y, and z numeric vectors representing 
#points. col= and size= control the color and size of the points respectively.

# Spinning 3d Scatterplot
library(rgl)
plot3d(wt, disp, mpg, col="red", size=3) 

#You can perform a similar function with the scatter3d(x, y, z) in the Rcmdr package.
# Another Spinning 3d Scatterplot
library(Rcmdr)
attach(mtcars)
scatter3d(wt, disp, mpg) 


#=================================================================================

#To quantify the directiona nd strength of a linear relationshis between 2 numerical 
#variables we can use Pearson correlation Coefficient(r) as a summary statistics. The value of r is alwaz between -1 and +1

#Relationship between two categorical variables
library(MASS)
data(birthwt)
head(birthwt)
birthwt.low <- factor(birthwt$low)
birthwt.smoke <- factor(birthwt$smoke)
table(birthwt.smoke, birthwt.low)
help(birthwt)
p1 <- 29/115
p2 <- 30/74
risk <- (p2 -p1)/p1
risk
rel.risk <- p2/p1
odd1 <- p1/(1-p1)
odd2 <- p2/(1-p2)
rel.odd <- odd2/odd1
rel.odd
rel.risk

#Relationship between Numerical and categorical variables

dotchart(x, labels = NULL, groups = NULL, gdata = NULL,
         cex = par("cex"), pch = 21, gpch = 21, bg = par("bg"),
         color = par("fg"), gcolor = par("fg"), lcolor = "gray",
         xlim = range(x[is.finite(x)]),
         main = NULL, xlab = NULL, ylab = NULL, ...)

stripchart(x, method = "overplot", jitter = 0.1, offset = 1/3,
           vertical = FALSE, group.names, add = FALSE,
           at = NULL, xlim = NULL, ylim = NULL,
           ylab = NULL, xlab = NULL, dlab = "", glab = "",
           log = "", pch = 0, col = par("fg"), cex = par("cex"),
           axes = TRUE, frame.plot = axes, ...)

boxplot(x, ..., range = 1.5, width = NULL, varwidth = FALSE,
        notch = FALSE, outline = TRUE, names, plot = TRUE,
        border = par("fg"), col = NULL, log = "",
      pars = list(boxwex = 0.8, staplewex = 0.5, outwex = 0.5),
      horizontal = FALSE, add = FALSE, at = NULL)


#box plot between categorical and numerical variable using plot function
plot(cabbages$Cult, cabbages$VitC)

#dot plot between categorical and numerical variable using plot function
plot(birthwt$smoke, birthwt$bwt)
boxplot(bwt ~ smoke, data=birthwt, ylab="Birthweight",xlab="Smoking Status",main="Birthweight by Smoking Status")
#here bwt is responce variable and smoke is explanatory variable

#The summary stats of bwt can be calculated for each level of smoke. Using the 
#which() function, we can find the indices of smoking mothers(smoke = 1) in the 
#birthwt dataset

smoke.ind <- which(birthwt$smoke == 1)
summary(birthwt$bwt[smoke.ind])
sd(birthwt$bwt[smoke.ind])

#A more convenient way to obtain summary statistics by group is to use the by() 
#function. General form is by(data, group, function)

by(birthwt$bwt, birthwt$smoke, summary)

by(birthwt$bwt, birthwt$ht, sd)





