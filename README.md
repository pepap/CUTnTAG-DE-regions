# CUTnTAG-DE-regions

## <ins>> Convert bedGraphs to bigWig</ins>
Run in R (4.5.1) :
```
R --no-save < bG2bW.R
```

## <ins>> Counting</ins>

- Tile & count using the [multiBigwigSummary](https://deeptools.readthedocs.io/en/latest/content/tools/multiBigwigSummary.html) software
  - computes the **average scores** for each of the files in every genomic region simultaneously for multi bigWig files
  - the length of one tiled region : 1kB
  - default output file *DS-CUTnTAG-anal--tile1kB-avrSum.npz* does not contain the coordinates of the tiles - the additional text file *DS-CUTnTAG-anal--tile1kB-avrSum.tab.gz* used instead
  - running for ~ 10 minutes
  ```
  bash run_mBWsummary.bash
  ```
  - Differential expression (DE) analysis by [DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) library
  ```
    R --no-save < 27-DE.R
  ```
  - Disregulated K27acet/met3 regions highlighted on the RNA-seq data (ARH3 vs. WT) :
    - for each gene an upstream flank region of 5 kB was included
    - genes overlapped with up- AND down-regulated tiled regions were labeled as *ambiguous* (there is a typo in the picture legend) 

<img width="1000" height="700" alt="ARH3ko_vs_WT--K27Ac-K27Met-20260410" src="https://github.com/user-attachments/assets/a7821b0c-5c42-4dcd-9938-2bca4d22f1b4" />

  
- The **average scores** aprroach didn't work for ADPr data. After [manual inspection in UCSC browser](https://genome-euro.ucsc.edu/s/pepap/Debbie%2D%2DCUTnTAG%2Dhg38%2Dall) I switched to the **sum of the scores** in every genomic region. 
  - the length of one tiled region was optimized to 20kB
  - counting was performed using [bigWigAverageOverBed](https://github.com/ENCODE-DCC/kentUtils/tree/master/src/utils/bigWigAverageOverBed)
  ```
  bigWigAverageOverBed input.bw tileWin20kB.bed out.tab
  ```
  - DE analysis was done in the same way, *ARH3+PARP1 double-ko* (AP1) used as the reference
  ```
  R --no-save < ADPr-DE.R
  ```
  - few examples of found ADPr dis-regulated regions (if there were multiple adjacent tiles showing the same significant disregulation, I merged the tile regions. That's why the red boxes r not all of the same size)


<img width="1000" height="1000" alt="ARMC8-20260413" src="https://github.com/user-attachments/assets/00b8dcc5-5d74-4c9c-84e9-229036d786f5" />
<img width="1000" height="1000" alt="FOXP1-20260413" src="https://github.com/user-attachments/assets/90328fa0-1b6f-4f7f-99a9-364fa898db57" />
<img width="1000" height="1000" alt="HMGA2-20260413" src="https://github.com/user-attachments/assets/020dcc41-7e68-48d2-848d-dc297478e55c" />
<img width="1000" height="1000" alt="STK4-20260413" src="https://github.com/user-attachments/assets/0f7bfd4d-819d-4f49-9f9f-be354ae381cf" />
<img width="1000" height="1000" alt="UPF3A-20260413" src="https://github.com/user-attachments/assets/0174b0e0-1a1e-47aa-a5fa-ae9abc5403f0" />



