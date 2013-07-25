#reading and analysis of genepix microarrayer output .gpr files
file.block.one <- read.table("Slide54_Sample-Amphora-633-A1-160713-17_2-2.gpr", skip=34)
file.block.one
col.names <- c("Block", "Column", "Row", "Name", "ID", "X", "Y", "Dia.", "F633_Median", "F633_Mean", "F633_SD", "F633_CV", "B633", "B633_Median", "B633_Mean", "B633_SD", "B633_CV", "%>B633+1SD", "%>B633+2SD", "F633%_Sat.", "F532_Median", "F532_Mean", "F532_SD", "F532_CV", "B532", "B532_Median", "B532_Mean", "B532_SD", "B532_CV", "%>B532+1SD", "%>B532+2SD", "F532%Sat.", "Ratio_of_Medians(633/532)", "Ratio_of_Means(633/532)", "Median_of_Ratios(633/532)", "Mean_of_Ratios(633/532)", "Ratios_SD_(633/532)", "Rgn_Ratio_(633/532)", "Rgn_R2_(633/532)", "F_Pixels", "B_Pixels", "Circularity", "Sum_of_Medians(633/532)", "Sum_of_Means(633/532)", "Log_Ratio_(633/532)", "F633_Median-B633", "F532_Median-B532", "F633_Mean-B633", "F532_Mean-B532", "F633_Total_Intensity", "F532_Total_Intensity", "SNR_633", "SNR_532", "Flags", "Normalize", "Autoflag")
names(file.block.one) <- col.names
head(file.block.one)

source("http://bioconductor.org/biocLite.R")
biocLite("limma")
#These command are required once in each R session
library("affy")
library("limma")

targets <- readTargets("coralTargets.txt")
targets$FileName
coralRG <- read.maimages(targets$FileName, source="spot", other.columns=list(area="area", badspot="badspot"))
summary(coralRG$other$area)
plot(density(coralRG$other$area[,1]))
coralRG$genes <- readGAL()
coralRG$printer <- getLayout(coralRG$genes)
coralRG$printer
biocLite("DAAGbio")
library("DAAGbio")
plotprintseq()
spottypes <- readSpotTypes()
coralRG$genes$Status <- controlStatus(spottypes, coralRG)