#!/bin/env python
import os
import subprocess
import pandas as pd
import numpy as np
from Bio.PDB import *
import time

def func(name):

    crys_key=name_lig.split(".")[0].strip()

    ### AUTODOCK COMMANDS ###
    method = 'vinardo'
    link ='/usr/bin/vina' 
    #Autodock should be found by this link. If you have defined autodock by a different path change it here and there will be no further issues
    link ='/usr/bin/vina' 
    os.system('prepare_receptor -r '+str(dic_pdb_lig[str(crys_key)])+'.pdb -A "hydrogens" -o receptor.pdbqt')
    os.system('prepare_ligand -l '+name+' -o ligand.pdbqt')

    ### COMMANDS FOR OPTIMAL GRID SPACE ###
    """   size = subprocess.check_output('perl ~/eBoxSize-1.1.pl ligand.pdbqt',shell=True,text=True)
    out = open('receptor_vina_box.txt','a')
    out.write(
    'size_x = '+str(size)+'\n'
    'size_y = '+str(size)+'\n'
    'size_z = '+str(size))
    out.close() """


    if method == 'ad4':
        os.system('prepare_gpf.py -l ligand.pdbqt -r receptor.pdbqt -y')
        os.system('autogrid4 -p receptor.gpf -l ligand.glg')
        os.system(link+' --ligand ligand.pdbqt --maps receptor --scoring ad4 --exhaustiveness 64 --out docked_poses.pdbqt --seed 234234 > Afffinit_Values.txt')

    else:
        os.system(link+' --ligand ligand.pdbqt --receptor receptor.pdbqt --config receptor_vina_box.txt --exhaustiveness 64 --out docked_poses.pdbqt --seed 234234 > Afffinit_Values.txt')
    os.system('more Afffinit_Values.txt') 



dic_pdb_lig ={
'001':'2VCJ',
'003':'2VCI',
'004':'5NYI',
'005':'5J2X',
'006':'6F1N',
'007':'6ELO',
'008':'5J64',
'010':'6ELN',
'011':'5J20',
'012':'5J86',
'013':'5J9X',
'014':'6ELP',
'015':'5J27',
'016':'5J86',
'017':'5LRZ',
'018':'5LR7',
'019':'2YKI',
'020':'5LQ9',
'021':'5LS1',
'022':'5T21',
'035':'6EYA',
'036':'5LO6',
'037':'5LNZ',
'038':'6EY8',
'039':'6EFU',
'040':'6EY9',
'041':'6EYB',
'043':'5OCI',
'050':'5ODX',
'051':'5NYH',
'057':'LNY',
'060':'5OD7',
'061':'6EI5',
'067':'5LR1',
'068':'6EL5',
'069':'5LO5',
'102':'6FCJ',
'103':'5LO1',
'104':'1OSF',
'105':'3TUH',
'106':'2YKC',
'107':'5LRL',
'108':'2YKJ',
'109':'6HHR'
}


files_ligand =[]

os.chdir('./INP/ligand')
path = os.getcwd()
for (root,dirs,files) in os.walk(path):
    for file in files:
        files_ligand.append(os.path.join(root, file))	
os.chdir('../..')
### ------------------ ###
os.chdir('./OUT')
for files in files_ligand:
    name_lig = os.path.basename(files)
    if os.path.isdir(name_lig) == True:
        continue
    else:
        lig_dic =name_lig.split(".")[0].strip()
        if lig_dic in dic_pdb_lig:

            os.system('mkdir '+name_lig)
            os.system('cp  ../INP/ligand/'+name_lig+' ./'+name_lig)
            os.system('cp ../INP/crys-str/'+str(dic_pdb_lig[str(lig_dic)])+'.pdb ./'+name_lig)
            os.system('cp ../INP/receptor_vina_box.txt ./'+name_lig)

            os.chdir('./'+name_lig) 


            func(name_lig) 
            ### ------------------  ####
            os.chdir('..')	
        else:
            continue