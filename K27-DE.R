library(data.table)
library(DESeq2)
library(pcaExplorer)
library(matrixStats)
library(scales)

if ( !exists("LOADED_TAB") ) {

 cat( "\n >> Loading input data ... \n",sep="" )
 xtab            <- fread("/path/to/DS-CUTnTAG-anal--tile1kB-avrSum.tab.gz",header=T)
 colnames(xtab)  <- gsub( "[']","",colnames(xtab) )
 colnames(xtab)  <- gsub( "[#]","",colnames(xtab) )
 xtab[["start"]] <- xtab[["start"]]+1
 colnames(xtab)  <- sub( "_MKDL.*$","",colnames(xtab) )
 xtab[["gLoc"]]  <- xtab[,paste( chr,start,end-start+1,sep="." )]

 exp.df          <-
  data.frame(
   EPIMARKS = as.factor( rep.int( c("ADPr","IgG","K27ac","K27me3","IgG","K27ac","K27me3"),c(12,3,3,3,3,3,3) ) ),
   GENOTYPE = as.factor( rep.int( c("AP1","AP2","AP12","ARH3","WT"),c(3,3,3,12,9) ) ),
   row.names = colnames(xtab)[ grepl( "_rep",colnames(xtab) ) ]
  )

 LOADED_TAB      <- Sys.time()

}

if ( !exists("LOADED_DDS") ) {

 cat( " >> K27ac DE analysis ... \n",sep="" )

 TMP.df            <- exp.df[ exp.df$EPIMARKS %in% c("IgG","K27ac"), ]
 TMP.mat           <- as.matrix( x=xtab[,c("gLoc",rownames(TMP.df)),with=F],rownames="gLoc" )
 TMP.mat[ is.nan(TMP.mat) ] <- as.numeric("0")
  
 K27A.dds          <-
  DESeqDataSetFromMatrix(
   countData  = round( TMP.mat ),
   colData    =        TMP.df,
   design     = ~ GENOTYPE + EPIMARKS
  )
 K27A.dds$GENOTYPE <- relevel( x=K27A.dds$GENOTYPE,ref="WT"  )
 K27A.dds$EPIMARKS <- relevel( x=K27A.dds$EPIMARKS,ref="IgG" )
 K27A.dds          <- DESeq(     K27A.dds )

 save( K27A.dds,file="K27A.dds.rda" )
 rm( list=c("TMP.df","TMP.mat","K27A.dds") )
 gc( verbose=T )

cat( " >> K27me3 DE analysis ... \n",sep="" )

 TMP.df            <- exp.df[ exp.df$EPIMARKS %in% c("IgG","K27me3"), ]
 TMP.mat           <- as.matrix( x=xtab[,c("gLoc",rownames(TMP.df)),with=F],rownames="gLoc" )
 TMP.mat[ is.nan(TMP.mat) ] <- as.numeric("0")
 K27M.dds          <-
  DESeqDataSetFromMatrix(
   countData  = round( TMP.mat ),
   colData    =        TMP.df,
   design     = ~ GENOTYPE + EPIMARKS
  )
 K27M.dds$GENOTYPE <- relevel( x=K27M.dds$GENOTYPE,ref="WT"  )
 K27M.dds$EPIMARKS <- relevel( x=K27M.dds$EPIMARKS,ref="IgG" )
 K27M.dds          <- DESeq(     K27M.dds )

 save( K27M.dds,file="K27M.dds.rda" )
 rm( list=c("TMP.df","TMP.mat","K27M.dds") )
 gc( verbose=T )

} else {
 load( "K27A.dds.rda",verbose=T )
 load( "K27M.dds.rda",verbose=T )
}
