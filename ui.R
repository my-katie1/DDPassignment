library(shiny)
library(lubridate)
library(ggplot2)
Combined<-read.csv("API_combined.csv")

ui<-fluidPage(
  headerPanel("Major cities Air Pollutant Index 2013-2015"),
  sidebarPanel(
    selectInput("city",label="Select City", selected="Ipoh", choices=list("Ipoh","Penang","Petaling Jaya")),
    selectInput("year",label="Select Year", selected=2013, choices=c(2013,
                                                                     2014,2015)),
    selectInput("month",label="Select Month", selected=8, choices=c(1,
                                                                    2,3,4,5,6,7,8,9,10,11,12))
  ),
  mainPanel(
    plotOutput("plot1")
  )
)
