library(data.table)
library(DESeq2)
library(pcaExplorer)
library(matrixStats)
library(scales)

# name (from the BED file)
# size (length of the region)
# covered (number of bases with data)
# sum (sum of the scores)
# mean0 (average over the whole region, including zeros)
# mean (average over just the covered bases)

TARGZ <- c(
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/AP12_ADPr_rep1.tab.gz",
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/AP12_ADPr_rep2.tab.gz",
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/AP12_ADPr_rep3.tab.gz",
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/AP1_ADPr_rep1.tab.gz",
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/AP1_ADPr_rep2.tab.gz",
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/AP1_ADPr_rep3.tab.gz",
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/AP2_ADPr_rep1.tab.gz",
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/AP2_ADPr_rep2.tab.gz",
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/AP2_ADPr_rep3.tab.gz",
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/ARH3_ADPr_rep1.tab.gz",
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/ARH3_ADPr_rep2.tab.gz",
 "/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/01.tileCounts/mBWsummary/winSUM/ARH3_ADPr_rep3.tab.gz"
)

o.dt <- data.table()
for ( i in seq_along(TARGZ) ) {

 LAB  <- sub( "[.]tab[.]gz$","",sub( "^.*[/]","",TARGZ[i] ) )
 cat( " > ",LAB,"\n",sep="")
 t.dt <- fread(TABGZ[i])
 colnames(t.dt) <- paste0( rep.int(LAB,6),"_",c( "name","size","covered","sum","mean0","mean" ) )
 colnames(t.dt)[1] <- "name"
 o.dt <- merge( o.dt,t.dt,by="name",sort=F,all=T )

}

exp.df          <-
 data.frame(
  EPIMARKS = as.factor( rep.int( c("ADPr","IgG","K27ac","K27me3","IgG","K27ac","K27me3"),c(12,3,3,3,3,3,3) ) ),
  GENOTYPE = as.factor( rep.int( c("AP1","AP2","AP12","ARH3","WT"),c(3,3,3,12,9) ) ),
  row.names = colnames(xtab)[ grepl( "_rep",colnames(xtab) ) ]
 )

cat( " >> ADPr DE analysis ... \n",sep="" )
if (T) {

 TMP.df            <- exp.df[ exp.df$EPIMARKS=="ADPr", ]
 TMP.mat           <- as.matrix( x=xtab[,c("gLoc",rownames(TMP.df)),with=F],rownames="gLoc" )
 TMP.mat[ is.nan(TMP.mat) ] <- as.numeric("0")
 ADPR.dds          <-
  DESeqDataSetFromMatrix(
   countData  = round( TMP.mat ),
   colData    =        TMP.df,
   design     = ~ GENOTYPE
  )
 ADPR.dds$GENOTYPE <- relevel( x=ADPR.dds$GENOTYPE,ref="AP12" )
 ADPR.dds          <- DESeq(     ADPR.dds )

 save( ADPR.dds,file="ADPR.dds.rda" )
 rm( list=c("TMP.df","TMP.mat","ADPR.dds") )
 gc( verbose=T )

} else {
 load( "ADPR.dds.rda",verbose=T )
}
