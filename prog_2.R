## 'directory' is a character vector of length 1 indicating
## the location of the csv file

## 'id' is an integer vector indicating the monitor ID numbers
## to be used 

## Return a data frame of the form:
## id nobs
## where 'id' is the monitor ID number and 'nobs' is the 
## number of complete class
complete <- function(directory, id = 1:332){
        #myData <- read.csv(file.path(directory,paste(formatC(0, width=3, flag="0"),"csv",sep=".")), header=TRUE,sep = ",")
        myData <- data.frame(NA,NA)
        colnames(myData) <- c("id","nobs")
        
        for(i in id){
                filePath <- file.path(directory,paste(formatC(i, width=3, flag="0"),"csv",sep="."))
                dt <-read.csv(file=filePath,header=TRUE,sep = ",")
                #completeDt <- subset(dt, (!is.na(dt$suplfate)))
                #completeDt <- subset(completeDt, (!is.na(dt$nitrate)))
                #myData <- rbind(myData, na.omit(dt))
                #myData[!is.na(myData$suplfate)]
                idData <- data.frame(i,nrow(na.omit(dt)))
                colnames(idData) <- c("id","nobs")
                #View(idData)
                myData <- rbind(myData, idData)
                #myData <- rbind(myData, data.frame(i, nrow(na.omit(dt))))
        }
        #myData
        #return(myData)
        #View(myData)
        na.omit(myData)
        #nrow(myData)
}