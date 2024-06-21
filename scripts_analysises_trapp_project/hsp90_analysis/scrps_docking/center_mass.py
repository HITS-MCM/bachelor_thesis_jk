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

import math

from pymol import cmd
center_mass =[]
cmd.load('ligand.pdbqt', 'ligand')
center_mass=cmd.centerofmass('ligand')
cmd.delete('ligand')
out = open('receptor_vina_box.txt','w')
out.write(
'center_x = '+str(center_mass[0])+'\n'
'center_y = '+str(center_mass[1])+'\n'
'center_z = '+str(center_mass[2])+'\n')
out.close()