
#// After Removing NAs
pollutantmean <- function(directory, pollutant, id = 1:332){
        myData <- read.csv(file.path(directory,paste(formatC(0, width=3, flag="0"),"csv",sep=".")), header=TRUE,sep = ",")
        #View(myData)
        for(i in id){
                filePath <- file.path(directory,paste(formatC(i, width=3, flag="0"),"csv",sep="."))
                dt <-read.csv(file=filePath,header=TRUE,sep = ",")
                if(pollutant == "sulphate"){
                        #sulphates <- subset(dt, !is.na(dt$sulfate))
                        #print(names(sulphates))
                        myData <- rbind(myData, dt)
                        #View(myData)
                }else if(pollutant == "nitrate"){
                        #nitrate <- subset(dt, !is.na(dt$nitrate))
                        myData <- rbind(myData, dt)
                        #View(myData)
                }
        }
        #print(myData)
        if(pollutant == "sulphate"){
                Val <- myData$sulfate
                #View(myData$sulfate)
                Mean <- mean(as.integer(myData$sulfate), na.rm = FALSE)
                
        }else if(pollutant == "nitrate"){
                Val <- myData$nitrate
                #print(length(Val))
                #Mean <- sum(as.integer(myData$nitrate), na.rm = FALSE)/length(Val)
                Mean <- mean(as.integer(myData$sulfate, na.rm = FALSE))
        }
        Mean
}