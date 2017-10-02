#!/usr/bin/perl

#Author: Joshua Broyde,  (Honig lab and Califano lab, at Columbia University Medial Center)
#Date: June 2017

use warnings;
use strict;
my $file=shift;
my @content=`cat $file`;
foreach (@content)
{
	chomp $_;
	if ($_=~/^>/){
	print "$_\n";
	next;
	}
	else {
	$_=~s/-//g;
	#$_=~s/-*//g;
	print "$_\n";
	}
}
