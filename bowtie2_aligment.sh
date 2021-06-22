#!/bin/bash
# bowtie2_aligment
#
# Submit this script with: sbatch [bowtie2_aligment.sh]
#
#SBATCH --job-name=bowtie2_aligment
#SBATCH --output=bowtie2_aligment_out.txt
#SBATCH --error=bowtie2_aligment_error.txt
#SBATCH --mem-per-cpu=14G
#SBATCH --ntasks=20
# time=48:00:00

# Path to softwares 
path_bowtie2="/bowtie-v2.4.2"
path_samtools="/samtools-v1.9"

# Configuration
ref_file_input="assembly.fa" # The genome where you will map the reads
wait
ref_file="aligment_assembly" # The genome name
wait

# Create reference file, run just once!
${path_bowtie2} bowtie2-build ${ref_file_input} ${ref_file}
wait

#
bam_output="output"
wait
p1="gDNA_r1_filtered_reads.fq.gz"
wait
p2="gDNA_r2_filtered_reads.fq.gz"
wait
tag="aligment_assembly_gDNA"
wait
${path_bowtie2} bowtie2 --very-sensitive --no-discordant -N 0 -L 4 --gbar 10 --threads 20 --un-conc . -x ${ref_file} -1 ${p1} -2 ${p2} | ${path_samtools} samtools view -Sb - > aligned.${bam_output}.${tag}.bam
wait
${path_samtools} samtools sort -@ 11 -o aligned.${bam_output}.${tag}.sorted.bam aligned.${bam_output}.${tag}.bam
wait
${path_samtools} samtools index -@ 11 aligned.${bam_output}.${tag}.sorted.bam
wait

#
bam_output="output"
wait
p1="Probe_r1_filtered_reads.fq.gz"
wait
p2="Probe_r2_filtered_reads.fq.gz"
wait
tag="aligment_assembly_Probe"
wait
${path_bowtie2} bowtie2 --very-sensitive --no-discordant -N 0 -L 4 --gbar 10 --threads 20 --un-conc . -x ${ref_file} -1 ${p1} -2 ${p2} | ${path_samtools} samtools view -Sb - > aligned.${bam_output}.${tag}.bam
wait
${path_samtools} samtools sort -@ 11 -o aligned.${bam_output}.${tag}.sorted.bam aligned.${bam_output}.${tag}.bam
wait
${path_samtools} samtools index -@ 11 aligned.${bam_output}.${tag}.sorted.bam
wait
