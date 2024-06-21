#!/bin/bash
source /scratch/mcm/trapp/software/init_trapp4.sh
trap "pkill -9 -g $$ ;exit" ERR SIGKILL SIGHUP SIGTERM SIGINT INT KILL 
export TRAPP=/share/apps/mcm/trapp4/trapptool
PATH=$PATH:/opt/trapp_server/trapp3/trapp4/target/universal/trapp_webserver-1.0-SNAPSHOT/molbio/NAMD_2.9_Linux-x86_64-multicore
export TRAPP_NCORES=1
echo "trapp-check.log" > list_of_logs.txt 
export TRAPP_NCORES=2
cd TRAPP-POCKET/RIPlig/; ln -sf ../../ligand_position.pdb  ./  ; cd ../.. ;
echo "TRAPP-POCKET/RIPlig/trapp-pocket.log/" >> list_of_logs.txt 
cd TRAPP-POCKET/RIPlig; cp ../../structure_5lr1.pdb  ./; /scratch/mcm/trapp/software/anaconda3/envs/py2/bin/python -s $TRAPP/scripts/trapp-pocket.py trapp_pocket.input & 
 wait 
 cd ../..;
export TRAPP_NCORES=1
echo "TRAPP-POCKET/CLUSTER/trapp-pocket.log" >> list_of_logs.txt 
cd TRAPP-POCKET/CLUSTER; cp ../../structure_5lr1.pdb  ./; /scratch/mcm/trapp/software/anaconda3/envs/py2/bin/python -s $TRAPP/scripts/trapp-pocket.py trapp_pocket.input & 
 wait 
 cd ../..;
cd /opt/trapp_server/trapp3/trapp4/target/universal/trapp_webserver-1.0-SNAPSHOT/uploads/pocket_505edb66-961a-471b-9951-1c9dc164f951 ; /scratch/mcm/trapp/software/anaconda3/envs/py2/bin/python -s $TRAPP/auxi/rename-trapp-create-user-out.py & 
 wait 

