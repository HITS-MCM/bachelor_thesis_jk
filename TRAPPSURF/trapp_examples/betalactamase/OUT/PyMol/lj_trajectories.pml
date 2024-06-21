load ../ref.dx, r
isosurface refpock, r, 0.6
color green, refpock 
group trj_1, open
load ../trj_shorten/trj_1-selected.pdb, trj_1.trj 
load  ../trj_shorten/LJ-OUT/lj-pocket_trj_1.pdb, trj_1.pocket, discrete=1 
alter trj_1.pocket, vdW=1.5 
rebuild trj_1.pocket 
show surface, trj_1.pocket 
show cartoon, trj_1.trj 
hide lines, trj_1.trj 
color gray, trj_1.trj 
load ../trj_shorten/LJ-OUT/transT_1.dx, trj_1.tr 
isomesh trj_1.appearing-50, trj_1.tr , 0.5
color firebrick, trj_1.appearing-50 
isomesh trj_1.appearing-25, trj_1.tr , 0.25
color red, trj_1.appearing-25 
isomesh trj_1.disapp.-50, trj_1.tr , -0.5
color deepblue, trj_1.disapp.-50 
isomesh trj_1.disapp.-25, trj_1.tr , -0.25
color blue, trj_1.disapp.-25 
load ../trj_shorten/LJ-OUT/averT_1.dx, trj_1.av 
isomesh trj_1.average, trj_1.av , 0.95
color black, trj_1.average 
group trj_1, close
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
sele resi 46+219+220+221+222+223+224+225+226+231+233+246+247+248+250+261+262+263+277+278+279+280+281+282+283+284+285+286+287+288+290+
 show lines, sele 
set transparency=0.5
save /home/kunzjn/trapptool/examples/Paper-2020/OUT//PyMol/lj_trajectories.pse
show lines, sele 
deselect 
load  ../ligand_1pzp_ligand.pdb, ligand 
show sticks, ligand 
show spheres, ligand
alter ligand, vdw=0.5
rebuild
set label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbowset label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbowset label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbowset label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbowset label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbowset label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbowset label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbowset label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbowset label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbowset label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbowset label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbowset label_digits, 2 
label n. CA and b< 3.166035241326492e-19, b 
spectrum b, rainbow