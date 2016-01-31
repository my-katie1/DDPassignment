library(shiny)
library(lubridate)
library(ggplot2)
Combined<-read.csv("API_combined.csv")

server<-function(input, output){
  output$plot1<-renderPlot({
    #Show city = selected city, month = selected month, year = selected year
    selecteddata <- Combined[Combined$City==input$city & month(Combined$Date)==input$month & year(Combined$Date)==input$year,]
    ggplot(data=selecteddata,aes(x=selecteddata$Hour, y=selecteddata$API))+geom_smooth(color="red")+labs(x="Hour", y="API Reading")+theme(axis.title= element_text(size=18), axis.text = element_text(size = 14))+
      ggtitle(paste("Air Pollutant Index for", input$city))+theme(plot.title = element_text(vjust = 0.2, hjust = 0.5, size = 24, color = "Blue", face="bold"))
  })
}
