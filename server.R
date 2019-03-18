#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


## Load necessary packages
if (!require("phytools")) {
   install.packages("phytools", dependencies = TRUE)
   library(phytools)
   }

# Define server logic
shinyServer(function(input, output, session) {
  
  ### 1ST PAGE
  ## read in file reactively
  data <- eventReactive(input$go, { 
    req(input$file)
    inFile <- input$file
    taxa.list<-read.table(inFile$datapath)
    return(taxa.list)
    })

  ## read in tree based on selected tree
  tree <- eventReactive(input$go, {
    if (input$phyloSelect == "Aspergillaceae, 81 taxa - Steenwyk et al. 2018") {
      tree <- read.tree("./Data/Aspergillaceae_fig1_Steenwyk_etal_2018.tre")
    } else if (input$phyloSelect == "Saccharomycotina, 86 taxa - Shen et al. 2016") {
      tree <- read.tree("./Data/Saccharomycotina_fig3_Shen_etal_2016.tre")
    } else if (input$phyloSelect == "Saccharomycotina, 332 taxa - Shen et al. 2018") {
      tree <- read.tree("./Data/Saccharomycotina_fig2_Shen_etal_2018.tre")
    } else if (input$phyloSelect == "Saccharomyces cerevisiae, 1,011 strains - Peter et al. 2018") {
      tree <- read.tree("./Data/Saccharomyces_cerevisiae_fig1_Peter_etal_2018.tre") 
    } else if (input$phyloSelect == "Cryptococcus neoformans, 387 strains - Desjardins et al. 2017") {
      tree <- read.tree("./Data/Cryptococcus_neoformans_fig1_Desjardins_etal_2017.tre")  
    } else if (input$phyloSelect == "Fungi, 214 species - James et al. 2006") {
      tree <- read.tree("./Data/Fungi_fig1_James_etal_2006.tre")  
    } else 
      tree <- read.tree("./Data/Aspergillaceae_fig1_Steenwyk_etal_2018.tre")
  })

  ## select outgroup labels based on selected tree
  outgroup.labels <- eventReactive(input$go, {input$phyloSelect
    if (input$phyloSelect == "Aspergillaceae, 81 taxa - Steenwyk et al. 2018") {
      outgroup.labels<-c("Neurospora_crassa","Microsporum_canis","Uncinocarpus_reesii","Trichophyton_rubrum","Basipetospora_chlamydospora","Coccidioides_posadasii","Paracoccidioides_brasiliensis","Trichoderma_reesei","Coccidioides_immitis","Histoplasma_capsulatum","Talaromyces_occitanis","Talaromyces_marneffei")
      }
      else if (input$phyloSelect == "Saccharomycotina, 86 taxa - Shen et al. 2016") {
      outgroup.labels<-c("Schizosaccharomyces_pombe","Arthrobotrys_oligospora","Neurospora_crassa","Fusarium_graminearum","Geotrichum_candidum_3C", "Botrytis_cinerea", "Sclerotinia_sclerotiorum", "Stagonospora_nodorum", "Aspergillus_nidulans","Xylona_heveae")
      }
      else if (input$phyloSelect == "Saccharomycotina, 332 taxa - Shen et al. 2018") {
      outgroup.labels<-c("Saitoella_complicata","Schizosaccharomyces_pombe","Arthrobotrys_oligospora","Fusarium_graminearum","Neurospora_crassa", "Sclerotinia_sclerotiorum", "Botrytis_cinerea", "Stagonospora_nodorum", "Aspergillus_nidulans","Xylona_heveae", "Coccidioides_immitis")
      }
      else if (input$phyloSelect == "Saccharomyces cerevisiae, 1,011 strains - Peter et al. 2018") {
      outgroup.labels<-c("AMH","CEG","CEI")
      }
      else if (input$phyloSelect == "Cryptococcus neoformans, 387 strains - Desjardins et al. 2017") {
      outgroup.labels<-c("8-1","AD3-11a","AD3-9a","AD5-67a","C12","C2","C45","LP-RSA1684","MW-RSA1327","MW-RSA3956","MW-RSA4119","MW_RSA852","PMHc1023.ENR","T4","Ug2462","WM626")
      }
      else if (input$phyloSelect == "Fungi, 214 species - James et al. 2006") {
      outgroup.labels<-c("Chlamydomonas_reinhardtii","Oryza_sativa","Arabidopsis_thaliana","Populus_trichocarpa")
      }
      else {
      outgroup.labels<-c("Neurospora_crassa","Microsporum_canis","Uncinocarpus_reesii","Trichophyton_rubrum","Basipetospora_chlamydospora","Coccidioides_posadasii","Paracoccidioides_brasiliensis","Trichoderma_reesei","Coccidioides_immitis","Histoplasma_capsulatum","Talaromyces_occitanis","Talaromyces_marneffei")
      }
    })

  ## display proper citation based on associated manuscript
  output$citationText <- renderText({
      if (input$phyloSelect == "Aspergillaceae, 81 taxa - Steenwyk et al. 2018") {
        paste("If you use this subtree, please cite: Steenwyk et al. 2018, bioRxiv. 10.1101/370429")
      } else if (input$phyloSelect == "Saccharomycotina, 86 taxa - Shen et al. 2016") {
        paste("If you use this subtree, please cite: Shen et al. 2016, G3. doi: 10.1534/g3.117.040105")
      } else if (input$phyloSelect == "Saccharomycotina, 332 taxa - Shen et al. 2018") {
        paste("If you use this subtree, please cite: Shen et al. 2018, Cell. doi: 10.1016/j.cell.2018.10.023")
      } else if (input$phyloSelect == "Saccharomyces cerevisiae, 1,011 strains - Peter et al. 2018") {
        paste("If you use this subtree, please cite: Peter et al. 2018, Nature. doi: 10.1038/s41586-018-0030-5")
      } else if (input$phyloSelect == "Cryptococcus neoformans, 387 strains - Desjardins et al. 2017") {
        paste("If you use this subtree, please cite: Desjardins et al. 2017, Genome Research. doi: 10.1101/gr.218727.116")
      } else if (input$phyloSelect == "Fungi, 214 species - James et al. 2006") {
        paste("If you use this subtree, please cite: James et al. 2006, Nature. doi: 10.1038/nature05110")
      } else 
        paste("If you use this subtree, please cite: Steenwyk et al. 2018, bioRxiv")
    })

  ## display table of taxa names
  tipNames <- eventReactive(input$go, {
      a<-data.frame(tree()$tip.label)
      # replace column name to "full list of taxa"
      colnames(a)[1]<-"full list of taxa for possible subtree"
      # return to df_subset
      return(a)
    })
  output$taxaTable <- renderTable(tipNames())
  
  ## function to create plot
  output$phyloPlot <- renderPlot({
    # root tree
    tree<-root(tree(), outgroup = outgroup.labels(), resolve.root = TRUE) 
    # drop outgroup tips not in ingroup.labels
    ingroup.labels<-as.vector(data()$V1)
    outgroup.labels<-setdiff(outgroup.labels(),ingroup.labels)
    tree<-drop.tip(tree, outgroup.labels)
    # prune taxa not of interest
    pruned.tree<-try(drop.tip(tree,tree$tip.label[-match(ingroup.labels, tree$tip.label)]), silent=TRUE)
    if("try-error" %in% class(pruned.tree)) stop("\nlist of tip names does not match names in phylogeny. Please check tip names again. A full list of tip names is available below\n\nR error:only 0's may be mixed with negative subscripts")
    # plot tree
    p<-try(plotTree(pruned.tree))
    if("try-error" %in% class(p)) p<-plot.phylo(pruned.tree)
    p
    add.scale.bar(cex = 0.7, font = 2, col = "black")
  })
  
  ## save pdf
  output$TreePlot<- downloadHandler(
    #Specify The File Name 
    filename = function() {
      paste("treehouse-",Sys.Date(),".pdf",sep= "")},
    content = function(file){
      # open the pdf
      pdf(file)
      # root tree
      tree<-root(tree(), outgroup = outgroup.labels(), resolve.root = TRUE)
      # drop outgroup tips not in ingroup.labels
      ingroup.labels<-as.vector(data()$V1)
      outgroup.labels<-setdiff(outgroup.labels(),ingroup.labels)
      tree<-drop.tip(tree, outgroup.labels)
      # prune taxa not of interest
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
      paste("treehouse-",Sys.Date(),".tre",sep= "")},
    content=function(file){
      # root tree
      tree<-root(tree(), outgroup = outgroup.labels(), resolve.root = TRUE)
      # drop outgroup tips not in ingroup.labels
      ingroup.labels<-as.vector(data()$V1)
      outgroup.labels<-setdiff(outgroup.labels(),ingroup.labels)
      tree<-drop.tip(tree, outgroup.labels)
      # prune taxa not of interest
      pruned.tree<-drop.tip(tree,tree$tip.label[-match(ingroup.labels, tree$tip.label)])
      # write tree file out
      write.tree(pruned.tree, file=file)
    }
  )

  ### 2ND PAGE
  ## read in file reactively
  userData <- eventReactive(input$userGO, { 
    req(input$fileUser)
    inFile <- input$fileUser
    taxa.list<-read.table(inFile$datapath)
    return(taxa.list)
  })

  ## read in tree based on selected tree
  userTree <- eventReactive(input$userGO, {
    req(input$treeFile)
    inFile <- input$treeFile
    userTree <- read.tree(inFile$datapath)
  })

  ## function to create plot
  output$userPhyloPlot <- renderPlot({
    # prune taxa not of interest
    ingroup.labels<-as.vector(userData()$V1)
    pruned.tree<-drop.tip(userTree(),userTree()$tip.label[-match(ingroup.labels, userTree()$tip.label)])
    # plot tree
    plotTree(pruned.tree)
    add.scale.bar(cex = 0.7, font = 2, col = "black")
  })
  
  ## save pdf
  output$userTreePlot<- downloadHandler(
    #Specify The File Name 
    filename = function() {
      paste("treehouse-",Sys.Date(),".pdf",sep= "")},
    content = function(file){
      # open the pdf
      pdf(file)
      # prune taxa not of interest
      ingroup.labels<-as.vector(userData()$V1)
      pruned.tree<-drop.tip(userTree(),userTree()$tip.label[-match(ingroup.labels, userTree()$tip.label)])
      # plot tree
      plotTree(pruned.tree)
      add.scale.bar(cex = 0.7, font = 2, col = "black")
      dev.off()
    }
  )

  ## write treefile
  output$userNewick<- downloadHandler(
    # Specify the file name
    filename=function() {
      paste("treehouse-",Sys.Date(),".tre",sep= "")},
    content=function(file){
      ingroup.labels<-as.vector(userData()$V1)
      pruned.tree<-drop.tip(userTree(),userTree()$tip.label[-match(ingroup.labels, userTree()$tip.label)])
      # write tree file out
      write.tree(pruned.tree, file=file)
    }
  )

})
