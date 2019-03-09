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

  hr(),
  
  # Create a spot for the barplot
  sidebarLayout(
    sidebarPanel(
      # header
      h4("Obtain subtrees from our treehouse"),
      # radio buttons for which phylogeny a user wants to subset
      radioButtons("phyloSelect", label = h3("tree options"), 
        choices = list("Aspergillaceae - Steenwyk et al. 2018" = 1, "Saccharomycotina - Shen et al. 2016" = 2, "Saccharomycotina - placeholder" = 3),
        selected = 1),
      # input file
      fileInput("file", label = h3("File input")),
      # user instructions
      p("• Upload a single column file with the taxa from the phylogeny that you would like the subtree for."),
      p("• Ensure that genus and species name have an underscore between them (e.g., Aspergillus_flavus)"),
      p("• Dependencies include phytools and ape which can be installed using the following commands:"),
      code('install.packages(phytools, dep=T)'),
      code('install.packages(ape, dep=T)'),
      br(),
      br(),
      br(),
      p("treehouse was developed and maintained by Jacob L. Steenwyk")
    ),
    mainPanel(
    plotOutput("phyloPlot", width = "100%"),
    downloadButton(outputId = "TreePlot", label = "Download Plot"),
    downloadButton(outputId = "Newick", label = "Download Newick File")
    )
  )
))
