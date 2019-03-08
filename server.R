#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(phytools)
library(ape)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  # read in file reactively
  data <- reactive({ 
    req(input$file)
    inFile <- input$file
    taxa.list<-read.table(inFile$datapath)
    return(taxa.list)
    })
  
  # print out contents of data
  output$contents <- renderTable({
    data()$V1
  }, include.colnames=FALSE)
  
  
  # function to create plot
  output$phyloPlot <- renderPlot({
    # read in tree
    tree<-read.tree("./Data/busco1668.nucl.part.tree")
    # root tree
    outgroup.labels=c("Neurospora_crassa","Microsporum_canis","Uncinocarpus_reesii","Trichophyton_rubrum","Basipetospora_chlamydospora","Coccidioides_posadasii","Paracoccidioides_brasiliensis","Trichoderma_reesei","Coccidioides_immitis","Histoplasma_capsulatum","Penicillium_occitanis","Penicillium_marneffei")
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
  
  # save pdf
  output$TreePlot<- downloadHandler(
    #Specify The File Name 
    filename = function() {
      paste("Aspergillaceae_subset-",Sys.Date(),".pdf",sep= "")},
    content = function(file){
      # open the pdf
      pdf(file)
      tree<-read.tree("./Data/busco1668.nucl.part.tree")
      # root tree
      outgroup.labels=c("Neurospora_crassa","Microsporum_canis","Uncinocarpus_reesii","Trichophyton_rubrum","Basipetospora_chlamydospora","Coccidioides_posadasii","Paracoccidioides_brasiliensis","Trichoderma_reesei","Coccidioides_immitis","Histoplasma_capsulatum","Penicillium_occitanis","Penicillium_marneffei")
      tree<-root(tree, outgroup = outgroup.labels, resolve.root = TRUE)
      # drop outgroup
      tree<-drop.tip(tree, outgroup.labels)
      ingroup.labels<-as.vector(data()$V1)
      pruned.tree<-drop.tip(tree,tree$tip.label[-match(ingroup.labels, tree$tip.label)])
      
      ## plot tree
      # create tip label scaling feature
      scaledLabels<-function(tree,...){
        fsize<-36*par()$pin[2]/par()$pin[1]/Ntip(tree)
        plotTree(tree,fsize=fsize,lwd=1,...)
      }
      scaledLabels(pruned.tree)
      add.scale.bar(cex = 0.7, font = 2, col = "black")
      dev.off()
    }
  )
  # write treefile
  output$Newick<- downloadHandler(
    # Specif the file name
    filename=function() {
      paste("Aspergillaceae_subset-",Sys.Date(),".tre",sep= "")},
    content=function(file){
      # read tree file in
      tree<-read.tree("./Data/busco1668.nucl.part.tree")
      # root tree
      outgroup.labels=c("Neurospora_crassa","Microsporum_canis","Uncinocarpus_reesii","Trichophyton_rubrum","Basipetospora_chlamydospora","Coccidioides_posadasii","Paracoccidioides_brasiliensis","Trichoderma_reesei","Coccidioides_immitis","Histoplasma_capsulatum","Penicillium_occitanis","Penicillium_marneffei")
      tree<-root(tree, outgroup = outgroup.labels, resolve.root = TRUE)
      # drop outgroup
      tree<-drop.tip(tree, outgroup.labels)
      ingroup.labels<-as.vector(data()$V1)
      pruned.tree<-drop.tip(tree,tree$tip.label[-match(ingroup.labels, tree$tip.label)])
      # write tree file out
      write.tree(phy)
    }
  )
})
