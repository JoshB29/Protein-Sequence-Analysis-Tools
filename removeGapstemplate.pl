#!/usr/bin/perl
#This scripts removes all gaps from a fasta file from all the sequences for which the template fasta (i.e. the first or more sequence)
#do not have gaps, so that in the output, the first sequence (at least), does not have gaps
#  perl ~/jb3401/scripts/PDB_FASTA_parse/removeGapstemplate.pl output_merged_alignments_2.fa 1 > output_merged_alignments_3.fa
use warnings;
use strict;
my $file=shift;
my $num=1;
#num is the number of sequences for which you are getting corresponding elements. If num is 1, then you are removing all gaps in sequence 1, and printing the corresponding positions of all the other proteins and ELMINATING residues that align to a gap in 1. If num is two, then you are elminating those positions that correspond to gaps in both sequences etc.
$num=shift; 
my @alignments=`cat $file|grep --invert-match ">"|head --lines=$num`; #Get alignments without header
my @temp=split //,$alignments[0];
my $length=@temp;
#print "$length\n";
my %gaps;
my $x=0;
while ($x< $length){
	$gaps{$x}=0;
	$x++;
} 
#my @gaps=(1 .. $length);
#print @gaps
foreach my $alignment (@alignments){
	my @alignment_s=split //,$alignment;
	my $i=0;
	foreach (@alignment_s){
		if ($_ =~/-|\./){
			$gaps{$i}=$gaps{$i}+1;
		}
		$i++;
	}
}
my @keys=keys(%gaps);
@keys=sort {$a <=> $b} @keys;
#foreach (@keys){
#	print "$_\t$gaps{$_}\n";
#}

my @alignments_all=`cat $file`;
foreach my $alignment (@alignments_all){
	if ($alignment=~/^>/){print "$alignment";next;}
	my @alignment_s=split //,$alignment;
	my $i=0;
	foreach (@alignment_s){
		unless ($gaps{$i}==$num){
			print "$_"
		}
		$i++;
	}
	#print "\n";

}
#print "@alignments\n";
