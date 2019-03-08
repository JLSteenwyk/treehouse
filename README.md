# Tree pruner for the Aspergillus and Penicillium phylogeny

Aspergillus and Penicillium are genera of fungi who's species are of medical and technologic importance. To understand these traits, we have reconstructed the evolutionary history of Aspergillus and Penicillium species. 
<br />
However, we recognize that researchers may be interested in a subset of taxa from the phylogeny. To this end, we have created this shiny app to enable researchers to obtain a subset of species from the ingroup (Aspergillaceae) in the putative species tree presented in Figure 1 of Steenwyk et al. 2018, bioRxiv.
<br />
If you use this, please cite Steenwyk et al. 2018, bioRxiv (https://www.biorxiv.org/content/early/2018/10/27/370429)

## Scripts

A short description of each script

### Find_indel_unqiue_to_clade.py
Identifies indels unique to specific clades within an alignment fasta file.
Indels are identified using user specified step and window sizes.
Separate files for each clade should be provided that contains one taxa name
per line. <br />
For detailed information use the -h argument <br />
```
python3
|- sys
|- getopt
|- os.path