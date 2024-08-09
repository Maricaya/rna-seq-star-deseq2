#!/bin/bash

# Define the sample name and unit (replace with actual values)
SAMPLE="sample_name"  # Replace with your sample name
UNIT="unit_name"      # Replace with your unit name

# Define input file path
BAM="results/star/${SAMPLE}_${UNIT}/Aligned.sortedByCoord.out.bam"

# Define output file path
STATS="results/qc/rseqc/${SAMPLE}_${UNIT}.stats.txt"
LOG="logs/rseqc/rseqc_stat/${SAMPLE}_${UNIT}.log"

# Create the output directories if they don't exist
mkdir -p $(dirname ${STATS})
mkdir -p $(dirname ${LOG})

# Run bam_stat.py
bam_stat.py -i ${BAM} > ${STATS} 2> ${LOG}
