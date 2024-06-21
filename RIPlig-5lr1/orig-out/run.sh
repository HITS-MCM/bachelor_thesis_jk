#!/bin/bash
trap "pkill -9 -g $$ ; exit" ERR SIGKILL SIGHUP SIGTERM SIGINT INT KILL 
source /scratch/mcm/trapp/software/init_trapp4.sh
export TRAPP=/share/apps/mcm/trapp4/trapptool
PATH=$PATH:/opt/trapp_server/trapp3/trapp4/target/universal/trapp_webserver-1.0-SNAPSHOT/molbio/NAMD_2.9_Linux-x86_64-multicore
export TRAPP_NCORES=2
echo " " > list_of_logs.txt 
 echo "trapp-structure-riplig.log" >> list_of_logs.txt 
/scratch/mcm/trapp/software/anaconda3/envs/py2/bin/python -s /share/apps/mcm/trapp4/trapptool/scripts/trapp-structure.py  inputriplig.dat > trapp-structure-riplig.log & 
 wait 
 echo "trapp-analysis-bb.log" >> list_of_logs.txt 
/scratch/mcm/trapp/software/anaconda3/envs/py2/bin/python -s /share/apps/mcm/trapp4/trapptool/scripts/trapp-analysis.py structure_5lr1.pdb contact_residues_ref_analysis.dat     -zmax 8.0 -bb  -cluster 3.0  > trapp-analysis-bb.log & 
 wait 
/scratch/mcm/trapp/software/anaconda3/envs/py2/bin/python -s /share/apps/mcm/trapp4/trapptool/scripts/trapp-make_pocket_input.py ligand_position.pdb 3.5 & 
 wait 
