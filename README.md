# treehouse

Aspergillus and Penicillium are genera of fungi who's species are of medical and technologic importance. To understand these traits, we have reconstructed the evolutionary history of Aspergillus and Penicillium species. 
<br />
However, we recognize that researchers may be interested in a subset of taxa from the phylogeny. To this end, we have created this shiny app to enable researchers to obtain a subset of species from the ingroup (Aspergillaceae) in the putative species tree presented in Figure 1 of Steenwyk et al. 2018, bioRxiv.
<br />
If you use this, please cite Steenwyk et al. 2018, bioRxiv (https://www.biorxiv.org/content/early/2018/10/27/370429)

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
library(shiny)
runGitHub("Aspergillaceae_subtree", "JLSteenwyk")
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

### 4) Download the result
To download the pdf of the phylogeny or the newick tree file, click "Download Plot" or "Download Newick File", respectively.
<br /><br />
Thank you for using this app!
