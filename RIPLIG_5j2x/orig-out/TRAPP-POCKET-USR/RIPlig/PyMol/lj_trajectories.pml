load ../ref.dx, r
isosurface refpock, r, 0.6
color green, refpock 
group trj_1, open
load ../LEU0/trj_1.pdb, trj_1.trj 
load  ../LEU0/LJ-OUT/lj-pocket_trj_1.pdb, trj_1.pocket, discrete=1 
alter trj_1.pocket, vdW=1.5 
rebuild trj_1.pocket 
show surface, trj_1.pocket 
show cartoon, trj_1.trj 
hide lines, trj_1.trj 
color gray, trj_1.trj 
load ../LEU0/LJ-OUT/transT_1.dx, trj_1.tr 
isomesh trj_1.appearing-50, trj_1.tr , 0.5
color firebrick, trj_1.appearing-50 
isomesh trj_1.appearing-25, trj_1.tr , 0.25
color red, trj_1.appearing-25 
isomesh trj_1.disapp.-50, trj_1.tr , -0.5
color deepblue, trj_1.disapp.-50 
isomesh trj_1.disapp.-25, trj_1.tr , -0.25
color blue, trj_1.disapp.-25 
load ../LEU0/LJ-OUT/averT_1.dx, trj_1.av 
isomesh trj_1.average, trj_1.av , 0.95
color black, trj_1.average 
group trj_1, close
disable * 
group trj_2, open
load ../LEU1/trj_2.pdb, trj_2.trj 
load  ../LEU1/LJ-OUT/lj-pocket_trj_2.pdb, trj_2.pocket, discrete=1 
alter trj_2.pocket, vdW=1.5 
rebuild trj_2.pocket 
show surface, trj_2.pocket 
show cartoon, trj_2.trj 
hide lines, trj_2.trj 
color gray, trj_2.trj 
load ../LEU1/LJ-OUT/transT_2.dx, trj_2.tr 
isomesh trj_2.appearing-50, trj_2.tr , 0.5
color firebrick, trj_2.appearing-50 
isomesh trj_2.appearing-25, trj_2.tr , 0.25
color red, trj_2.appearing-25 
isomesh trj_2.disapp.-50, trj_2.tr , -0.5
color deepblue, trj_2.disapp.-50 
isomesh trj_2.disapp.-25, trj_2.tr , -0.25
color blue, trj_2.disapp.-25 
load ../LEU1/LJ-OUT/averT_2.dx, trj_2.av 
isomesh trj_2.average, trj_2.av , 0.95
color black, trj_2.average 
group trj_2, close
disable * 
group trj_3, open
load ../LEU2/trj_3.pdb, trj_3.trj 
load  ../LEU2/LJ-OUT/lj-pocket_trj_3.pdb, trj_3.pocket, discrete=1 
alter trj_3.pocket, vdW=1.5 
rebuild trj_3.pocket 
show surface, trj_3.pocket 
show cartoon, trj_3.trj 
hide lines, trj_3.trj 
color gray, trj_3.trj 
load ../LEU2/LJ-OUT/transT_3.dx, trj_3.tr 
isomesh trj_3.appearing-50, trj_3.tr , 0.5
color firebrick, trj_3.appearing-50 
isomesh trj_3.appearing-25, trj_3.tr , 0.25
color red, trj_3.appearing-25 
isomesh trj_3.disapp.-50, trj_3.tr , -0.5
color deepblue, trj_3.disapp.-50 
isomesh trj_3.disapp.-25, trj_3.tr , -0.25
color blue, trj_3.disapp.-25 
load ../LEU2/LJ-OUT/averT_3.dx, trj_3.av 
isomesh trj_3.average, trj_3.av , 0.95
color black, trj_3.average 
group trj_3, close
disable * 
group trj_4, open
load ../LEU3/trj_4.pdb, trj_4.trj 
load  ../LEU3/LJ-OUT/lj-pocket_trj_4.pdb, trj_4.pocket, discrete=1 
alter trj_4.pocket, vdW=1.5 
rebuild trj_4.pocket 
show surface, trj_4.pocket 
show cartoon, trj_4.trj 
hide lines, trj_4.trj 
color gray, trj_4.trj 
load ../LEU3/LJ-OUT/transT_4.dx, trj_4.tr 
isomesh trj_4.appearing-50, trj_4.tr , 0.5
color firebrick, trj_4.appearing-50 
isomesh trj_4.appearing-25, trj_4.tr , 0.25
color red, trj_4.appearing-25 
isomesh trj_4.disapp.-50, trj_4.tr , -0.5
color deepblue, trj_4.disapp.-50 
isomesh trj_4.disapp.-25, trj_4.tr , -0.25
color blue, trj_4.disapp.-25 
load ../LEU3/LJ-OUT/averT_4.dx, trj_4.av 
isomesh trj_4.average, trj_4.av , 0.95
color black, trj_4.average 
group trj_4, close
disable * 
load ../conserved.dx, c
set mesh_width=3 
isomesh average-95, c , 0.95
color gray, average-95 
load ../transient.dx, t
isomesh appearing-50, t , 0.5
color  firebrick , appearing-50 
isomesh disapp.-50, t , -0.5
color  deepblue, disapp.-50 
isomesh appearing-25, t , 0.25
color  red , appearing-25 
isomesh disapp.-25, t , -0.25
color  blue , disapp.-25 
bg_color white
color blue, name o 
color red, name n 
color grey, name ca 
color orange, name s 
color yellow, name c 
load ../ref.pdb, refstruct 
color black, refstruct 
show cartoon, refstruct
hide lines, refstruct 
sele resi 48+51+52+54+55+58+93+96+97+98+103+106+107+108+109+138+150+184+186+
 show lines, sele 
set transparency=0.5
save /scratch/mcm/trapp/jobs/pocket_1f2cd40d-8da8-4e03-b579-e495771b7375/TRAPP-POCKET/RIPlig//PyMol/lj_trajectories.pse
show lines, sele 
deselect 
load  ../ligand_position.pdb, ligand 
show sticks, ligand 
show spheres, ligand
alter ligand, vdw=0.5
rebuild
