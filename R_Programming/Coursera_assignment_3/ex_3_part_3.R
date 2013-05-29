setwd("~/R/workspace")
outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
a <- table(outcome$State)
b <- subset(as.data.frame.table(table(outcome$State)), Freq > 20)
x <- as.character(b[,1])
outcome2 <- outcome[outcome$State %in% x,]
death <- outcome2[,11]
state <- outcome2$State
boxplot(death ~ state)
boxplot(death ~ state, ylab = "30 day Death Race")
title("Heart Attack 30-day Death Rate by State")
axis(1, at=a[,1], labels=a[,1], las=2)




