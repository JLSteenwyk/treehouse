![](www/treehouse_logo.png)

Phylogenies are rapidly becoming larger due to the rising number of available genomes. Beyond broad patterns, large phylogenies often become uninterpretable as tip labels are so small or excluded altogether. As a result, large phylogenies can be difficult to use for other researchers especially for groups interested in the relationships among a subset of taxa. Here, we introduce <i>treehouse</i>, a user friendly shiny app that allows researchers to obtain subtrees from large-scale phylogenies. <i>Treehouse</i> is populated with a handful of large-scale phylogenies available through <i>treehouseDB</i>. Additionally, <i>treehouse</i> features an additional function, <i>userTree</i>, which allows a user to upload and parse their own phylogeny.

Our aim is to make phylogenies more accessible to all and facilitate researchers exploration in their own phylogenies. 

## Quick Start

### 1) Installing dependencies
Function of this app requires the shiny R package. To install this package, execute the typical R command within the R environment.
```R
install.packages("shiny", dep=T)
install.packages("phytools", dep=T)
```
Treehouse has been tested using
• R version 3.5.2 (2018-12-20) -- "Eggshell Igloo"<br />
• phytools_0.6-60<br />
• maps_3.3.0<br />
• ape_5.3<br />
• shiny_1.2.0<br />

### 2) Opening up the shiny app
After installing dependencies load shiny and run the shiny app by executing the following command in R
```R
shiny::runGitHub("treehouse", "JLSteenwyk")
```

### 3) Input list of taxa
To view the evolutionary relationships between a set of taxa, click the "Browse..." button and select a file that has a single column of taxa names. For example, the file should look like the following:
```
Aspergillus_flavus
Aspergillus_oryzae
Aspergillus_fumigatus
Penicillium_solitum
Penicillium_antarcticum
```
See example_taxa_Aspergillaceae.txt as an example file in the present github repo

### 4) Download the result
To download the pdf of the phylogeny or the newick tree file, click "Download Plot" or "Download Newick File", respectively.
<br /><br />

## Current phylogenies available

### Animal
| Taxa represented                | Number of tips           | Reference                                                                                                               |
| ------------------------------- |:------------------------:| :---------------------------------------------------------------------------------------------------------------------: |
| Birds                           | 198 taxa                 | [Prum, et al. 2015](https://www.nature.com/articles/nature15697)                                                        |
| Birds                           | 48 taxa                  | [Jarvis et al. 2017](http://science.sciencemag.org/content/346/6215/1320)                                               |
| Insects                         | 144 taxa                 | [Misof et al. 2014](http://science.sciencemag.org/content/346/6210/763)                                                 |
| Mammals                         | 37 taxa                  | [Song et al. 2016](https://www.pnas.org/content/109/37/14942)                                                           |
| Mammals                         | 36 taxa                  | [Tarver, et al. 2016](https://academic.oup.com/gbe/article/8/2/330/2574016)                                             |
| Metazoans                       | 36 taxa                  | [Borowiec, et al. 2016](https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-015-2146-4)                       |
| Metazoans                       | 70 taxa                  | [Whelan, et al. 2015](https://www.pnas.org/content/112/18/5773)                                                         |
| Vertebrates                     | 58 taxa                  | [Chen, et al. 2015](https://academic.oup.com/sysbio/article/64/6/1104/1669963)                                          |
| Worms                           | 100 taxa                 | [Struck, et al. 2015](https://www.cell.com/current-biology/fulltext/S0960-9822(15)00672-7?code=cell-site)               |

### Fungi
| Taxa represented                | Number of tips           | Reference                                                                       |
| ------------------------------- |:------------------------:| :-----------------------------------------------------------------------------: |
| *Aspergillus* and *Penicillium* | 81 taxa                  | [Steenwyk, et al. 2018](https://www.biorxiv.org/content/10.1101/370429v3)       |
| *Cryptococcus neoformans*       | 387 strains              | [Desjardins et al. 2017](https://genome.cshlp.org/content/27/7/1207.short)      |
| Fungi                           | 214 taxa                 | [James et al. 2006](https://www.nature.com/articles/nature05110)                |
| Fungi                           | 5,284 taxa               | [Varga et al. 2019](https://www.nature.com/articles/s41559-019-0834-1)          |
| *Saccharomyces cerevisiae*      | 1,011 strains            | [Peter, et al. 2018](https://www.nature.com/articles/s41586-018-0030-5)         |
| Saccharomycotina                | 86 taxa                  | [Shen, et al. 2016](http://www.g3journal.org/content/6/12/3927.abstract)        |
| Saccharomycotina                | 332 taxa                 | [Shen, et al. 2018](https://www.cell.com/cell/fulltext/S0092-8674(18)31332-1)   |

### Plant
| Taxa represented                | Number of tips           | Reference                                                                       |
| ------------------------------- |:------------------------:| :-----------------------------------------------------------------------------: |
| Caryophyllales                  | 95 taxa                  | [Yang, et al. 2015](https://academic.oup.com/mbe/article/32/8/2001/2925547)     |
| Flowering plants                | 45 taxa                  | [Xi et al. 2014](https://academic.oup.com/sysbio/article/63/6/919/2847851)      |
| Land plants                     | 103 taxa                 | [Wickett et al. 2014](https://www.pnas.org/content/111/45/E4859)                |

### Tree of Life
| Taxa represented                | Number of tips           | Reference                                                                       |
| ------------------------------- |:------------------------:| :-----------------------------------------------------------------------------: |
| Tree of Life                    | 3,083 taxa               | [Hug, et al. 2016](https://www.nature.com/articles/nmicrobiol201648)            |

Please remember that these phylogenies are hypotheses; while most branches are robustly supported, a few show substantial conflict and should be treated with caution.

## Contributions and feedback
Others are welcome to contribute phylogenies to treehouse as well as provide user feedback. To provide a phylogeny or feedback, please contact me at jacob[dot]steenwyk[at]vanderbilt[dot]edu. Thank you!
<br />
<br />
treehouse is developed and maintained by [Jacob Steenwyk](https://jlsteenwyk.github.io/)

