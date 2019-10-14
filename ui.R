library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Global Average Temperatures Since 1850"),
    
    # Sidebar code starts here
    sidebarLayout(
        sidebarPanel(
 
            selectInput("Region", label = "View changes by global or regions:",
                        choices =  c("Global", "Northern Hemisphere", "Southern Hemisphere", "Tropics"), 
                        selected = "Global"),
            
            sliderInput("Yr", label ="Year", min = 1850, max = 2020, step = 10, value = c(1900,2010), format = "0000")),
        
        
        
        mainPanel(
            tabsetPanel( type = "tabs",
                         tabPanel("Plot", plotOutput("distPlot1")),
                         tabPanel("Summary", verbatimTextOutput("summary")),
                         tabPanel("Table", tableOutput("Mytable"))))
    )
)
)
