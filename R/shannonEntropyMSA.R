

#Given a Multiple Sequence Alignment, this script calculates the Shannon Entropy of every position. Entropy is a measure of how conserved it is, 0 means that there is only 1 residue in the position (i.e. totally conserved). 4.322 is the maximum means all residues are equally present
#Usage Example
#/nfs/apps/R/3.1.1/bin/R  --no-save --no-restore < /ifs/home/c2b2/bh_lab/jb3401/jb3401/scripts/PDB_FASTA_parse/shannonEntropyMSA.R  --args Input_MSA.fa outputfile.txt
#The multiple sequence alignment must be formatted so that there is a header and every alignment is one one line!

#e.g.
#>1LFD_RBD
#-------------------------------------------------------------G-D-CCIIRV-SL-D
#>BYR2_RBD
#---------------------------------------------------------------C-ILRFIA--C--
#>RASSF5_014126.d272_365_m_RBD_only
#------------------------------------------------------------T----T------K---

arg <- commandArgs(trailingOnly = TRUE) #Get the files containing the data
#print(arg)
args=as.vector(arg);
arg=args[[1]]
outfile=args[[2]]
#arg="/ifs/data/c2b2/bh_lab/jb3401/Entropy_analysis_Binders_non_binders_RBD/Binders_only_Alignment.txt"

cmd=paste("cat ",arg,"|grep -v \">\"")

df=system(cmd,intern = TRUE)
df_2=strsplit(df,"")
df_3=as.data.frame(df_2)



output_df=data.frame(matrix(NA, nrow = nrow(df_3), ncol = 5))

#Get Shannon Entropy
z=lapply(1:nrow(output_df),
	function(x) 
{
vec=df_3[x,]

vec2=t(vec)

#Remove Gaps
vec2=vec2[which(vec2[,1]!="-")]

freqs=table(vec2)/length(vec2)

#freqs=amino_acids

entropy=-sum(log2(freqs)*freqs)	
return(entropy)
}
)
z=unlist(z)



#Count number of gaps
q=lapply(1:nrow(output_df),
	function(x) 
{
vec=df_3[x,]
num_gaps=length(which(vec=="-"))
}
)
q=unlist(q)

q2=lapply(1:nrow(output_df),
	function(x) 
{
vec=df_3[x,]
num_nongaps=length(which(vec!="-"))
}
)
q2=unlist(q2)

#0 means that there is only 1 residue in the position (i.e. totally conserved). 4.322 means all residues are equally present
colnames(output_df)=c("Position","AA_of_first_Sequence","Entropy","Number_of_Gaps","Number_of_Non_Gaps")
output_df$Position=1:length(z)
output_df$AA_of_first_Sequence=unlist(df_3[,1])
output_df$Entropy=z
output_df$Number_of_Gaps=q
output_df$Number_of_Non_Gaps=q2
#output_df[,1]=NULL
write.table(output_df,outfile,quote=F, sep="\t",row.names=F, col.names=T)

