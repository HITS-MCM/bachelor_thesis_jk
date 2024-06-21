#!/bin/env python
import os
import pandas as pd
import numpy as np
import json
from Bio import AlignIO 
from Bio import SeqUtils
from pymol import cmd
from Bio import PDB
from Bio.PDB import *
import Bio.SeqUtils 
import sys
import statistics
#### PocketSURF that computes the conservation score of residues and displays them ####

# program starts outside of the INP and OUT folders and goes directly in the general INP-folder
os.chdir('./INP')
#reading INP file for PocketSURF
# rec and lig has to be adressed without .pdb and have to be separated by:
file = open("input_conservation.txt").readlines()
for line in file:
    if "PATH" in line:
        path_to_scripts = line.split(":")[-1].strip()    
    if "rec_name" in line:
        rec_name = line.split(":")[-1].strip()
    if "database" in line:
        database = line.split(":")[-1].strip()
    if "exp:" in line:
        exp = line.split(":")[-1].strip()
    if "word_size" in line:
        word_size = line.split(":")[-1].strip()
    if "search_method" in line:
        search_method = line.split(":")[-1].strip()
    if "lig_name" in line:
        lig_name = line.split(":")[-1].strip()
    if "matrix" in line:
        matrix = line.split(":")[-1].strip()
    if "droppoff" in line:
        droppoff = line.split(":")[-1].strip()
    if "gapopen" in line:
        gapopen = line.split(":")[-1].strip()
    if "gapext" in line:
        gapext = line.split(":")[-1].strip()  
    if "seqrange" in line:
        seqrange = line.split(":")[-1].strip()  
    if "gapalign" in line:
        gapalign = line.split(":")[-1].strip()  
    if "alignments" in line:
        alignments = line.split(":")[-1].strip() 
    if "scores" in line:
        scores = line.split(":")[-1].strip()    
    if "email" in line:
        email = line.split(":")[-1].strip()

    if "expthr" in line:
        expthr = line.split(":")[-1].strip()
    if "psithr" in line:
        psithr = line.split(":")[-1].strip()                
    if "finaldropoff" in line:
        finaldropoff = line.split(":")[-1].strip()
    """ 
    if "guidetreeout" in line:
        guidetreeout = line.split(":")[-1].strip()
    if "dismatout" in line:
        dismatout = line.split(":")[-1].strip()   
    if "mbediteration" in line:
        mbediteration = line.split(":")[-1].strip()   
    if "gtiterations" in line:
        gtiterations = line.split(":")[-1].strip()
    if "hmmiterations" in line:
        hmmiterations = line.split(":")[-1].strip() """


os.system('mkdir ../OUT/conservation')
os.system('cp ./'+rec_name+' ../OUT/conservation/')
os.system('cp ./'+lig_name+' ../OUT/conservation/')
os.system('cp ./input_conservation.txt ../OUT/conservation/')
os.chdir('../OUT/conservation/')





### --------------------------------------- ###

### running blast search ###
os.system('pdb_tofasta '+str(rec_name)+'> fasta.txt') #converting it to fast

# just checking if it was prev. run and if yes skip it to speed up the process
file_list=[]
path = os.getcwd()
for (root,dirs,files) in os.walk(path):
    for file in files:
        file_list.append(os.path.join(root, file))	
checking_files = list(filter(lambda a: 'blast' in a, file_list))
if len(checking_files)==0:
    #running the specific blast search depending on which method was defined in the input file
    if search_method == 'ncbiblast':
        os.system('python3 '+str(path_to_scripts)+'/ncbiblast.py --email '+str(email)+' --program blastp --stype protein --sequence ./fasta.txt --alignments '+str(alignments)+' --scores '+str(scores)+' --database '+database+' --exp '+exp+' --wordsize '+word_size+' --matrix '+str(matrix)+' --dropoff '+str(droppoff)+' --gapext '+str(gapext)+' --seqrange '+str(seqrange)+' --gapalign '+str(gapalign))

    elif search_method == 'psiblast':
        os.system('python3 '+str(path_to_scripts)+'/psiblast.py --email '+str(email)+' --sequence ./fasta.txt --database '+database+' --matrix '+str(matrix)+' --gapopen '+str(gapopen)+' --gapext '+str(gapext)+'  --expthr '+str(expthr)+' --psithr '+str(psithr)+' --scores '+str(scores)+' --alignments '+str(alignments)+' --dropoff '+str(droppoff)+' --finaldropoff '+str(finaldropoff)+' --seqrange '+str(seqrange)) 

    else:
        print('check your input')
        sys.exit()    
### --------------------------------------- ###     


### Processing of blast search ###
#searching for the generated .json file of blast search that contains the identifiers
file_list=[]
path = os.getcwd()
for (root,dirs,files) in os.walk(path):
    for file in files:
        file_list.append(os.path.join(root, file))	
