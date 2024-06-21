load ../ref.dx, r
isosurface refpock, r, 0.6
color green, refpock 
group trj_1, open
load ../1_trj_equil_supLEU0-bb_31/trj_1.pdb, trj_1.trj 
load  ../1_trj_equil_supLEU0-bb_31/LJ-OUT/lj-pocket_trj_1.pdb, trj_1.pocket, discrete=1 
alter trj_1.pocket, vdW=1.5 
rebuild trj_1.pocket 
show surface, trj_1.pocket 
show cartoon, trj_1.trj 
hide lines, trj_1.trj 
color gray, trj_1.trj 
load ../1_trj_equil_supLEU0-bb_31/LJ-OUT/transT_1.dx, trj_1.tr 
isomesh trj_1.appearing-50, trj_1.tr , 0.5
color firebrick, trj_1.appearing-50 
isomesh trj_1.appearing-25, trj_1.tr , 0.25
color red, trj_1.appearing-25 
isomesh trj_1.disapp.-50, trj_1.tr , -0.5
color deepblue, trj_1.disapp.-50 
isomesh trj_1.disapp.-25, trj_1.tr , -0.25
color blue, trj_1.disapp.-25 
load ../1_trj_equil_supLEU0-bb_31/LJ-OUT/averT_1.dx, trj_1.av 
isomesh trj_1.average, trj_1.av , 0.95
color black, trj_1.average 
group trj_1, close
disable * 
group trj_2, open
load ../2_trj_equil_supLEU1-bb_99/trj_2.pdb, trj_2.trj 
load  ../2_trj_equil_supLEU1-bb_99/LJ-OUT/lj-pocket_trj_2.pdb, trj_2.pocket, discrete=1 
alter trj_2.pocket, vdW=1.5 
rebuild trj_2.pocket 
show surface, trj_2.pocket 
show cartoon, trj_2.trj 
hide lines, trj_2.trj 
color gray, trj_2.trj 
load ../2_trj_equil_supLEU1-bb_99/LJ-OUT/transT_2.dx, trj_2.tr 
isomesh trj_2.appearing-50, trj_2.tr , 0.5
color firebrick, trj_2.appearing-50 
isomesh trj_2.appearing-25, trj_2.tr , 0.25
color red, trj_2.appearing-25 
isomesh trj_2.disapp.-50, trj_2.tr , -0.5
color deepblue, trj_2.disapp.-50 
isomesh trj_2.disapp.-25, trj_2.tr , -0.25
color blue, trj_2.disapp.-25 
load ../2_trj_equil_supLEU1-bb_99/LJ-OUT/averT_2.dx, trj_2.av 
isomesh trj_2.average, trj_2.av , 0.95
color black, trj_2.average 
group trj_2, close
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
save /scratch/mcm/trapp/jobs/pocket_1f2cd40d-8da8-4e03-b579-e495771b7375/TRAPP-POCKET/CLUSTER//PyMol/lj_trajectories.pse
show lines, sele 
deselect 
load  ../ligand_position.pdb, ligand 
show sticks, ligand 
show spheres, ligand
alter ligand, vdw=0.5
rebuild
load ../../../../OUT/AutoDock/108.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_108.pdb
load../../../../OUT/AutoDock/108.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_108.pdb
group trj_1, docked_1trj_108.pdb
group trj_2, docked_2trj_108.pdb
load ../../../../OUT/AutoDock/066.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_066.pdb
load../../../../OUT/AutoDock/066.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_066.pdb
group trj_1, docked_1trj_066.pdb
group trj_2, docked_2trj_066.pdb
load ../../../../OUT/AutoDock/097.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_097.pdb
load../../../../OUT/AutoDock/097.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_097.pdb
group trj_1, docked_1trj_097.pdb
group trj_2, docked_2trj_097.pdb
load ../../../../OUT/AutoDock/051.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_051.pdb
load../../../../OUT/AutoDock/051.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_051.pdb
group trj_1, docked_1trj_051.pdb
group trj_2, docked_2trj_051.pdb
load ../../../../OUT/AutoDock/121.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_121.pdb
load../../../../OUT/AutoDock/121.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_121.pdb
group trj_1, docked_1trj_121.pdb
group trj_2, docked_2trj_121.pdb
load ../../../../OUT/AutoDock/136.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_136.pdb
load../../../../OUT/AutoDock/136.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_136.pdb
group trj_1, docked_1trj_136.pdb
group trj_2, docked_2trj_136.pdb
load ../../../../OUT/AutoDock/008.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_008.pdb
load../../../../OUT/AutoDock/008.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_008.pdb
group trj_1, docked_1trj_008.pdb
group trj_2, docked_2trj_008.pdb
load ../../../../OUT/AutoDock/125.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_125.pdb
load../../../../OUT/AutoDock/125.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_125.pdb
group trj_1, docked_1trj_125.pdb
group trj_2, docked_2trj_125.pdb
load ../../../../OUT/AutoDock/053.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_053.pdb
load../../../../OUT/AutoDock/053.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_053.pdb
group trj_1, docked_1trj_053.pdb
group trj_2, docked_2trj_053.pdb
load ../../../../OUT/AutoDock/113.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_113.pdb
load../../../../OUT/AutoDock/113.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_113.pdb
group trj_1, docked_1trj_113.pdb
group trj_2, docked_2trj_113.pdb
load ../../../../OUT/AutoDock/064.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_064.pdb
load../../../../OUT/AutoDock/064.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_064.pdb
group trj_1, docked_1trj_064.pdb
group trj_2, docked_2trj_064.pdb
load ../../../../OUT/AutoDock/049.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_049.pdb
load../../../../OUT/AutoDock/049.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_049.pdb
group trj_1, docked_1trj_049.pdb
group trj_2, docked_2trj_049.pdb
load ../../../../OUT/AutoDock/127.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_127.pdb
load../../../../OUT/AutoDock/127.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_127.pdb
group trj_1, docked_1trj_127.pdb
group trj_2, docked_2trj_127.pdb
load ../../../../OUT/AutoDock/032.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_032.pdb
load../../../../OUT/AutoDock/032.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_032.pdb
group trj_1, docked_1trj_032.pdb
group trj_2, docked_2trj_032.pdb
load ../../../../OUT/AutoDock/090.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_090.pdb
load../../../../OUT/AutoDock/090.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_090.pdb
group trj_1, docked_1trj_090.pdb
group trj_2, docked_2trj_090.pdb
load ../../../../OUT/AutoDock/056.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_056.pdb
load../../../../OUT/AutoDock/056.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_056.pdb
group trj_1, docked_1trj_056.pdb
group trj_2, docked_2trj_056.pdb
load ../../../../OUT/AutoDock/055.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_055.pdb
load../../../../OUT/AutoDock/055.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_055.pdb
group trj_1, docked_1trj_055.pdb
group trj_2, docked_2trj_055.pdb
load ../../../../OUT/AutoDock/069.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_069.pdb
load../../../../OUT/AutoDock/069.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_069.pdb
group trj_1, docked_1trj_069.pdb
group trj_2, docked_2trj_069.pdb
load ../../../../OUT/AutoDock/009.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_009.pdb
load../../../../OUT/AutoDock/009.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_009.pdb
group trj_1, docked_1trj_009.pdb
group trj_2, docked_2trj_009.pdb
load ../../../../OUT/AutoDock/120.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_120.pdb
load../../../../OUT/AutoDock/120.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_120.pdb
group trj_1, docked_1trj_120.pdb
group trj_2, docked_2trj_120.pdb
load ../../../../OUT/AutoDock/074.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_074.pdb
load../../../../OUT/AutoDock/074.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_074.pdb
group trj_1, docked_1trj_074.pdb
group trj_2, docked_2trj_074.pdb
load ../../../../OUT/AutoDock/133.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_133.pdb
load../../../../OUT/AutoDock/133.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_133.pdb
group trj_1, docked_1trj_133.pdb
group trj_2, docked_2trj_133.pdb
load ../../../../OUT/AutoDock/072.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_072.pdb
load../../../../OUT/AutoDock/072.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_072.pdb
group trj_1, docked_1trj_072.pdb
group trj_2, docked_2trj_072.pdb
load ../../../../OUT/AutoDock/081.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_081.pdb
load../../../../OUT/AutoDock/081.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_081.pdb
group trj_1, docked_1trj_081.pdb
group trj_2, docked_2trj_081.pdb
load ../../../../OUT/AutoDock/117.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_117.pdb
load../../../../OUT/AutoDock/117.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_117.pdb
group trj_1, docked_1trj_117.pdb
group trj_2, docked_2trj_117.pdb
load ../../../../OUT/AutoDock/140.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_140.pdb
load../../../../OUT/AutoDock/140.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_140.pdb
group trj_1, docked_1trj_140.pdb
group trj_2, docked_2trj_140.pdb
load ../../../../OUT/AutoDock/092.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_092.pdb
load../../../../OUT/AutoDock/092.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_092.pdb
group trj_1, docked_1trj_092.pdb
group trj_2, docked_2trj_092.pdb
load ../../../../OUT/AutoDock/015.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_015.pdb
load../../../../OUT/AutoDock/015.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_015.pdb
group trj_1, docked_1trj_015.pdb
group trj_2, docked_2trj_015.pdb
load ../../../../OUT/AutoDock/084.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_084.pdb
load../../../../OUT/AutoDock/084.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_084.pdb
group trj_1, docked_1trj_084.pdb
group trj_2, docked_2trj_084.pdb
load ../../../../OUT/AutoDock/028.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_028.pdb
load../../../../OUT/AutoDock/028.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_028.pdb
group trj_1, docked_1trj_028.pdb
group trj_2, docked_2trj_028.pdb
load ../../../../OUT/AutoDock/126.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_126.pdb
load../../../../OUT/AutoDock/126.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_126.pdb
group trj_1, docked_1trj_126.pdb
group trj_2, docked_2trj_126.pdb
load ../../../../OUT/AutoDock/114.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_114.pdb
load../../../../OUT/AutoDock/114.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_114.pdb
group trj_1, docked_1trj_114.pdb
group trj_2, docked_2trj_114.pdb
load ../../../../OUT/AutoDock/031.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_031.pdb
load../../../../OUT/AutoDock/031.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_031.pdb
group trj_1, docked_1trj_031.pdb
group trj_2, docked_2trj_031.pdb
load ../../../../OUT/AutoDock/020.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_020.pdb
load../../../../OUT/AutoDock/020.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_020.pdb
group trj_1, docked_1trj_020.pdb
group trj_2, docked_2trj_020.pdb
load ../../../../OUT/AutoDock/067.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_067.pdb
load../../../../OUT/AutoDock/067.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_067.pdb
group trj_1, docked_1trj_067.pdb
group trj_2, docked_2trj_067.pdb
load ../../../../OUT/AutoDock/078.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_078.pdb
load../../../../OUT/AutoDock/078.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_078.pdb
group trj_1, docked_1trj_078.pdb
group trj_2, docked_2trj_078.pdb
load ../../../../OUT/AutoDock/046.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_046.pdb
load../../../../OUT/AutoDock/046.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_046.pdb
group trj_1, docked_1trj_046.pdb
group trj_2, docked_2trj_046.pdb
load ../../../../OUT/AutoDock/002.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_002.pdb
load../../../../OUT/AutoDock/002.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_002.pdb
group trj_1, docked_1trj_002.pdb
group trj_2, docked_2trj_002.pdb
load ../../../../OUT/AutoDock/142.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_142.pdb
load../../../../OUT/AutoDock/142.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_142.pdb
group trj_1, docked_1trj_142.pdb
group trj_2, docked_2trj_142.pdb
load ../../../../OUT/AutoDock/005.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_005.pdb
load../../../../OUT/AutoDock/005.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_005.pdb
group trj_1, docked_1trj_005.pdb
group trj_2, docked_2trj_005.pdb
load ../../../../OUT/AutoDock/061.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_061.pdb
load../../../../OUT/AutoDock/061.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_061.pdb
group trj_1, docked_1trj_061.pdb
group trj_2, docked_2trj_061.pdb
load ../../../../OUT/AutoDock/040.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_040.pdb
load../../../../OUT/AutoDock/040.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_040.pdb
group trj_1, docked_1trj_040.pdb
group trj_2, docked_2trj_040.pdb
load ../../../../OUT/AutoDock/130.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_130.pdb
load../../../../OUT/AutoDock/130.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_130.pdb
group trj_1, docked_1trj_130.pdb
group trj_2, docked_2trj_130.pdb
load ../../../../OUT/AutoDock/001.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_001.pdb
load../../../../OUT/AutoDock/001.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_001.pdb
group trj_1, docked_1trj_001.pdb
group trj_2, docked_2trj_001.pdb
load ../../../../OUT/AutoDock/024.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_024.pdb
load../../../../OUT/AutoDock/024.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_024.pdb
group trj_1, docked_1trj_024.pdb
group trj_2, docked_2trj_024.pdb
load ../../../../OUT/AutoDock/138.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_138.pdb
load../../../../OUT/AutoDock/138.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_138.pdb
group trj_1, docked_1trj_138.pdb
group trj_2, docked_2trj_138.pdb
load ../../../../OUT/AutoDock/083.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_083.pdb
load../../../../OUT/AutoDock/083.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_083.pdb
group trj_1, docked_1trj_083.pdb
group trj_2, docked_2trj_083.pdb
load ../../../../OUT/AutoDock/071.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_071.pdb
load../../../../OUT/AutoDock/071.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_071.pdb
group trj_1, docked_1trj_071.pdb
group trj_2, docked_2trj_071.pdb
load ../../../../OUT/AutoDock/088.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_088.pdb
load../../../../OUT/AutoDock/088.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_088.pdb
group trj_1, docked_1trj_088.pdb
group trj_2, docked_2trj_088.pdb
load ../../../../OUT/AutoDock/029.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_029.pdb
load../../../../OUT/AutoDock/029.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_029.pdb
group trj_1, docked_1trj_029.pdb
group trj_2, docked_2trj_029.pdb
load ../../../../OUT/AutoDock/052.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_052.pdb
load../../../../OUT/AutoDock/052.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_052.pdb
group trj_1, docked_1trj_052.pdb
group trj_2, docked_2trj_052.pdb
load ../../../../OUT/AutoDock/016.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_016.pdb
load../../../../OUT/AutoDock/016.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_016.pdb
group trj_1, docked_1trj_016.pdb
group trj_2, docked_2trj_016.pdb
load ../../../../OUT/AutoDock/101.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_101.pdb
load../../../../OUT/AutoDock/101.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_101.pdb
group trj_1, docked_1trj_101.pdb
group trj_2, docked_2trj_101.pdb
load ../../../../OUT/AutoDock/080.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_080.pdb
load../../../../OUT/AutoDock/080.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_080.pdb
group trj_1, docked_1trj_080.pdb
group trj_2, docked_2trj_080.pdb
load ../../../../OUT/AutoDock/139.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_139.pdb
load../../../../OUT/AutoDock/139.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_139.pdb
group trj_1, docked_1trj_139.pdb
group trj_2, docked_2trj_139.pdb
load ../../../../OUT/AutoDock/073.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_073.pdb
load../../../../OUT/AutoDock/073.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_073.pdb
group trj_1, docked_1trj_073.pdb
group trj_2, docked_2trj_073.pdb
load ../../../../OUT/AutoDock/132.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_132.pdb
load../../../../OUT/AutoDock/132.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_132.pdb
group trj_1, docked_1trj_132.pdb
group trj_2, docked_2trj_132.pdb
load ../../../../OUT/AutoDock/058.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_058.pdb
load../../../../OUT/AutoDock/058.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_058.pdb
group trj_1, docked_1trj_058.pdb
group trj_2, docked_2trj_058.pdb
load ../../../../OUT/AutoDock/086.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_086.pdb
load../../../../OUT/AutoDock/086.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_086.pdb
group trj_1, docked_1trj_086.pdb
group trj_2, docked_2trj_086.pdb
load ../../../../OUT/AutoDock/118.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_118.pdb
load../../../../OUT/AutoDock/118.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_118.pdb
group trj_1, docked_1trj_118.pdb
group trj_2, docked_2trj_118.pdb
load ../../../../OUT/AutoDock/095.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_095.pdb
load../../../../OUT/AutoDock/095.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_095.pdb
group trj_1, docked_1trj_095.pdb
group trj_2, docked_2trj_095.pdb
load ../../../../OUT/AutoDock/039.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_039.pdb
load../../../../OUT/AutoDock/039.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_039.pdb
group trj_1, docked_1trj_039.pdb
group trj_2, docked_2trj_039.pdb
load ../../../../OUT/AutoDock/141.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_141.pdb
load../../../../OUT/AutoDock/141.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_141.pdb
group trj_1, docked_1trj_141.pdb
group trj_2, docked_2trj_141.pdb
load ../../../../OUT/AutoDock/038.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_038.pdb
load../../../../OUT/AutoDock/038.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_038.pdb
group trj_1, docked_1trj_038.pdb
group trj_2, docked_2trj_038.pdb
load ../../../../OUT/AutoDock/034.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_034.pdb
load../../../../OUT/AutoDock/034.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_034.pdb
group trj_1, docked_1trj_034.pdb
group trj_2, docked_2trj_034.pdb
load ../../../../OUT/AutoDock/070.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_070.pdb
load../../../../OUT/AutoDock/070.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_070.pdb
group trj_1, docked_1trj_070.pdb
group trj_2, docked_2trj_070.pdb
load ../../../../OUT/AutoDock/033.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_033.pdb
load../../../../OUT/AutoDock/033.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_033.pdb
group trj_1, docked_1trj_033.pdb
group trj_2, docked_2trj_033.pdb
load ../../../../OUT/AutoDock/025.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_025.pdb
load../../../../OUT/AutoDock/025.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_025.pdb
group trj_1, docked_1trj_025.pdb
group trj_2, docked_2trj_025.pdb
load ../../../../OUT/AutoDock/082.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_082.pdb
load../../../../OUT/AutoDock/082.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_082.pdb
group trj_1, docked_1trj_082.pdb
group trj_2, docked_2trj_082.pdb
load ../../../../OUT/AutoDock/111.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_111.pdb
load../../../../OUT/AutoDock/111.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_111.pdb
group trj_1, docked_1trj_111.pdb
group trj_2, docked_2trj_111.pdb
load ../../../../OUT/AutoDock/079.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_079.pdb
load../../../../OUT/AutoDock/079.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_079.pdb
group trj_1, docked_1trj_079.pdb
group trj_2, docked_2trj_079.pdb
load ../../../../OUT/AutoDock/112.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_112.pdb
load../../../../OUT/AutoDock/112.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_112.pdb
group trj_1, docked_1trj_112.pdb
group trj_2, docked_2trj_112.pdb
load ../../../../OUT/AutoDock/115.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_115.pdb
load../../../../OUT/AutoDock/115.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_115.pdb
group trj_1, docked_1trj_115.pdb
group trj_2, docked_2trj_115.pdb
load ../../../../OUT/AutoDock/131.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_131.pdb
load../../../../OUT/AutoDock/131.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_131.pdb
group trj_1, docked_1trj_131.pdb
group trj_2, docked_2trj_131.pdb
load ../../../../OUT/AutoDock/062.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_062.pdb
load../../../../OUT/AutoDock/062.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_062.pdb
group trj_1, docked_1trj_062.pdb
group trj_2, docked_2trj_062.pdb
load ../../../../OUT/AutoDock/091.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_091.pdb
load../../../../OUT/AutoDock/091.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_091.pdb
group trj_1, docked_1trj_091.pdb
group trj_2, docked_2trj_091.pdb
load ../../../../OUT/AutoDock/098.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_098.pdb
load../../../../OUT/AutoDock/098.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_098.pdb
group trj_1, docked_1trj_098.pdb
group trj_2, docked_2trj_098.pdb
load ../../../../OUT/AutoDock/093.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_093.pdb
load../../../../OUT/AutoDock/093.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_093.pdb
group trj_1, docked_1trj_093.pdb
group trj_2, docked_2trj_093.pdb
load ../../../../OUT/AutoDock/059.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_059.pdb
load../../../../OUT/AutoDock/059.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_059.pdb
group trj_1, docked_1trj_059.pdb
group trj_2, docked_2trj_059.pdb
load ../../../../OUT/AutoDock/135.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_135.pdb
load../../../../OUT/AutoDock/135.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_135.pdb
group trj_1, docked_1trj_135.pdb
group trj_2, docked_2trj_135.pdb
load ../../../../OUT/AutoDock/003.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_003.pdb
load../../../../OUT/AutoDock/003.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_003.pdb
group trj_1, docked_1trj_003.pdb
group trj_2, docked_2trj_003.pdb
load ../../../../OUT/AutoDock/077.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_077.pdb
load../../../../OUT/AutoDock/077.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_077.pdb
group trj_1, docked_1trj_077.pdb
group trj_2, docked_2trj_077.pdb
load ../../../../OUT/AutoDock/068.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_068.pdb
load../../../../OUT/AutoDock/068.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_068.pdb
group trj_1, docked_1trj_068.pdb
group trj_2, docked_2trj_068.pdb
load ../../../../OUT/AutoDock/123.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_123.pdb
load../../../../OUT/AutoDock/123.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_123.pdb
group trj_1, docked_1trj_123.pdb
group trj_2, docked_2trj_123.pdb
load ../../../../OUT/AutoDock/017.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_017.pdb
load../../../../OUT/AutoDock/017.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_017.pdb
group trj_1, docked_1trj_017.pdb
group trj_2, docked_2trj_017.pdb
load ../../../../OUT/AutoDock/104.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_104.pdb
load../../../../OUT/AutoDock/104.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_104.pdb
group trj_1, docked_1trj_104.pdb
group trj_2, docked_2trj_104.pdb
load ../../../../OUT/AutoDock/105.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_105.pdb
load../../../../OUT/AutoDock/105.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_105.pdb
group trj_1, docked_1trj_105.pdb
group trj_2, docked_2trj_105.pdb
load ../../../../OUT/AutoDock/110.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_110.pdb
load../../../../OUT/AutoDock/110.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_110.pdb
group trj_1, docked_1trj_110.pdb
group trj_2, docked_2trj_110.pdb
load ../../../../OUT/AutoDock/103.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_103.pdb
load../../../../OUT/AutoDock/103.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_103.pdb
group trj_1, docked_1trj_103.pdb
group trj_2, docked_2trj_103.pdb
load ../../../../OUT/AutoDock/030.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_030.pdb
load../../../../OUT/AutoDock/030.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_030.pdb
group trj_1, docked_1trj_030.pdb
group trj_2, docked_2trj_030.pdb
load ../../../../OUT/AutoDock/047.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_047.pdb
load../../../../OUT/AutoDock/047.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_047.pdb
group trj_1, docked_1trj_047.pdb
group trj_2, docked_2trj_047.pdb
load ../../../../OUT/AutoDock/042.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_042.pdb
load../../../../OUT/AutoDock/042.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_042.pdb
group trj_1, docked_1trj_042.pdb
group trj_2, docked_2trj_042.pdb
load ../../../../OUT/AutoDock/099.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_099.pdb
load../../../../OUT/AutoDock/099.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_099.pdb
group trj_1, docked_1trj_099.pdb
group trj_2, docked_2trj_099.pdb
load ../../../../OUT/AutoDock/027.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_027.pdb
load../../../../OUT/AutoDock/027.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_027.pdb
group trj_1, docked_1trj_027.pdb
group trj_2, docked_2trj_027.pdb
load ../../../../OUT/AutoDock/012.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_012.pdb
load../../../../OUT/AutoDock/012.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_012.pdb
group trj_1, docked_1trj_012.pdb
group trj_2, docked_2trj_012.pdb
load ../../../../OUT/AutoDock/022.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_022.pdb
load../../../../OUT/AutoDock/022.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_022.pdb
group trj_1, docked_1trj_022.pdb
group trj_2, docked_2trj_022.pdb
load ../../../../OUT/AutoDock/013.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_013.pdb
load../../../../OUT/AutoDock/013.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_013.pdb
group trj_1, docked_1trj_013.pdb
group trj_2, docked_2trj_013.pdb
load ../../../../OUT/AutoDock/096.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_096.pdb
load../../../../OUT/AutoDock/096.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_096.pdb
group trj_1, docked_1trj_096.pdb
group trj_2, docked_2trj_096.pdb
load ../../../../OUT/AutoDock/087.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_087.pdb
load../../../../OUT/AutoDock/087.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_087.pdb
group trj_1, docked_1trj_087.pdb
group trj_2, docked_2trj_087.pdb
load ../../../../OUT/AutoDock/065.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_065.pdb
load../../../../OUT/AutoDock/065.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_065.pdb
group trj_1, docked_1trj_065.pdb
group trj_2, docked_2trj_065.pdb
load ../../../../OUT/AutoDock/119.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_119.pdb
load../../../../OUT/AutoDock/119.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_119.pdb
group trj_1, docked_1trj_119.pdb
group trj_2, docked_2trj_119.pdb
load ../../../../OUT/AutoDock/063.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_063.pdb
load../../../../OUT/AutoDock/063.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_063.pdb
group trj_1, docked_1trj_063.pdb
group trj_2, docked_2trj_063.pdb
load ../../../../OUT/AutoDock/106.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_106.pdb
load../../../../OUT/AutoDock/106.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_106.pdb
group trj_1, docked_1trj_106.pdb
group trj_2, docked_2trj_106.pdb
load ../../../../OUT/AutoDock/137.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_137.pdb
load../../../../OUT/AutoDock/137.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_137.pdb
group trj_1, docked_1trj_137.pdb
group trj_2, docked_2trj_137.pdb
load ../../../../OUT/AutoDock/043.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_043.pdb
load../../../../OUT/AutoDock/043.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_043.pdb
group trj_1, docked_1trj_043.pdb
group trj_2, docked_2trj_043.pdb
load ../../../../OUT/AutoDock/035.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_035.pdb
load../../../../OUT/AutoDock/035.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_035.pdb
group trj_1, docked_1trj_035.pdb
group trj_2, docked_2trj_035.pdb
load ../../../../OUT/AutoDock/006.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_006.pdb
load../../../../OUT/AutoDock/006.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_006.pdb
group trj_1, docked_1trj_006.pdb
group trj_2, docked_2trj_006.pdb
load ../../../../OUT/AutoDock/019.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_019.pdb
load../../../../OUT/AutoDock/019.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_019.pdb
group trj_1, docked_1trj_019.pdb
group trj_2, docked_2trj_019.pdb
load ../../../../OUT/AutoDock/057.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_057.pdb
load../../../../OUT/AutoDock/057.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_057.pdb
group trj_1, docked_1trj_057.pdb
group trj_2, docked_2trj_057.pdb
load ../../../../OUT/AutoDock/041.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_041.pdb
load../../../../OUT/AutoDock/041.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_041.pdb
group trj_1, docked_1trj_041.pdb
group trj_2, docked_2trj_041.pdb
load ../../../../OUT/AutoDock/102.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_102.pdb
load../../../../OUT/AutoDock/102.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_102.pdb
group trj_1, docked_1trj_102.pdb
group trj_2, docked_2trj_102.pdb
load ../../../../OUT/AutoDock/060.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_060.pdb
load../../../../OUT/AutoDock/060.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_060.pdb
group trj_1, docked_1trj_060.pdb
group trj_2, docked_2trj_060.pdb
load ../../../../OUT/AutoDock/014.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_014.pdb
load../../../../OUT/AutoDock/014.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_014.pdb
group trj_1, docked_1trj_014.pdb
group trj_2, docked_2trj_014.pdb
load ../../../../OUT/AutoDock/050.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_050.pdb
load../../../../OUT/AutoDock/050.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_050.pdb
group trj_1, docked_1trj_050.pdb
group trj_2, docked_2trj_050.pdb
load ../../../../OUT/AutoDock/007.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_007.pdb
load../../../../OUT/AutoDock/007.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_007.pdb
group trj_1, docked_1trj_007.pdb
group trj_2, docked_2trj_007.pdb
load ../../../../OUT/AutoDock/089.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_089.pdb
load../../../../OUT/AutoDock/089.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_089.pdb
group trj_1, docked_1trj_089.pdb
group trj_2, docked_2trj_089.pdb
load ../../../../OUT/AutoDock/026.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_026.pdb
load../../../../OUT/AutoDock/026.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_026.pdb
group trj_1, docked_1trj_026.pdb
group trj_2, docked_2trj_026.pdb
load ../../../../OUT/AutoDock/076.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_076.pdb
load../../../../OUT/AutoDock/076.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_076.pdb
group trj_1, docked_1trj_076.pdb
group trj_2, docked_2trj_076.pdb
load ../../../../OUT/AutoDock/004.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_004.pdb
load../../../../OUT/AutoDock/004.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_004.pdb
group trj_1, docked_1trj_004.pdb
group trj_2, docked_2trj_004.pdb
load ../../../../OUT/AutoDock/094.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_094.pdb
load../../../../OUT/AutoDock/094.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_094.pdb
group trj_1, docked_1trj_094.pdb
group trj_2, docked_2trj_094.pdb
load ../../../../OUT/AutoDock/048.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_048.pdb
load../../../../OUT/AutoDock/048.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_048.pdb
group trj_1, docked_1trj_048.pdb
group trj_2, docked_2trj_048.pdb
load ../../../../OUT/AutoDock/124.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_124.pdb
load../../../../OUT/AutoDock/124.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_124.pdb
group trj_1, docked_1trj_124.pdb
group trj_2, docked_2trj_124.pdb
load ../../../../OUT/AutoDock/109.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_109.pdb
load../../../../OUT/AutoDock/109.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_109.pdb
group trj_1, docked_1trj_109.pdb
group trj_2, docked_2trj_109.pdb
load ../../../../OUT/AutoDock/085.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_085.pdb
load../../../../OUT/AutoDock/085.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_085.pdb
group trj_1, docked_1trj_085.pdb
group trj_2, docked_2trj_085.pdb
load ../../../../OUT/AutoDock/100.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_100.pdb
load../../../../OUT/AutoDock/100.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_100.pdb
group trj_1, docked_1trj_100.pdb
group trj_2, docked_2trj_100.pdb
load ../../../../OUT/AutoDock/075.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_075.pdb
load../../../../OUT/AutoDock/075.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_075.pdb
group trj_1, docked_1trj_075.pdb
group trj_2, docked_2trj_075.pdb
load ../../../../OUT/AutoDock/010.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_010.pdb
load../../../../OUT/AutoDock/010.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_010.pdb
group trj_1, docked_1trj_010.pdb
group trj_2, docked_2trj_010.pdb
load ../../../../OUT/AutoDock/037.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_037.pdb
load../../../../OUT/AutoDock/037.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_037.pdb
group trj_1, docked_1trj_037.pdb
group trj_2, docked_2trj_037.pdb
load ../../../../OUT/AutoDock/107.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_107.pdb
load../../../../OUT/AutoDock/107.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_107.pdb
group trj_1, docked_1trj_107.pdb
group trj_2, docked_2trj_107.pdb
load ../../../../OUT/AutoDock/129.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_129.pdb
load../../../../OUT/AutoDock/129.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_129.pdb
group trj_1, docked_1trj_129.pdb
group trj_2, docked_2trj_129.pdb
load ../../../../OUT/AutoDock/128.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_128.pdb
load../../../../OUT/AutoDock/128.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_128.pdb
group trj_1, docked_1trj_128.pdb
group trj_2, docked_2trj_128.pdb
load ../../../../OUT/AutoDock/036.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_036.pdb
load../../../../OUT/AutoDock/036.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_036.pdb
group trj_1, docked_1trj_036.pdb
group trj_2, docked_2trj_036.pdb
load ../../../../OUT/AutoDock/134.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_134.pdb
load../../../../OUT/AutoDock/134.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_134.pdb
group trj_1, docked_1trj_134.pdb
group trj_2, docked_2trj_134.pdb
load ../../../../OUT/AutoDock/116.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_116.pdb
load../../../../OUT/AutoDock/116.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_116.pdb
group trj_1, docked_1trj_116.pdb
group trj_2, docked_2trj_116.pdb
load ../../../../OUT/AutoDock/018.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_018.pdb
load../../../../OUT/AutoDock/018.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_018.pdb
group trj_1, docked_1trj_018.pdb
group trj_2, docked_2trj_018.pdb
load ../../../../OUT/AutoDock/122.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_122.pdb
load../../../../OUT/AutoDock/122.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_122.pdb
group trj_1, docked_1trj_122.pdb
group trj_2, docked_2trj_122.pdb
load ../../../../OUT/AutoDock/045.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_045.pdb
load../../../../OUT/AutoDock/045.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_045.pdb
group trj_1, docked_1trj_045.pdb
group trj_2, docked_2trj_045.pdb
load ../../../../OUT/AutoDock/054.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_054.pdb
load../../../../OUT/AutoDock/054.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_054.pdb
group trj_1, docked_1trj_054.pdb
group trj_2, docked_2trj_054.pdb
load ../../../../OUT/AutoDock/021.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_021.pdb
load../../../../OUT/AutoDock/021.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_021.pdb
group trj_1, docked_1trj_021.pdb
group trj_2, docked_2trj_021.pdb
load ../../../../OUT/AutoDock/023.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_023.pdb
load../../../../OUT/AutoDock/023.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_023.pdb
group trj_1, docked_1trj_023.pdb
group trj_2, docked_2trj_023.pdb
load ../../../../OUT/AutoDock/011.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_011.pdb
load../../../../OUT/AutoDock/011.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_011.pdb
group trj_1, docked_1trj_011.pdb
group trj_2, docked_2trj_011.pdb
load ../../../../OUT/AutoDock/044.pdb/1_trj_equil_supLEU0-bb_31/docked_poses.pdbqt, docked_1trj_044.pdb
load../../../../OUT/AutoDock/044.pdb/2_trj_equil_supLEU1-bb_99/docked_poses.pdbqt, docked_2trj_044.pdb
group trj_1, docked_1trj_044.pdb
group trj_2, docked_2trj_044.pdb
