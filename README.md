![](www/treehouse_logo.png)

Research groups I am involved in create large phylogenies and we hope our analyses can provide the evolutionary background to inform other research group's projects. However, we recognize our choice in taxon sampling may provide more information than a researcher needs. To this end, we have created treehouse, which produces a subtree from a set of taxa. For example, if we constructed a phylogeny of 100 taxa and your research project involves 20 taxa, you can obtain a subtree of these 20 taxa from the published 100 taxa phylogeny. 
<br />
## Current phylogenies available
• Aspergillus and Penicillium species (Aspergillaceae), 81 taxa - [Steenwyk, et al. 2018](https://www.biorxiv.org/content/10.1101/370429v3)<br />
• Saccharomycotina, 86 taxa - [Shen, et al. 2016](http://www.g3journal.org/content/6/12/3927.abstract)<br />
• Saccharomycotina, 332 taxa - [Shen, et al. 2018](https://www.cell.com/cell/fulltext/S0092-8674(18)31332-1)<br /><br />
Please remember that these phylogenies are hypotheses; while most branches are robustly supported, a few show substantial conflict and should be treated with caution.

## Quick Start

### 1) Installing dependencies
The shiny app assumes shiny, phytools, and ape are installed. To install these packages, execute the typical R command within the R environment.
```
install.packages("shiny", dep=T)
install.packages("ape", dep=T)
install.packages("phytools", dep=T)
```

### 2) Opening up the shiny app
After installing dependencies load shiny and run the shiny by executing the runGitHub() command
```
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
I welcome others contributing phylogenies to treehouse as well as user feedback. To provide a phylogeny or feedback, please contact me at jacob[dot]steenwyk[at]vanderbilt[dot]edu. Thank you!

## Author
* **Jacob Steenwyk** - [Github page](https://jlsteenwyk.github.io/)

