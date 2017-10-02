# Reverses fastaSingle line, by converting back to a regular fasta file
#Give a file with for each line you have ">Idofprotein\tfTHESEQUENCE" it will convert it to
#>Idofprotein
#THESEQUENCE
cat $1|perl -ne 'chomp $_;s/\t/\n/;print "$_\n"'
