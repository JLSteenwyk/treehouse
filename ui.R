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
  titlePanel("treehouse - under development - do not use"),
  h4("Obtain subtrees from our treehouse"), 
  hr(),
  
  # Create a spot for the barplot
  sidebarLayout(
    sidebarPanel(
      # drop down select menu to select phylogeny
      selectInput("phyloSelect", "Species trees:",
        choices=c("Aspergillaceae - Steenwyk et al. 2018",
                  "Saccharomycotina - Shen et al. 2016",
                  "Saccharomycotina - placeholder")),
      # input file
      fileInput("file", "File input"),
      # reactive button
      actionButton("go", "Update"),
      hr(),
      # user instructions
      strong("Quick Start"),
      p("1) Select a phylogeny you want a subtree from"),
      p("2) Upload a single column text file that have genus and species name separated by an underscore (e.g., Aspergillus_flavus)"),
      p("3) Press the update button to display your desired subtree"),
      p("4) Download the figure as a pdf or a newick tree using the buttons below the phylogeny"),
      br(),
      br(),
      helpText("treehouse is developed and maintained by Jacob L. Steenwyk")
    ),
    
    mainPanel(
    plotOutput("phyloPlot", width = "100%"),
    downloadButton(outputId = "TreePlot", label = "Download Plot"),
    downloadButton(outputId = "Newick", label = "Download Newick File")
    )
  )
))
