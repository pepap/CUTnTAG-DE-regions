# CUTnTAG-DE-regions

## <ins>convert bedGraphs to bigWig</ins>
Run in R (4.5.1) :
```
R --no-save < bG2bW.R
```

## <ins>counting</ins>

- tile & count using the [multiBigwigSummary]([https://github.com/marcelm/cutadapt](https://deeptools.readthedocs.io/en/latest/content/tools/multiBigwigSummary.html)) software
  - computes the **average scores** for each of the files in every genomic region simulataneously for multi bigWig files
  - the length of one tiled region : 1kB
  - default output file *DS-CUTnTAG-anal--tile1kB-avrSum.npz* does not contain the coordinates of the tiles - the additional text file *DS-CUTnTAG-anal--tile1kB-avrSum.tab.gz* used instead
  - running for ~ 10 minutes
```
bash run_mBWsummary.bash
```
