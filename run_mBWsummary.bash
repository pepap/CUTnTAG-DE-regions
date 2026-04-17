#!/bin/bash

EXESTOR="/storage/brno12-cerit/home/pepap/brno1/pLIBRARY/stlearn/CONDA/install/bin"
NCPU=16

STOR="/storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw"
SUFF="-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw"
LABS=(
 AP1_ADPr_rep1_MKDL260000055    AP1_ADPr_rep2_MKDL260000055    AP1_ADPr_rep3_MKDL260000055
 AP2_ADPr_rep1_MKDL260000055    AP2_ADPr_rep2_MKDL260000055    AP2_ADPr_rep3_MKDL260000055
 AP12_ADPr_rep1_MKDL260000053   AP12_ADPr_rep2_MKDL260000053   AP12_ADPr_rep3_MKDL260000053
 ARH3_ADPr_rep1_MKDL260000055   ARH3_ADPr_rep2_MKDL260000055   ARH3_ADPr_rep3_MKDL260000055
 ARH3_IgG_rep1_MKDL260000053    ARH3_IgG_rep2_MKDL260000053    ARH3_IgG_rep3_MKDL260000053
 ARH3_K27ac_rep1_MKDL260000054  ARH3_K27ac_rep2_MKDL260000054  ARH3_K27ac_rep3_MKDL260000054
 ARH3_K27me3_rep1_MKDL260000054 ARH3_K27me3_rep2_MKDL260000054 ARH3_K27me3_rep3_MKDL260000054
 WT_IgG_rep1_MKDL260000053      WT_IgG_rep2_MKDL260000053      WT_IgG_rep3_MKDL260000053
 WT_K27ac_rep1_MKDL260000054    WT_K27ac_rep2_MKDL260000054    WT_K27ac_rep3_MKDL260000054
 WT_K27me3_rep1_MKDL260000054   WT_K27me3_rep2_MKDL260000054   WT_K27me3_rep3_MKDL260000054
)
BWFF=(
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/AP1_ADPr_rep1_MKDL260000055-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/AP1_ADPr_rep2_MKDL260000055-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/AP1_ADPr_rep3_MKDL260000055-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/AP2_ADPr_rep1_MKDL260000055-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/AP2_ADPr_rep2_MKDL260000055-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/AP2_ADPr_rep3_MKDL260000055-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/AP12_ADPr_rep1_MKDL260000053-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/AP12_ADPr_rep2_MKDL260000053-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/AP12_ADPr_rep3_MKDL260000053-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_ADPr_rep1_MKDL260000055-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_ADPr_rep2_MKDL260000055-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_ADPr_rep3_MKDL260000055-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_IgG_rep1_MKDL260000053-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_IgG_rep2_MKDL260000053-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_IgG_rep3_MKDL260000053-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_K27ac_rep1_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_K27ac_rep2_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_K27ac_rep3_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_K27me3_rep1_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_K27me3_rep2_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/ARH3_K27me3_rep3_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/WT_IgG_rep1_MKDL260000053-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/WT_IgG_rep2_MKDL260000053-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/WT_IgG_rep3_MKDL260000053-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/WT_K27ac_rep1_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/WT_K27ac_rep2_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/WT_K27ac_rep3_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/WT_K27me3_rep1_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/WT_K27me3_rep2_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
 /storage/brno12-cerit/home/pepap/HH-ARH3-2025/Debbie_Stela_CUTnTAG_Analysis/bedgraph/bG2bw/WT_K27me3_rep3_MKDL260000054-1A_23HJW5LT4_L3.fragments.spikeIn_normalized.bw
)

${EXESTOR}/multiBigwigSummary bins --bwfiles ${BWFF[@]} \
                                   --outFileName  DS-CUTnTAG-anal--tile1kB-avrSum.npz \
                                   --outRawCounts DS-CUTnTAG-anal--tile1kB-avrSum.tab \
                                   --labels ${LABS[@]} \
                                   --binSize 1000 \
                                   --distanceBetweenBins 0 \
                                   --numberOfProcessors ${NCPU} \
                                   --verbose

gzip -fv DS-CUTnTAG-anal--tile1kB-avrSum.tab
