library(GenomicRanges)
library(rtracklayer)
library(GenomeInfoDb)

TILE_WIDTH_NT=1000
STOR="/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/"
SUFF="-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bedgraph.gz"
BEDGRAPHS_GRP <- c(
 "AP1_ADPr_rep1_MKDL260000055",   "AP1_ADPr_rep2_MKDL260000055",   "AP1_ADPr_rep3_MKDL260000055",
 "AP2_ADPr_rep1_MKDL260000055",   "AP2_ADPr_rep2_MKDL260000055",   "AP2_ADPr_rep3_MKDL260000055",
 "AP12_ADPr_rep1_MKDL260000053",  "AP12_ADPr_rep2_MKDL260000053",  "AP12_ADPr_rep3_MKDL260000053",
 "ARH3_ADPr_rep1_MKDL260000055",  "ARH3_ADPr_rep2_MKDL260000055",  "ARH3_ADPr_rep3_MKDL260000055",
 "ARH3_IgG_rep1_MKDL260000053",   "ARH3_IgG_rep2_MKDL260000053",   "ARH3_IgG_rep3_MKDL260000053",
 "ARH3_K27ac_rep1_MKDL260000054", "ARH3_K27ac_rep2_MKDL260000054", "ARH3_K27ac_rep3_MKDL260000054",
 "ARH3_K27me3_rep1_MKDL260000054","ARH3_K27me3_rep2_MKDL260000054","ARH3_K27me3_rep3_MKDL260000054",
 "WT_IgG_rep1_MKDL260000053",     "WT_IgG_rep2_MKDL260000053",     "WT_IgG_rep3_MKDL260000053",
 "WT_K27ac_rep1_MKDL260000054",   "WT_K27ac_rep2_MKDL260000054",   "WT_K27ac_rep3_MKDL260000054",
 "WT_K27me3_rep1_MKDL260000054",  "WT_K27me3_rep2_MKDL260000054",  "WT_K27me3_rep3_MKDL260000054"
)

cat("\n")
if (!exists("hg38_seqinfo")) {

cat( " ++> Fetch chromosome lengths for the human genome (e.g., GRCh38/hg38)\n",sep="" )
hg38_seqinfo <- SeqinfoForUCSCGenome( genome="hg38" )
cat( " ++> (Optional but recommended) Filter for standard chromosomes only (chr1-chr22, X, Y, M)\n",sep="" )
hg38_seqinfo <- keepStandardChromosomes( x=hg38_seqinfo,species="Homo_sapiens" )

}

cat("\n")
for ( ib in seq_along(BEDGRAPHS_GRP) ) {

 cat( " ++> Import your bedgraph data : ",BEDGRAPHS_GRP[ib],"\n",sep="" )
 bg_data                                                <- import( con=paste0(STOR,BEDGRAPHS_GRP[ib],SUFF),format="bedGraph" )
 seqlengths(bg_data)[ names(seqlengths(hg38_seqinfo)) ] <- seqlengths(hg38_seqinfo)
 cat( " ++> Export your bedgraph data\n",sep="" )
 export.bw( object=bg_data,con=paste0(BEDGRAPHS_GRP[ib],sub("[.]bedgraph[.]gz$","",SUFF),".bw") )

 cat( " ++> Cleaning ...\n",sep="" )
 rm( list=c("bg_data") )
 gc( verbose=T )
 cat("\n")

}

