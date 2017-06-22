# Protein-Sequence-Analysis-Tools
This is a set of tools for protein sequence analysis, parsing and alignment.

These scripts assume that the Protein and DNA sequences are represented as FASTA.fa format. As an example:

    >1K8R:B|PDBID|CHAIN|SEQUENCE
    CILRFIACNGQTRAVQSRGDYQKTLAIALKKFSLEDASKFIVCVSQSSRIKLITEEEFKQICFNSSSPERDRLIIVPKEK
    PCPSFEDLRRSWEIELAQPAALSSQSSLSP
 
In this example ">1K8R:B|PDBID|CHAIN|SEQUENCE" is the header that contains information about the protein sequence, and the other lines are the sequence of the protein. Note that the protein/DNA sequence may be over more than one line, while the header is only one line. Each file may contain many sequences for different proteins and DNA. Fasta files of different sequences may also be aligned, in which case there may be gaps in the alignment.

## adjustAlignments.py
Usage: `python adjustAlignments.py input_file.fa`
Description: This script takes an input fasta file and adjusts it so that a sequence of a protein over many lines is concatonated to just one line. This is useful for parsing sequences later.

## fastaSingleline.sh
Usage: `source fastaSingleline.sh input_file.fa`
Description: Take input fasta file and convert it to a tab delimited file where column 1 is the header file and column 2 is the sequence. This script assumes that all of the sequences in input file are over one line (ala adjustAlignments.py)

## fastaTwoline.sh
Usage: `source fastaTwoline.sh input_file.fa`
Descripiton: Reverses fastaSingleline.sh by taking tab delimited sequence file and converting it to a fasta file

## removeGaps.pl
Usage: `perl removeGaps.pl input_file.afa`
Description: Given an aligned fasta file (.afa) remove all gaps from the input file. This script assumes that all of the sequences in input file are over one line (ala adjustAlignments.py)

## removeGapstemplate.pl

Usage: `perl removeGaps.pl <number> input_file.afa`
Description: Given an aligned fasta file (.afa) remove all gaps from the input file that correspond to gaps in the first <number sequences>. Unlike removeGaps.pl this this does not remove all gaps, just amino acids that correspond to gaps in the specified top <number> sequences. For example, if number=1, and the first sequence has gaps in position 3 and 7 then this will eliminate gaps and amino acids that correspond to positions 3 and 7.

## shannonEntropyMSA.R

Usage: `R  --no-save --no-restore < shannonEntropyMSA.R --args input_file.afa outputfile.txt`
Description: Given an aligned  Multiple Sequence Slignment input file (assuming that all of the sequences in input file are over one line), calculates the entropy of each position in the alignment. 0 means that there is only 1 residue in the position (i.e. totally conserved). 4.322 is the maximum and means all residues are equally present.This script can only be used for protein sequence and not DNA sequence. The outpufile contains a tab delimited file with the following information

        "Position","AA_of_first_Sequence","Entropy","Number_of_Gaps","Number_of_Non_Gaps"
