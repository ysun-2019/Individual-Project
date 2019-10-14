
library(shiny)
library(dplyr)
library(ggplot2)
library(reshape2)


# Define server logic required to draw a histogram


    
shinyServer(function(input, output) {
    
    
    output$distPlot1 <- renderPlot({
            
        temp <- read.csv("~/Downloads/temperature-anomaly.csv")
        
            temp2 <- temp %>% filter(Year >= input$Yr) %>%
                              filter(Year <= input$Yr) %>%
                              filter(Region == input$Region)  
            
            p <-  ggplot(temp2, aes(x=Year))
                
                p + geom_line (aes(y=Upper, color = "steelblue")) +
                    geom_line (aes(y=Median, color = "darkred")) + 
                    geom_line (aes(y=Lower, color = "green")) +
                    labs(x="Year", y="Average temperature in celsius") + 
                    facet_grid(Region~ .) +
                    scale_color_discrete(name = "Temp", labels=c("Median","Lower","Upper"))
              
            
    })
    
    output$summary <- renderPrint({
        temp <- read.csv("~/Downloads/temperature-anomaly.csv")
        temp2 <- temp %>% filter(Year >= input$Yr) %>%
            filter(Year <= input$Yr) %>%
            filter(Region == input$Region)
        summary(temp2)
    })
 
    output$Mytable <- renderTable({
        
        temp <- read.csv("~/Downloads/temperature-anomaly.csv")
        temp2 <- temp %>% filter(Year >= input$Yr) %>%
                          filter(Year <= input$Yr) %>%
                          filter(Region == input$Region)
        data <- data.frame(temp2)
    })
       
})
