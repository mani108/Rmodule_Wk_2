## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the 
## number of completely observed observations(on all variables) required to compute
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations
## NOTE: Do not round the result!
corr <- function(directory, threshold = 0){
        compelteIdData <- complete("specdata")
        #View(compelteIdData)
        #names(compelteIdData) <- c("id","nobs")
        corsnum = numeric(0)
        filesData = compelteIdData[compelteIdData$nobs > threshold,]
        myData <- read.csv(file.path(directory,paste(formatC(0, width=3, flag="0"),"csv",sep=".")), header=TRUE,sep = ",")
        for(i in filesData$id){
                filePath <- file.path(directory,paste(formatC(i, width=3, flag="0"),"csv",sep="."))
                dt <-read.csv(file=filePath,header=TRUE,sep = ",")
                #myData <- rbind(myData, na.omit(dt))
                corsnum <- c(corsnum, cor(dt$sulfate, dt$nitrate, use = "pairwise.complete.obs"))        
        }
        return (corsnum)
}