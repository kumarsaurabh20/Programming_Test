slide15.1.2 <- read.csv("DNA/Slide15_1-2.csv", sep="\t")
slide15.1.2[slide15.1.2==0] <- NA
slide15.1.2.filtered <- slide15.1.2[complete.cases(slide15.1.2),]
library(MASS)
rownames(slide15.1.2.filtered) <- slide15.1.2.filtered$Probe
barplot(slide15.1.2.filtered$Norm_Mean, names.arg=slide15.1.2.filtered$Probe, axisnames=TRUE, cex.names=0.5, las=2, horiz=TRUE, xlab="Normalized Signal Values", main="Normalized Signals of Slide14 1-2 Sample=Eolimina Minima")
abline(v=1000)

#replicate comparison
plot(slide14.1.2$Norm_Mean, slide15.1.2$Norm_Mean)
plot(slide14.1.2$SN_mean, slide15.1.2$SN_mean)
slide14.1.2.log <- log(slide14.1.2$Norm_Mean)
slide15.1.2.log <- log(slide15.1.2$Norm_Mean)
plot(slide14.1.2.log, slide15.1.2.log)