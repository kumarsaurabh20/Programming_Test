slide15.1.2 <- read.csv("DNA/Slide15_1-2.csv", sep="\t")
slide15.1.2[slide15.1.2==0] <- NA
slide15.1.2.filtered <- slide15.1.2[complete.cases(slide15.1.2),]
library(MASS)
rownames(slide15.1.2.filtered) <- slide15.1.2.filtered$Probe
barplot(slide15.1.2.filtered$Norm_Mean, names.arg=slide15.1.2.filtered$Probe, axisnames=TRUE, cex.names=0.5, las=2, horiz=TRUE, xlab="Signal Intensity", main="Normalized Intensity graph of Slide15 1-2")