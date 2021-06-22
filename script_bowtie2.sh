#!/bin/bash
# bowtie2_aligment
#
# Submit this script with: sbatch [bowtie2_aligment.sh]
#
#SBATCH --job-name=bowtie2_aligment_HSC0B_assembly
#SBATCH --output=bowtie2_aligment_HSC0B_assembly_out.txt
#SBATCH --error=bowtie2_aligment_HSC0B_assembly_error.txt
#SBATCH --mem-per-cpu=14G
#SBATCH --ntasks=20
# time=48:00:00

container1='/home/bioinfo_softwares/bowtie-v2.4.2'
container2='/home/bioinfo_softwares/samtools-v1.9'

# Config
ref_file_input="assembly_HSC0B_mrclsk51spdsK127.fa" # The genome were youl map the reads
wait
ref_file="aligment_assembly_HSC0B"
wait

# Create reference file; Run just once!
singularity exec ${container1} bowtie2-build ${ref_file_input} ${ref_file}
wait

#
bam_output="SAIDA"
wait
p1="HSC_0B_gDNA_1_filtered_paired.fq.gz"
wait
p2="HSC_0B_gDNA_2_filtered_paired.fq.gz"
wait
tag="aligment_HSC0B_0B"
wait
singularity exec ${container1} bowtie2 --very-sensitive --no-discordant -N 0 -L 4 --gbar 10 --threads 20 --un-conc . -x ${ref_file} -1 ${p1} -2 ${p2} | singularity exec ${container2} samtools view -Sb - > aligned.${bam_output}.${tag}.bam
wait
singularity exec ${container2} samtools sort -@ 11 -o aligned.${bam_output}.${tag}.sorted.bam aligned.${bam_output}.${tag}.bam
wait
singularity exec ${container2} samtools index -@ 11 aligned.${bam_output}.${tag}.sorted.bam
wait

#
bam_output="SAIDA"
wait
p1="HSC_1B_gDNA_1_filtered_paired.fq.gz"
wait
p2="HSC_1B_gDNA_2_filtered_paired.fq.gz"
wait
tag="aligment_HSC0B_1B"
wait
singularity exec ${container1} bowtie2 --very-sensitive --no-discordant -N 0 -L 4 --gbar 10 --threads 20 --un-conc . -x ${ref_file} -1 ${p1} -2 ${p2} | singularity exec ${container2} samtools view -Sb - > aligned.${bam_output}.${tag}.bam
wait
singularity exec ${container2} samtools sort -@ 11 -o aligned.${bam_output}.${tag}.sorted.bam aligned.${bam_output}.${tag}.bam
wait
singularity exec ${container2} samtools index -@ 11 aligned.${bam_output}.${tag}.sorted.bam
wait

#
bam_output="SAIDA"
wait
p1="HSC_B1_DOP-PCR_1_filtered_paired.fq.gz"
wait
p2="HSC_B1_DOP-PCR_2_filtered_paired.fq.gz"
wait
tag="aligment_HSC0B_B1"
wait
singularity exec ${container1} bowtie2 --very-sensitive --no-discordant -N 0 -L 4 --gbar 10 --threads 20 --un-conc . -x ${ref_file} -1 ${p1} -2 ${p2} | singularity exec ${container2} samtools view -Sb - > aligned.${bam_output}.${tag}.bam
wait
singularity exec ${container2} samtools sort -@ 11 -o aligned.${bam_output}.${tag}.sorted.bam aligned.${bam_output}.${tag}.bam
wait
singularity exec ${container2} samtools index -@ 11 aligned.${bam_output}.${tag}.sorted.bam
wait

#
bam_output="SAIDA"
wait
p1="HSC_B2_DOP-PCR_1_filtered_paired.fq.gz"
wait
p2="HSC_B2_DOP-PCR_2_filtered_paired.fq.gz"
wait
tag="aligment_HSC0B_B2"
wait
singularity exec ${container1} bowtie2 --very-sensitive --no-discordant -N 0 -L 4 --gbar 10 --threads 20 --un-conc . -x ${ref_file} -1 ${p1} -2 ${p2} | singularity exec ${container2} samtools view -Sb - > aligned.${bam_output}.${tag}.bam
wait
singularity exec ${container2} samtools sort -@ 11 -o aligned.${bam_output}.${tag}.sorted.bam aligned.${bam_output}.${tag}.bam
wait
singularity exec ${container2} samtools index -@ 11 aligned.${bam_output}.${tag}.sorted.bam
wait

#
bam_output="SAIDA"
wait
p1="HSC_Y_DOP-PCR_1_filtered_paired.fq.gz"
wait
p2="HSC_Y_DOP-PCR_2_filtered_paired.fq.gz"
wait
tag="aligment_HSC0B_Y"
wait
singularity exec ${container1} bowtie2 --very-sensitive --no-discordant -N 0 -L 4 --gbar 10 --threads 20 --un-conc . -x ${ref_file} -1 ${p1} -2 ${p2} | singularity exec ${container2} samtools view -Sb - > aligned.${bam_output}.${tag}.bam
wait
singularity exec ${container2} samtools sort -@ 11 -o aligned.${bam_output}.${tag}.sorted.bam aligned.${bam_output}.${tag}.bam
wait
singularity exec ${container2} samtools index -@ 11 aligned.${bam_output}.${tag}.sorted.bam
wait
