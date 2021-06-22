### Genomic alignment

The following pipeline was used to align filtered libraries against the assembled genome of the species *Holochilus sciureus* (2n = 56, NF = 56), a Neotropical rodent of Oryzomyini tribe. The libraries comprise whole genomic DNA (gDNA) and probe of entire chromosome (obtained by flow sorting and fragmented by a DOP-PCR reaction) sequences, both from the species *H. sciureus*. Filtering and assembly pipelines are available at [GitHub page](https://github.com/MoreiraCN/Filtering_Illumina_sequences) and [GitHub page](https://github.com/MoreiraCN/Assembling_Illumina_sequences).

- Softwares used:

bowtie-v2.4.2 | http://bowtie-bio.sourceforge.net/bowtie2/index.shtml | Langmead B, Salzberg SL (2012). Fast gapped-read alignment with Bowtie 2. Nat Methods, 9(4):357.

samtools-v1.9 | http://samtools.sourceforge.net/ | Li H, Handsaker B, Wysoker A, Fennell T, Ruan J, Homer N, Marth G, Abecasis G, Durbin R (2009). The sequence alignment/map format and SAMtools. Bioinformatics, 25(16):2078-2079.

The script were designer using an job scheduling system [sbatch](https://slurm.schedmd.com/sbatch.html).

- Command line used: sbatch [bowtie2_aligment.sh](https://github.com/MoreiraCN/Genomic_alignment/blob/main/bowtie2_aligment.sh)

**Input data:**
 
 - Assembled genome in fasta format.
 - Filtered libraries in fasta format (is possible to use compressed files).


 **Parameters used:**
 
 - very-sensitive 
 - no-discordant 
 - N 0 
 - L 4 
 - gbar 10 
 - threads 20 
 - un-conc
 - Sb 
 - @ 11 
 - o 
 - @ 11 
 
