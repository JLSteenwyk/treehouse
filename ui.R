library(shiny)

# Define UI for application
shinyUI(fluidPage(
  navbarPage("",
    # open userTree
    tabPanel("userTree",
      # display logo
      titlePanel(title=div(img(src="treehouse_logo.png",""))), 
      hr(),
      # Create a spot for the choices
      sidebarLayout(
        sidebarPanel(
          # input file
          fileInput("treeFile", "Tree input:"),
          # input file
          fileInput("fileUser", "Taxa input:"),
          # reactive button
          actionButton("userGO", "Update"),
          hr(),
          # user instructions
          h5("Quick Start"),
          p("1) Upload a phylogeny you want a subtree from in Tree input:'"),
          p("2) Upload a single column text file with species names of desired taxa in subtree."),
          p("If you are unsure of what taxa names are used in the phylogeny, click the Update button and see the 'full list of taxa for possible subtree'"),
          p("3) Press the update button to display your desired subtree"),
          p("4) Download the figure as a pdf or a newick tree using the buttons below the phylogeny"),
          hr(),
          helpText("treehouse is developed and maintained by ", a("Jacob L. Steenwyk",href="https://jlsteenwyk.github.io/"))
        ),
        
        # plot phylogeny in main panel
        mainPanel(
          plotOutput("userPhyloPlot", width = "100%"),
          # download buttons
          downloadButton(outputId = "userTreePlot", label = "Download Plot"),
          downloadButton(outputId = "userNewick", label = "Download Newick File"),
          downloadButton(outputId = "userNewickNOBL", label = "Download Newick File (w/out branch lengths)"),
          hr(),
          tableOutput('USERtaxaTable')
          # close mainPanel
          )
      # close sidebarLayout
      )
    # close tabPanel, userTree
    ),
    tabPanel("Animal",
      # display logo
      titlePanel(title=div(img(src="treehouse_logo.png",""))), 
      hr(),
      # Create a spot for the choices
      sidebarLayout(
        sidebarPanel(
          # drop down select menu to select phylogeny
          selectInput("ANIMALphyloSelect", "Phylogeny:",
            choices=c("Birds, 198 taxa - Prum et al. 2015",
                      "Birds, 48 taxa - Jarvis et al. 2014",
                      "Insects, 144 taxa - Misof et al. 2014",
                      "Mammals, 37 taxa - Song et al. 2016",
                      "Mammals, 36 taxa - Tarver et al. 2016",
                      "Metazoans, 36 taxa - Borowiec et al. 2015",
                      "Metazoans, 70 taxa - Whelan et al. 2015",
                      "Vertebrates, 58 taxa - Chen et al. 2015",
                      "Worms, 100 taxa - Struck et al. 2015")
                      ),
          # input file
          fileInput("ANIMALfile", "File input:"),
          # reactive button
          actionButton("ANIMALgo", "Update"),
          hr(),
          # user instructions
          h5("Quick Start"),
          p("1) Select a phylogeny you want a subtree from"),
          p("2) Upload a single column text file with species names of desired taxa in subtree."),
          p("If you are unsure of what taxa names are used in the phylogeny, click the Update button and see the 'full list of taxa for possible subtree'"),
          p("3) Press the update button to display your desired subtree"),
          p("4) Download the figure as a pdf or a newick tree using the buttons below the phylogeny"),
          hr(),
          helpText("treehouse is developed and maintained by ", a("Jacob L. Steenwyk",href="https://jlsteenwyk.github.io/"))
        ),
        
        # plot phylogeny in main panel
        mainPanel(
          plotOutput("ANIMALphyloPlot", width = "100%"),
          # download buttons
          downloadButton(outputId = "ANIMALTreePlot", label = "Download Plot"),
          downloadButton(outputId = "ANIMALNewick", label = "Download Newick File"),
          downloadButton(outputId = "ANIMALNewickNOBL", label = "Download Newick File (w/out branch lengths)"),
          hr(),
          textOutput("ANIMALcitationText"),
          hr(),
          tableOutput('ANIMALtaxaTable')
          # close mainPanel
          )
      # close sidebarLayout
      )
    # close tabPanel, Animal
    ),
    tabPanel("Fungi",
      # display logo
      titlePanel(title=div(img(src="treehouse_logo.png",""))), 
      hr(),
      # Create a spot for the choices
      sidebarLayout(
        sidebarPanel(
          # drop down select menu to select phylogeny
          selectInput("FUNGIphyloSelect", "Phylogeny:",
            choices=c("Aspergillus and Penicillium, 81 taxa - Steenwyk et al. 2019",
                      "Cryptococcus neoformans, 387 strains - Desjardins et al. 2017",
                      "Fungi, 214 taxa - James et al. 2006",
                      "Fungi, 60 taxa - Nagy et al. 2014",
                      "Agaricomycetes, 5,284 taxa - Varga et al. 2019",
                      "Saccharomyces cerevisiae, 1,011 strains - Peter et al. 2018",
                      "Saccharomycotina, 86 taxa - Shen et al. 2016",
                      "Saccharomycotina, 332 taxa - Shen et al. 2018",
                      "Ascomycota, 1,113 taxa - Shen et al. 2020")
                      ),
          # input file
          fileInput("FUNGIfile", "File input:"),
          # reactive button
          actionButton("FUNGIgo", "Update"),
          hr(),
          # user instructions
          h5("Quick Start"),
          p("1) Select a phylogeny you want a subtree from"),
          p("2) Upload a single column text file with species names of desired taxa in subtree."),
          p("If you are unsure of what taxa names are used in the phylogeny, click the Update button and see the 'full list of taxa for possible subtree'"),
          p("3) Press the update button to display your desired subtree"),
          p("4) Download the figure as a pdf or a newick tree using the buttons below the phylogeny"),
          hr(),
          helpText("treehouse is developed and maintained by ", a("Jacob L. Steenwyk",href="https://jlsteenwyk.github.io/"))
        ),
        
        # plot phylogeny in main panel
        mainPanel(
          plotOutput("FUNGIphyloPlot", width = "100%"),
          # download buttons
          downloadButton(outputId = "FUNGITreePlot", label = "Download Plot"),
          downloadButton(outputId = "FUNGINewick", label = "Download Newick File"),
          downloadButton(outputId = "FUNGINewickNOBL", label = "Download Newick File (w/out branch lengths)"),
          hr(),
          textOutput("FUNGIcitationText"),
          hr(),
          tableOutput('FUNGItaxaTable')
          # close mainPanel
          )
      # close sidebarLayout
      )
    # close tabPanel, Fungi
    ),
    tabPanel("Plant",
      # display logo
      titlePanel(title=div(img(src="treehouse_logo.png",""))), 
      hr(),
      # Create a spot for the choices
      sidebarLayout(
        sidebarPanel(
          # drop down select menu to select phylogeny
          selectInput("PLANTphyloSelect", "Phylogeny:",
            choices=c("Caryophyllales, 95 taxa - Yang et al. 2015",
                      "Flowering plants, 45 taxa - Xi et al. 2014",
                      "Land plants, 103 taxa - Wickett et al. 2014")
                      ),
          # input file
          fileInput("PLANTfile", "File input:"),
          # reactive button
          actionButton("PLANTgo", "Update"),
          hr(),
          # user instructions
          h5("Quick Start"),
          p("1) Select a phylogeny you want a subtree from"),
          p("2) Upload a single column text file with species names of desired taxa in subtree."),
          p("If you are unsure of what taxa names are used in the phylogeny, click the Update button and see the 'full list of taxa for possible subtree'"),
          p("3) Press the update button to display your desired subtree"),
          p("4) Download the figure as a pdf or a newick tree using the buttons below the phylogeny"),
          hr(),
          helpText("treehouse is developed and maintained by ", a("Jacob L. Steenwyk",href="https://jlsteenwyk.github.io/"))
        ),
        
        # plot phylogeny in main panel
        mainPanel(
          plotOutput("PLANTphyloPlot", width = "100%"),
          # download buttons
          downloadButton(outputId = "PLANTTreePlot", label = "Download Plot"),
          downloadButton(outputId = "PLANTNewick", label = "Download Newick File"),
          downloadButton(outputId = "PLANTNewickNOBL", label = "Download Newick File (w/out branch lengths)"),
          hr(),
          textOutput("PLANTcitationText"),
          hr(),
          tableOutput('PLANTtaxaTable')
          # close mainPanel
          )
      # close sidebarLayout
      )
    # close tabPanel, Plant
    ),
    tabPanel("Tree of Life",
      # display logo
      titlePanel(title=div(img(src="treehouse_logo.png",""))), 
      hr(),
      # Create a spot for the choices
      sidebarLayout(
        sidebarPanel(
          # drop down select menu to select phylogeny
          selectInput("TOLphyloSelect", "Phylogeny:",
            choices=c("Tree of life, 3,083 taxa - Hug et al. 2016")
                      ),
          # input file
          fileInput("TOLfile", "File input:"),
          # reactive button
          actionButton("TOLgo", "Update"),
          hr(),
          # user instructions
          h5("Quick Start"),
          p("1) Select a phylogeny you want a subtree from"),
          p("2) Upload a single column text file with species names of desired taxa in subtree."),
          p("If you are unsure of what taxa names are used in the phylogeny, click the Update button and see the 'full list of taxa for possible subtree'"),
          p("3) Press the update button to display your desired subtree"),
          p("4) Download the figure as a pdf or a newick tree using the buttons below the phylogeny"),
          hr(),
          helpText("treehouse is developed and maintained by ", a("Jacob L. Steenwyk",href="https://jlsteenwyk.github.io/"))
        ),
        
        # plot phylogeny in main panel
        mainPanel(
          plotOutput("TOLphyloPlot", width = "100%"),
          # download buttons
          downloadButton(outputId = "TOLTreePlot", label = "Download Plot"),
          downloadButton(outputId = "TOLNewick", label = "Download Newick File"),
          downloadButton(outputId = "TOLNewickNOBL", label = "Download Newick File (w/out branch lengths)"),
          hr(),
          textOutput("TOLcitationText"),
          hr(),
          tableOutput('TOLtaxaTable')
          # close mainPanel
          )
      # close sidebarLayout
      )
    # close tabPanel, Plant
    )
  # close navbarPage
  )
# close shinyUI and fliudPage  
))