json_file = list(filter(lambda a: '.json.json' in a, file_list))
with open(json_file[0], "r") as file:
    data = json.load(file)
#getting the data out of the .json file, storing the sequences in separated files, 50 sequences per sequence-file as more sequeneces per query will not work for all cases
hits_list_split=[]
hits_list =[]
base_url=data["hits"][0]['hit_dbfetch_url']
remove_id = data["hits"][0]['hit_acc']
hits_list_split.append(base_url)
base_url = base_url.replace(remove_id,'')
num_splits = int(len(data["hits"])/50)
if num_splits>1:
    for i in range(num_splits+1):
        hits_list_split.append(base_url)
else:
    hits_list_split.append(base_url)
k=0
l=0
for i in range(1,len(data["hits"]),1):
    if str(data["hits"][i]['hit_acc']) not in hits_list:
        hits_list_split[k] = hits_list_split[k] + str(',')
        hits_list_split[k] = hits_list_split[k] +str(data["hits"][i]['hit_acc'])
        hits_list.append(str(data["hits"][i]['hit_acc']))
        l+=1
        if l >50:
            k+=1
            l=0
    else:
        continue
link_final_list=[]
for i in range(len(hits_list_split)):
    print(hits_list_split[i])
    link_final_list.append(hits_list_split[i]+'&format=fasta')
z=0
for i in range(len(link_final_list)):
    if 'id=&format=fasta' in link_final_list[i]:
        z +=1
        continue
    os.system('wget -O sequences'+str(i)+'.txt "'+str(link_final_list[i])+'"')
for i in range(len(link_final_list)-1-z):
    file_seq =open('sequences0.txt','a')
    with open('sequences'+str(i+1)+'.txt', 'r') as file:
        for line in file:
            file_seq.write(line)
file_seq = open('sequences0.txt','a')
with open('./fasta.txt', 'r') as file:
    for line in file:
        file_seq.write(line)
file_seq.close()

### CLUSTALO RUN ###
# just checking if it was prev. run and if yes skip it to speed up the process
file_list=[]
path = os.getcwd()
for (root,dirs,files) in os.walk(path):
    for file in files:
        file_list.append(os.path.join(root, file))	
checking_files = list(filter(lambda a: 'clustalo' in a, file_list))
if len(checking_files) == 0:
    os.system('python3 '+str(path_to_scripts)+'/clustalo.py --email '+str(email)+' --stype protein --sequence sequences0.txt --order input --guidetreeout') #'+str(guidetreeout)+' --dismatout '+str(dismatout)+' --mbediteration '+str(mbediteration)+' --gtiterations '+str(gtiterations)+' --hmmiterations '+str(hmmiterations)

else:
    print('clustalo already previously done')
### --------------------------------------- ###  


### Conservation RUN ###
#getting the Clustal MSA in FASTA-format
file_list=[]
path = os.getcwd()
for (root,dirs,files) in os.walk(path):
    for file in files:
        file_list.append(os.path.join(root, file))	
clustal_file = list(filter(lambda a: '.fa.sqr.fa' in a, file_list))
seq_file = open('fasta.txt','r')
orig_seq_name= seq_file.readline()
orig_seq_name = orig_seq_name.strip()
orig_seq_name =orig_seq_name[1:]
check_r4s =os.listdir()
if 'r4s.res' not in check_r4s:
    os.system(str(path_to_scripts)+"/rate4site -s "+clustal_file[0]+" -a '"+str(orig_seq_name)+"'")
#getting the conservation score and storing it for further processing 
fasta_file = open('r4s.res','r')
rate4site = open('rate4site.txt','w')
i =0
for line in fasta_file:
    if line.startswith('#'):
        continue
    if not line.strip():
        continue
    else:
        if i == 0:
          rate4site.write(line)
          rate4site.write(line)
          i=1
        else:  
            rate4site.write(line)
rate4site.close()
data =pd.read_table('rate4site.txt', header=0, sep='\s+').fillna(0).values
val_residues = data[:,2]

### --------------------------------------- ### 




###===============JMOL===============###
#### PART THAT CHANGES THE B VALUES FOR ALL THE FILES  ###
#finding JMOL directory
os.chdir('..')
file_list=[]
path = os.getcwd()
for (root,dirs,files) in os.walk(path):
    for file in files:
        file_list.append(os.path.join(root))	
Jmol_folder = list(filter(lambda a: '/Jmol/models/' in a, file_list))
os.chdir(Jmol_folder[0])

#finding the max value of the conservation score
max_val =0
for x in range(len(val_residues)-1):
    if val_residues[x] >max_val:
        max_val = val_residues[x]
