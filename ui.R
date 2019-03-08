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
  hr(),
  
  # Create a spot for the barplot
  sidebarLayout(
    sidebarPanel(
      h2("Obtain subtrees from the Aspergillus and Penicillium phylogeny"),
      p("Upload a single column file with the taxa from the phylogeny that you would like the subtree for."),
      p("Ensure that genus and species name have an underscore between them (e.g., Aspergillus_flavus)"),
      p("Dependencies include phytools and ape which can be installed using the following commands:"),
      code('install.packages(phytools, dep=T)'),
      code('install.packages(ape, dep=T)'),
      p("Please cite: Steenwyk, et al. 2018, bioRxiv. https://www.biorxiv.org/content/10.1101/370429v3")
    ),
    mainPanel(
    plotOutput("phyloPlot", width = "100%"),
    downloadButton(outputId = "TreePlot", label = "Download Plot"),
    downloadButton(outputId = "Newick", label = "Download Newick File")
    )
  )
))
