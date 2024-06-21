#!/bin/env python
import os
file= open('input_data.txt','r')
for line in file:
    if 'receptor_name' in line:
        rec_name = line.split(":")[-1].strip()
    elif 'lig_name' in line:
        lig_name = line.split(":")[-1].strip()

# user input/ later from different program
    

    # obabel conversion...

os.system('obabel -ipdb '+str(lig_name)+'.pdb -omol2 -O'+str(lig_name)+'.mol2')

#activating the license
os.system('BIOSOLVE_LICENSE_FILE=/home/kunzjn/poseview.lic && export BIOSOLVE_LICENSE_FILE=/home/kunzjn/poseview.lic && /home/kunzjn/poseview-1.1.2-Linux-x64/poseview -l '+str(lig_name)+'.mol2 -p '+str(rec_name)+'.pdb -o 2d-interaction.pdf')
