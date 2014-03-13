# make sure to convert them in character and numeric vectors
probe <- c('POSITIVE_25_dT','Poly-T-CY5')
col_1 <- c('POSITIVE_25_dT', 'Poly-T-CY5', 'EukS_1209_25_dT', 'Test15 (EukS_1209_25dT)','EukS_328_25_dT')
col_2 <- c(7.55E+07, 4.51E+08, 4102788.91290624, 3242670.65825, 4564828.4446875)
col_3 <- c(5.73E+07, 3.97E+08, 1.68E+07, 1.99E+07, 2.18E+07)
col_4 <- c(1.01E+08, 2.39E+08, 2.62E+08, 3.92E+08, 4.40E+08)
col_5 <- c(8.87E+07, 3.41E+08, 5.41E+08, 3.73E+08, 6.77E+08)

table <- data.frame(col_1,col_2,col_3,col_4,col_5)
#match the selected probe in the table
newData <- subset(table, col_1 == probe[1], select=c(col_2, col_3, col_4, col_5))
newData2 <- subset(table, col_1 == probe[2], select=c(col_2, col_3, col_4, col_5))

#convert the found row of values from data.frame to numeric
values <- as_numeric(newData)
values2 <- as.numeric(newData2)

#divide each column of the table by the respective probe values and create a new table repat it with different probes.

#make a new table with the cell count and different probe normalization and calculate for individual probes

#finally return a data.frame with probe names and cell counts
