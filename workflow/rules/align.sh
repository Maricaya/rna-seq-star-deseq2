#!/bin/bash

# Define the sample name and unit (replace with actual values)
SAMPLE="sample_name"  # Replace with your sample name
UNIT="unit_name"      # Replace with your unit name

# Define input file paths
READS1="path/to/sample_R1.fastq"  # Replace with the actual path
READS2="path/to/sample_R2.fastq"  # Replace with the actual path
INDEX="resources/star_genome"
GTF="resources/genome.gtf"

# Define output file paths
ALN="results/star/${SAMPLE}_${UNIT}/Aligned.sortedByCoord.out.bam"
READS_PER_GENE="results/star/${SAMPLE}_${UNIT}/ReadsPerGene.out.tab"
LOG="logs/star/${SAMPLE}_${UNIT}.log"

# Define parameters
THREADS=24
STAR_PARAMS="--outSAMtype BAM SortedByCoordinate --quantMode GeneCounts --sjdbGTFfile ${GTF} --runThreadN ${THREADS}"

# Create the output directories if they don't exist
mkdir -p $(dirname ${ALN})
mkdir -p $(dirname ${READS_PER_GENE})
mkdir -p $(dirname ${LOG})

# Run STAR
STAR --genomeDir ${INDEX} \
     --readFilesIn ${READS1} ${READS2} \
     ${STAR_PARAMS} \
     --outFileNamePrefix results/star/${SAMPLE}_${UNIT}/ \
     > ${LOG} 2>&1
