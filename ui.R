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
  titlePanel("Aspergillus and Penicillium subtrees"),

  # input file
  fileInput("file", label = h3("File input")),
  p("Plot subtrees of select species in the phylogeny of Aspergillus and Penicillium species"),
  hr(),
  
  # Create a spot for the barplot
  mainPanel(
    downloadButton(outputId = "TreePlot", label = "Download Plot"),
    downloadButton(outputId = "Newick", label = "Download Newick File"),
    plotOutput("phyloPlot", width = "100%")
    
  )
))
