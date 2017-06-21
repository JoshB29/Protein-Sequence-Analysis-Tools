# Protein-Sequence-Analysis-Tools
This is a set of tools for protein sequence analysis, parsing and alignment.

These scripts assume that the Protein and DNA sequences are represented as FASTA.fa format. As an example:

    >1K8R:B|PDBID|CHAIN|SEQUENCE
    CILRFIACNGQTRAVQSRGDYQKTLAIALKKFSLEDASKFIVCVSQSSRIKLITEEEFKQICFNSSSPERDRLIIVPKEK
    PCPSFEDLRRSWEIELAQPAALSSQSSLSP
 
In this example ">1K8R:B|PDBID|CHAIN|SEQUENCE" is the header that contains information about the protein sequence, and the other lines are the sequence of the protein. Note that the protein/DNA sequence may be over more than one line, while the header is only one line

# adjustAlignments.py
