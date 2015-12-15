library(shiny)

Immigrant <- read.csv("errors.csv")

# Defining errors for dataframe

doc <- table (Immigrant$Documentation, Immigrant$Center)

doc.frame <- as.data.frame (doc)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$ErrorPlot <- renderPlot({
    
   dat <- doc.frame[doc.frame$Var2 == input$center, ]
    
    # Render a barplot
    barplot(doc[, input$center],
            main=input$center, 
            col = "light blue",
            ylab="Number of Errors",
            xlab="Documents")
  })
})