# finding lowest value of the conservation score
min_val =max_val
for x in range(len(val_residues)-1):
    if val_residues[x] < min_val:
        min_val = val_residues[x] 
#function that changes the b_values of the pdb files
def change_b_vale(min_val,max_val):
    pdb_list_pre=[]
    pdb_list_clean=[]
    path_hold = os.getcwd()
    pdb_list_pre= os.listdir(path_hold)


    for p in pdb_list_pre:
        if 'pdb' in p:
            if 'lig' in p:
                continue
            if 'snap' not in p:
                continue
            pdb_list_clean.append(p)
    for k in pdb_list_clean:

        parser = PDBParser()
        structure = parser.get_structure(str(k),str(k))

        i =0
        for model in structure:
            for chain in model: 
                for residue in chain:
                   # hold = 0
                    hold = 0-val_residues[i]
                    for atom in residue:
                        atom.set_bfactor(hold)          

                    i+=1
        io=PDB.PDBIO()
        io.set_structure(structure)
        io.save(k)
def change_b_value_lj(min_val,max_val):
    pdb_list_pre=[]
    pdb_list_clean=[]
    path_hold = os.getcwd()
    pdb_list_pre= os.listdir(path_hold)
    for p in pdb_list_pre:
        if 'trj' and 'pdb' in p and 'ref' not in p and 'pocket' not in p:
            pdb_list_clean.append(p)
    for k in pdb_list_clean:
        parser = PDBParser()
        structure = parser.get_structure(str(k),str(k))

        i =0
        for model in structure:
            i =0
            for chain in model: 
                for residue in chain:
                    hold = 0
                    hold = 0-val_residues[i]
                    for atom in residue:
                        atom.set_bfactor(hold)          

                    i+=1
        io=PDB.PDBIO()
        io.set_structure(structure)
        io.save(k)

#changing the files used by the JMOl generation
new_path =os.listdir()
for folder in new_path:
    if folder == 'trj_shorten':
        os.chdir(folder)
        change_b_vale(min_val,max_val) 
        os.chdir('..')
    elif folder == 'ALL_TRJ':
        os.chdir(folder)
        change_b_vale(min_val,max_val) 
        os.chdir('..')
    elif folder == 'LEU':
        os.chdir(folder)
        change_b_vale(min_val,max_val) 
        os.chdir('..')
       
os.chdir(path)
#saves the changes


###===============Pymol-Script and Pymol-PDB===============###
#finding the PyMol folder in the TRAPP directory
file_list=[]
path = os.getcwd()
for (root,dirs,files) in os.walk(path):
    for file in files:
        file_list.append(os.path.join(root))	
Pymol_folder = list(filter(lambda a: '/PyMol' in a, file_list))
os.chdir(Pymol_folder[0])
path_hold = os.getcwd()
Pymol_PDB= os.listdir(path_hold)
#appending the pml files with the commands so that the score is displayed
for file in Pymol_PDB:
    # changing the pymol files and session for each trajectorie
    if 'trj' in file:
        Pymol_file = open(file,'a')
        Pymol_file.write("set label_digits, 2 \n")
        average =statistics.mean(val_residues)
        Pymol_file.write("label n. CA and b< "+str(average)+", b \n")   
        Pymol_file.write("spectrum b, rainbow")
        Pymol_file.close()
        k=0
        # PART OF CHANGING PYMOL PDB
        Pymol_file = open(file,'r')
        for line in Pymol_file:
            if k ==1:
                break
            if 'load' and 'pdb' in line:
                hold =[]
                hold = line.split('snap.')
                link = hold[0].split(' ')
                return_path = os.getcwd()
                os.chdir(link[-1])
                change_b_vale(min_val,max_val) 
                os.chdir(return_path)
                k=1
    # changing the pymol files and session for each the overview            
    if 'lj_trajectories.pml' in file:
        Pymol__lj_file = open(file,'a')
        Pymol__lj_file.write("set label_digits, 2 \n")
        average =statistics.mean(val_residues)
        Pymol__lj_file.write("label n. CA and b< "+str(average)+", b \n")   
        Pymol__lj_file.write("spectrum b, rainbow")
        Pymol__lj_file.close()
       
        #part of changing pymol pdb
        return_path = os.getcwd()
        os.chdir('../trj_shorten/')
        change_b_value_lj(min_val,max_val) 
        os.chdir(return_path)

#changing the ref.pdb as it was seen it can be also loaded by this specification
os.chdir('..')
parser = PDBParser()
structure = parser.get_structure('ref','ref.pdb')

i =0
for model in structure:
    for chain in model: 
        for residue in chain:

            hold = 0-val_residues[i]
            for atom in residue:
                atom.set_bfactor(hold)  
            i+=1        
io=PDB.PDBIO()
io.set_structure(structure)
io.save('ref.pdb')

    


