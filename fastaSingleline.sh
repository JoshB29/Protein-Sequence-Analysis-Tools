#Author: Joshua Broyde,  (Honig lab and Califano lab, at Columbia University Medial Center)
#Date: June 2017
# Transform a fasta file to a tab delmited file, first column is the ">ID" line, and the second column is the sequence
#ASSUMES ALL OF THE SEQUENCE IS ON ONE LINE!!!
cat $1|perl -ne 'chomp $_; if ($_=~/^>/){print "$_\t";} else {print "$_\n"}'
