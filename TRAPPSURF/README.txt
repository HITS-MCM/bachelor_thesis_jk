pseudocode.txt  --> contains the pseudocode for TRAPPSURF (stand-alone and trapp version)

final_conservation-folder contains:

MSA --> contains all results in regards to the created multiple sequence allignment
runs_consurf --> contains all results from the ConSurf webserver
scrps --> contains all the scripts needed for the TRAPPSURF standad-alone version, trapp-integration
input_conservation.txt --> input file for the TRAPPSURF program
interaction_diagram.py/interaction_test.sh --> contains the initial methods to visualize the interaction of a ligand with the query structure. However, this was not completed and thus could contain errors, bugs etc.
runs_uniprotkb --> contains all the data in regards to TRAPPSURF runs for Potassium channels and HSP90 using NCBI BLAST, and PSIBLAST. They can be used as example how the output could look like. It also contains some files from previous versions of TRAPPSURF.


trapp-examples folder contains:
jmol-template.html --> contains the changes made on TRAPPSURF to integrate it into the webserver. In the command line version  it can be found using the path:
./auxi/templates/html/jmol/jmol_pocket.template.html
betalactamase--> example how the trappsurf implementation in trapp integrates the results
p38 --> example how the trappsurf implementation in trapp integrates the results
Both of these examples were taken from Yuan et al., 2020

