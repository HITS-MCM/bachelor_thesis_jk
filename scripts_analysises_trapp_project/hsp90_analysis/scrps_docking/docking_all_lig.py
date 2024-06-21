#!/bin/env python
import os
import subprocess
import pandas as pd
import numpy as np
from Bio.PDB import *
import time
### METHOD BEGINNING ###

def func(num,name):
    #retrieving the necesary files for the docking runs 
    
    file_list=[]
    os.chdir('./INP')
    data =pd.read_table('pocket_size_summ.dat', header=1, sep='\s+').fillna(0).values 
    os.chdir('..')        
    os.system('mkdir '+str(num))
    #copys all the neccasry files from the INP folder
    os.system('cp -r ./INP/. ./'+str(num))
    os.chdir('./'+str(num))
    ######################
    file_list=[]
    return_path = os.getcwd()
    os.chdir('../../..')
    path = os.getcwd()
    os.chdir(return_path)
    for (root,dirs,files) in os.walk(path):
        for file in files:
            file_list.append(os.path.join(root, file))
    ######################
    #retrieves the pdb files of the snapshots; needs to differentiate how to find them by the type of the retrieved name

    if data[2][0] == '#':
        if isinstance(num, float) == True:
            snap = int(num)     
        else:
            snap = num
        input_snp_pdb = list(filter(lambda a: '/'+str(snap)+'/snap.1.pdb' in a, file_list))
    else:
        snap = num
        input_snp_pdb = list(filter(lambda a: 'snap.'+str(snap)+'.pdb' in a, file_list))
    if not input_snp_pdb:
        
        input_snp_pdb = list(filter(lambda a: '/'+str(snap)+'/trj_' in a, file_list))
    os.system('cp '+ str(input_snp_pdb[0])+' ./')
    snapshot = os.path.basename(str(input_snp_pdb[0]))

    ### makes grid space###
    #script for optimal box size and center of mass instead of using the mean of the coordinates
    print(name)
    os.system('prepare_ligand -l '+str(name)+' -o ligand.pdbqt')
    size = subprocess.check_output('perl ./eBoxSize-1.1.pl ligand.pdbqt',shell=True,text=True)
    #center_mass = center_mass_pocketvina.func()
    subprocess.run('conda run -n vina_py python3 ./center_mass.py', shell=True)

    ### COMMANDS FOR GRID GENERATION CENTER###

    path=os.getcwd()
    os.chdir('../../../'+str(snap)+'/LJ-OUT/')

    x_center_mean=[]
    y_center_mean=[]
    z_center_mean=[]
    x_center=[]
    y_center=[]
    z_center=[]
    new_path = os.getcwd()
    new_file_list =[]
    for (root,dirs,files) in os.walk(new_path):
        for file in files:
            new_file_list.append(os.path.join(root, file))
    lj_file_list = list(filter(lambda a: 'lj-pocket_trj' in a, file_list))
    lj_file = open(lj_file_list[0],'r')
    i=0
    for line in lj_file:
        if 'ATOM' in line:
                a =line
                a = "/".join(a.split()) 
                x=a.split("/")[5].strip()
                x_center.append(float(x))
                y=a.split("/")[6].strip()
                y_center.append(float(y))
                z=a.split("/")[7].strip()
                z_center.append(float(z))
                print(x)
        elif 'ENDMDL' in line:          
                print('hello')
                x_center_mean.append(np.mean(x_center))
                y_center_mean.append(np.mean(y_center))
                z_center_mean.append(np.mean(z_center))
                x_center=[]
                y_center=[]
                z_center=[]
                break

    os.chdir(path)

    x_center_mean.append(3.076505742502185)
    y_center_mean.append(14.037169827256921)
    z_center_mean.append(18.08276642835584)
    lj_file.close()
    print(x_center_mean)
    hold=0
    #creates file receptor_vina_box.txt 
    out = open('receptor_vina_box.txt','w')
    out.write(
    'center_x = '+str(x_center_mean[hold])+'\n'
    'center_y = '+str(y_center_mean[hold])+'\n'
    'center_z = '+str(z_center_mean[hold])+'\n'
    'size_x = '+str(size)+'\n'
    'size_y = '+str(size)+'\n'
    'size_z = '+str(size))
    out.close()

    ### AUTODOCK COMMANDS ###
    method = 'vina'
    
    #Autodock should be found by this link. If you have defined autodock by a different path change it here and there will be no further issues
    link ='/usr/bin/vina' 
    os.system('prepare_receptor -r '+snapshot+' -A "hydrogens" -o receptor.pdbqt')
    

    if method == 'ad4':
        os.system('prepare_gpf.py -l ligand.pdbqt -r receptor.pdbqt -y')
        os.system('autogrid4 -p receptor.gpf -l ligand.glg')
        os.system(link+' --ligand ligand.pdbqt --maps receptor --scoring ad4 --exhaustiveness 64 --out docked_poses.pdbqt --seed 234234 > Afffinit_Values.txt')

    else:
        os.system(link+' --ligand ligand.pdbqt --receptor receptor.pdbqt --config receptor_vina_box.txt --exhaustiveness 64 --out docked_poses.pdbqt --seed 234234 > Afffinit_Values.txt')
    os.system('more Afffinit_Values.txt') 
    os.chdir('..')
    



# Creating list of all ligands
files_ligand =[]

os.chdir('./INP/ligand')
path = os.getcwd()
for (root,dirs,files) in os.walk(path):
    for file in files:
        files_ligand.append(os.path.join(root, file))	
os.chdir('../..')
### ------------------ ###
os.chdir('./OUT')
os.system('mkdir AutoDock')
os.chdir('./AutoDock')
for files in files_ligand:
    name_lig = os.path.basename(files)
    if os.path.isdir(name_lig) == True:
        continue
    else:
        os.system('mkdir '+name_lig)
        os.system('mkdir '+name_lig+'/INP')
        os.system('cp  ../../INP/ligand/'+name_lig+' ./'+name_lig+'/INP')
        os.system('cp ../../INP/position.pdb ./'+name_lig+'/INP')
        os.system('cp ../../INP/5lr1.pdb ./'+name_lig+'/INP')
        os.system('cp ../../INP/receptor_vina_box.txt ./'+name_lig+'/INP')
        os.system('cp ../../INP/pocket_size_summ.dat ./'+name_lig+'/INP')
        os.system('cp ../../INP/input_autodock.dat ./'+name_lig+'/INP')
        os.chdir('./'+name_lig) 
        data =pd.read_table('./INP/pocket_size_summ.dat', header=1, sep='\s+').fillna(0).values

        count = 0
        #creating list that actually contain data and are not filled up with zeros 
        for i in range(len(data)): 
            if data[i][2] > 0:
                count =count+1 
        #differntiating between the different snapshots names; calls autodock_run and pares on the name of the snapshot        
        if data[2][0] == '#': 
            for i in range(0,count*2,2):
                calc =data[i][1]
                func(calc,name_lig)
        else:
            for i in range(1,count+1):
                calc =data[i][0]
                func(calc,name_lig) 
        ### ------------------  ####
        os.chdir('..')	




   
