#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # generate a page title
  titlePanel("PhyloViewer"),

  # input file
  fileInput("file", label = h3("File input")),
  hr(),
  
  # Create a spot for the barplot
  mainPanel(
    plotOutput("phyloPlot", width = "100%"),
    downloadButton(outputId = "TreePlot", label = "Download The Plot")
  )
))
