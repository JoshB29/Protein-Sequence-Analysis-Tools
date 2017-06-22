#!/usr/bin/python
#Author: Joshua Broyde,  (Honig lab and Califano lab, at Columbia University Medial Center)
#Date: June 2017

#Fasta files files frequenctly spread the sequence of long proteins over many lines, which is annoying to parse
# This script takes in a fasta file of a bunch of alignments and adjusts it so that the sequences are 2 lines  per sequence, the first line in the header and the second line is the sequence.
import sys;
import os;
from random import random
import socket;
import re;
import math;
import subprocess
file_1=sys.argv[1];
file_1=file_1.lstrip()
content = open(file_1, 'r').read()
#print(content)
alignments = content.split(">")
del alignments[0]
#print(alignments[1])
for i in alignments:
	lines=i.split("\n")
	header=lines[0]
	header=header.rstrip()
	header=header.lstrip()
	del lines[0]
	new_line=[]
	for j in lines:
		j=j.lstrip()
		j=j.rstrip()
		new_line.extend(j)
	new_line=''.join(new_line)
	print (">{header}\n{new_line}".format(**locals()))

