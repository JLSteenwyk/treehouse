![](www/treehouse_logo.png)

Phylogenies are rapidly becoming larger due to the number of available genomes increasing, however, large phylogenies often become uninterpretable as tip labels are so small or excluded altogether. As a result, large phylogenies can be difficult to use thereafter for other researchers especially those interested in the relationships among a subset of taxa. Here, we introduce <i>treehouse</i>, a user friendly shiny app that allows researchers to obtain subtrees from large-scale phylogenies. <i>Treehouse</i> is populated with a handful of large-scale phylogenies available through <i>treehouseDB</i>. Additionally, <i>treehouse</i> features an additional function, <i>userTree</i>, which allows a user to upload and parse their own phylogeny.

Our aim is to make phylogenies more accessible to all and facilitate researchers exploration in their own phylogenies. 

## Current phylogenies available
<br />
<center>

| Taxa represented                | Number of tips           | Reference                                                                       |
| ------------------------------- |:------------------------:| :-----------------------------------------------------------------------------: |
| *Aspergillus* and *Penicillium* | 81 taxa                  | [Steenwyk, et al. 2018](https://www.biorxiv.org/content/10.1101/370429v3)       |
| *Cryptococcus neoformans*       | 387 strains              | [Desjardins et al. 2017](https://genome.cshlp.org/content/27/7/1207.short)      |
| Fungi                           | 214 taxa                 | [James et al. 2006](https://www.nature.com/articles/nature05110)                |
| Fungi                           | 5,284 taxa               | [Varga et al. 2019](https://www.nature.com/articles/s41559-019-0834-1)          |
| *Saccharomyces cerevisiae*      | 1,011 strains            | [Peter, et al. 2018](https://www.nature.com/articles/s41586-018-0030-5)         |
| Saccharomycotina                | 86 taxa                  | [Shen, et al. 2016](http://www.g3journal.org/content/6/12/3927.abstract)        |
| Saccharomycotina                | 332 taxa                 | [Shen, et al. 2018](https://www.cell.com/cell/fulltext/S0092-8674(18)31332-1)   |

</center>

Please remember that these phylogenies are hypotheses; while most branches are robustly supported, a few show substantial conflict and should be treated with caution.

## Quick Start

### 1) Installing dependencies
Function of this app requires the shiny R package. To install this package, execute the typical R command within the R environment.
```R
install.packages("shiny", dep=T)
```

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

## Contributions and feedback
Others are welcome to contribute phylogenies to treehouse as well as provide user feedback. To provide a phylogeny or feedback, please contact me at jacob[dot]steenwyk[at]vanderbilt[dot]edu. Thank you!
<br />
<br />
treehouse is developed and maintained by [Jacob Steenwyk](https://jlsteenwyk.github.io/)

