#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


## Load necessary packages
library(shiny)
library(phytools)
library(ape)

## Set default tree and outgroup labels
#tree<-read.tree("./Data/Aspergillaceae_fig1_Steenwyk_etal_2018.tre")
#outgroup.labels=c("Neurospora_crassa","Microsporum_canis","Uncinocarpus_reesii","Trichophyton_rubrum","Basipetospora_chlamydospora","Coccidioides_posadasii","Paracoccidioides_brasiliensis","Trichoderma_reesei","Coccidioides_immitis","Histoplasma_capsulatum","Talaromyces_occitanis","Talaromyces_marneffei")
      

# Define server logic
shinyServer(function(input, output, session) {
  
  ## read in file reactively
  data <- reactive({ 
    req(input$file)
    inFile <- input$file
    taxa.list<-read.table(inFile$datapath)
    return(taxa.list)
    })
  
  ## ability to print out contents of data
  output$contents <- renderTable({
    data()$V1
  }, include.colnames=FALSE)
  
  ## select phylo reactively based on radiobuttons
  phyloInput <- reactive({input$phyloSelect
    if (input$phyloSelect == 1) {
      tree<-read.tree("./Data/Aspergillaceae_fig1_Steenwyk_etal_2018.tre")
      outgroup.labels=c("Neurospora_crassa","Microsporum_canis","Uncinocarpus_reesii","Trichophyton_rubrum","Basipetospora_chlamydospora","Coccidioides_posadasii","Paracoccidioides_brasiliensis","Trichoderma_reesei","Coccidioides_immitis","Histoplasma_capsulatum","Talaromyces_occitanis","Talaromyces_marneffei")
      }
      else if (input$phyloSelect == 2) {
      tree<-read.tree("./Data/Saccharomycotina_fig3_Shen_etal_2016.tre")
      outgroup.labels=c("Schizosaccharomyces_pombe","Arthrobotrys_oligospora","Neurospora_crassa","Fusarium_graminearum","Geotrichum_candidum_3C", "Botrytis_cinerea", "Sclerotinia_sclerotiorum", "Stagonospora_nodorum", "Aspergillus_nidulans","Xylona_heveae")
      }
      else if (input$phyloSelect == 3) {
      tree<-read.tree("./Data/Aspergillaceae_fig1_Steenwyk_etal_2018.tre")
      outgroup.labels=c("Neurospora_crassa","Microsporum_canis","Uncinocarpus_reesii","Trichophyton_rubrum","Basipetospora_chlamydospora","Coccidioides_posadasii","Paracoccidioides_brasiliensis","Trichoderma_reesei","Coccidioides_immitis","Histoplasma_capsulatum","Talaromyces_occitanis","Talaromyces_marneffei")
      }
      else {
      tree<-read.tree("./Data/Aspergillaceae_fig1_Steenwyk_etal_2018.tre")
      outgroup.labels=c("Neurospora_crassa","Microsporum_canis","Uncinocarpus_reesii","Trichophyton_rubrum","Basipetospora_chlamydospora","Coccidioides_posadasii","Paracoccidioides_brasiliensis","Trichoderma_reesei","Coccidioides_immitis","Histoplasma_capsulatum","Talaromyces_occitanis","Talaromyces_marneffei")
      }
    })
  
  ## function to create plot
  output$phyloPlot <- renderPlot({
    # root tree
    tree<-root(tree, outgroup = outgroup.labels, resolve.root = TRUE)
    # drop outgroup
    tree<-drop.tip(tree, outgroup.labels)
    ingroup.labels<-as.vector(data()$V1)
    pruned.tree<-drop.tip(tree,tree$tip.label[-match(ingroup.labels, tree$tip.label)])
    
    ## plot tree
    # create tip label scaling feature
    plotTree(pruned.tree)
    add.scale.bar(cex = 0.7, font = 2, col = "black")
  })
  
  ## save pdf
  output$TreePlot<- downloadHandler(
    #Specify The File Name 
    filename = function() {
      paste("Aspergillaceae_subset-",Sys.Date(),".pdf",sep= "")},
    content = function(file){
      # open the pdf
      pdf(file)
      # root tree
      tree<-root(tree, outgroup = outgroup.labels, resolve.root = TRUE)
      # drop outgroup
      tree<-drop.tip(tree, outgroup.labels)
      ingroup.labels<-as.vector(data()$V1)
      pruned.tree<-drop.tip(tree,tree$tip.label[-match(ingroup.labels, tree$tip.label)])
      # plot tree
      plotTree(pruned.tree)
      add.scale.bar(cex = 0.7, font = 2, col = "black")
      dev.off()
    }
  )
  
  ## write treefile
  output$Newick<- downloadHandler(
    # Specify the file name
    filename=function() {
      paste("Aspergillaceae_subset-",Sys.Date(),".tre",sep= "")},
    content=function(file){
      # root tree
      tree<-root(tree, outgroup = outgroup.labels, resolve.root = TRUE)
      # drop outgroup
      tree<-drop.tip(tree, outgroup.labels)
      ingroup.labels<-as.vector(data()$V1)
      pruned.tree<-drop.tip(tree,tree$tip.label[-match(ingroup.labels, tree$tip.label)])
      # write tree file out
      write.tree(pruned.tree, file=file)
    }
  )
})
