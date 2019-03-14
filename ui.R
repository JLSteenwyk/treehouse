#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  navbarPage("",
    tabPanel("treehouseDB",
      # display logo
      titlePanel(title=div(img(src="treehouse_logo.png",""))), 
      hr(),
      # Create a spot for the choices
      sidebarLayout(
        sidebarPanel(
          # drop down select menu to select phylogeny
          selectInput("phyloSelect", "Species trees:",
            choices=c("Aspergillaceae, 81 taxa - Steenwyk et al. 2018",
                      "Saccharomycotina, 86 taxa - Shen et al. 2016",
                      "Saccharomycotina, 332 taxa - Shen et al. 2018",
                      "Saccharomyces cerevisiae, 1,011 strains - Peter et al. 2018")
                      ),
          # input file
          fileInput("file", "File input:"),
          # reactive button
          actionButton("go", "Update"),
          hr(),
          # user instructions
          h5("Quick Start"),
          p("1) Select a phylogeny you want a subtree from"),
          p("2) Upload a single column text file with species names of desired taxa in subtree. Species name format is 'Aspergillus_flavus'"),
          p("If you are unsure of what taxa names are used in the phylogeny, click the Update button and see the 'full list of taxa for possible subtree'"),
          p("3) Press the update button to display your desired subtree"),
          p("4) Download the figure as a pdf or a newick tree using the buttons below the phylogeny"),
          hr(),
          helpText("treehouse is developed and maintained by ", a("Jacob L. Steenwyk",href="https://jlsteenwyk.github.io/"))
        ),
        
        # plot phylogeny in main panel
        mainPanel(
          plotOutput("phyloPlot", width = "100%"),
          # download buttons
          downloadButton(outputId = "TreePlot", label = "Download Plot"),
          downloadButton(outputId = "Newick", label = "Download Newick File"),
          hr(),
          textOutput("citationText"),
          hr(),
          tableOutput('taxaTable')
          # close mainPanel
          )
      # close sidebarLayout
      )
    # close tabPanel, treehouseDB
    ),
    tabPanel("Test",
    #close tabPanel, Test
      # display logo
      titlePanel(title=div(img(src="treehouse_logo.png",""))), 
      hr(),
      # Create a spot for the choices
      sidebarLayout(
        sidebarPanel(
          # drop down select menu to select phylogeny
          selectInput("phyloSelect", "Species trees:",
            choices=c("Aspergillaceae, 81 taxa - Steenwyk et al. 2018",
                      "Saccharomycotina, 86 taxa - Shen et al. 2016",
                      "Saccharomycotina, 332 taxa - Shen et al. 2018",
                      "Saccharomyces cerevisiae, 1,011 strains - Peter et al. 2018")
                      ),
          # input file
          fileInput("file", "File input:"),
          # reactive button
          actionButton("go", "Update"),
          hr(),
          # user instructions
          h5("Quick Start"),
          p("1) Select a phylogeny you want a subtree from"),
          p("2) Upload a single column text file with species names of desired taxa in subtree. Species name format is 'Aspergillus_flavus'"),
          p("If you are unsure of what taxa names are used in the phylogeny, click the Update button and see the 'full list of taxa for possible subtree'"),
          p("3) Press the update button to display your desired subtree"),
          p("4) Download the figure as a pdf or a newick tree using the buttons below the phylogeny"),
          hr(),
          helpText("treehouse is developed and maintained by ", a("Jacob L. Steenwyk",href="https://jlsteenwyk.github.io/"))
        ),
        
        # plot phylogeny in main panel
        mainPanel(
          plotOutput("phyloPlot", width = "100%"),
          # download buttons
          downloadButton(outputId = "TreePlot", label = "Download Plot"),
          downloadButton(outputId = "Newick", label = "Download Newick File"),
          hr(),
          textOutput("citationText"),
          hr(),
          tableOutput('taxaTable')
          # close mainPanel
          )
      # close sidebarLayout
      )
    # close tabPanel, treehouseDB
    )
  )
))
