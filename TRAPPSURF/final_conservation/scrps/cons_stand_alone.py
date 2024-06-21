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





### creating folder, making input, setup ###


new_check = os.getcwd()

if 'conservation' not in new_check:

    os.system('mkdir conservation')
    os.system('cp ./input_conservation.txt conservation/')
    os.system('cp ./*.pdb conservation/')
    
    
    os.chdir('./conservation')

print(os.getcwd())

file= open('input_conservation.txt','r')
for line in file:
    if "PATH" in line:
        path_scrips = line.split(":")[-1].strip()    
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

    """   if "guidetreeout" in line:
        guidetreeout = line.split(":")[-1].strip()
    if "dismatout" in line:
        dismatout = line.split(":")[-1].strip()   
    if "mbediteration" in line:
        mbediteration = line.split(":")[-1].strip()
    if "gtiterations" in line:
        gtiterations = line.split(":")[-1].strip()
    if "hmmiterations" in line:
        hmmiterations = line.split(":")[-1].strip() """



file.close()  
### --------------------------------------- ###

### running blast search ###
os.system('pdb_tofasta '+str(rec_name)+' > fasta.txt') #converting it to fast

# just checking if it was prev. run and then skip
file_list=[]
path = os.getcwd()
for (root,dirs,files) in os.walk(path):
    for file in files:
        file_list.append(os.path.join(root, file))	
checking_files = list(filter(lambda a: 'blast' in a, file_list))
if len(checking_files)==0:
    #actual run
    print("hello")
    if search_method == 'ncbiblast':
        os.system('python3 '+str(path_scrips)+'/ncbiblast.py --email '+str(email)+' --program blastp --stype protein --sequence ./fasta.txt --alignments '+str(alignments)+' --scores '+str(scores)+' --database '+database+' --exp '+exp+' --wordsize '+word_size+' --matrix '+str(matrix)+' --dropoff '+str(droppoff)+' --gapext '+str(gapext)+' --seqrange '+str(seqrange)+' --gapalign '+str(gapalign))
        
    elif search_method == 'psiblast':
        os.system('python3 '+str(path_scrips)+'/psiblast.py --email '+str(email)+' --sequence ./fasta.txt --database '+database+' --matrix '+str(matrix)+' --gapopen '+str(gapopen)+' --gapext '+str(gapext)+'  --expthr '+str(expthr)+' --psithr '+str(psithr)+' --scores '+str(scores)+' --alignments '+str(alignments)+' --dropoff '+str(droppoff)+' --finaldropoff '+str(finaldropoff)+' --seqrange '+str(seqrange)) 
    else:
        print('check your input')
        os.system('google-chrome https://http.cat/102')
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
# just checking if it was prev. run and then skip if yes
file_list=[]
path = os.getcwd()
for (root,dirs,files) in os.walk(path):
    for file in files:
        file_list.append(os.path.join(root, file))	
checking_files = list(filter(lambda a: 'clustalo' in a, file_list))
if len(checking_files) == 0:
    os.system('python3 '+str(path_scrips)+'/clustalo.py --email '+str(email)+' --stype protein --sequence sequences0.txt --order input --guidetreeout')#'+str(guidetreeout)+' --dismatout '+str(dismatout)+' --mbediteration '+str(mbediteration)+' --gtiterations '+str(gtiterations)+' --hmmiterations '+str(hmmiterations)

else:
    print('clustalo already previously done')
### --------------------------------------- ###  


### Conservation Score ###
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
    os.system(str(path_scrips)+"/rate4site -s "+clustal_file[0]+" -a '"+str(orig_seq_name)+"'")
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



parser = PDBParser()
structure = parser.get_structure(str(rec_name),str(rec_name))
residue_names=[]
ppb=PPBuilder()
for pp in ppb.build_peptides(structure):
    residue_names=pp.get_sequence()

""" max_val =0
for x in range(len(val_residues)-1):
    if val_residues[x] >max_val:
        max_val = val_residues[x]
# finding lowest value
min_val =max_val
for x in range(len(val_residues)-1):
    if val_residues[x] < min_val:
        min_val = val_residues[x]   """



i =0
for model in structure:
    for chain in model: 
        for residue in chain:
            hold = 0
            hold = val_residues[i]
            hold = 0-hold
            for atom in residue:
                atom.set_bfactor(hold)          

            i+=1
   

io=PDB.PDBIO()
io.set_structure(structure)
io.save('changed_str.pdb')

# loading all the structure and presenting them as sticks
cmd.load('changed_str.pdb', 'changed_str')
#cmd.load(str(lig_name), 'position')
cmd.hide('all')
cmd.show('cartoon')

# script that loads the interactions of the ligand and protein
# not finished
""" cmd.select('don', 'elem n,o and (neighbor hydro)')
cmd.select('acc', 'elem o or (elem n and not (neighbor hydro))')
cmd.dist('HBA', 'position and acc', 'changed_str and don', '3.2', '0')
cmd.dist('HBD', 'position and don', 'changed_str and acc', '3.2', '0')
cmd.delete('don')
cmd.delete('acc') """
#cmd.hide('hydro')
#cmd.hide('labels', 'HBA')
#cmd.hide('labels', 'HBD')

#labelign this stuff 
cmd.set('label_digits', '2')

average = statistics.mean(val_residues)
cmd.label('changed_str and n. CA and b<'+str(average), 'b')


# script that colors them after their b values
#cmd.distance('contatcs', 'changed_str', 'position', '5', '2')
cmd.spectrum('b', 'rainbow2', 'changed_str')
cmd.save('colored_str.pse', 'changed_str contatcs')  
### --------------------------------------- ### 


#interaction_diagram.func(lig_name,rec_name)


### --------------------------------------- ###  
