#!/bin/bash

# Define the sample name and adapter sequence
SAMPLE="sample_name"  # Replace with your sample name
READS="data/${SAMPLE}_reads.fastq"
TRIMMED="results/${SAMPLE}_trimmed.fastq"
ADAPTER="ADAPTER_SEQUENCE"  # Replace with your adapter sequence
LOG="logs/cutadapt/${SAMPLE}.log"

# Create the output directories if they don't exist
mkdir -p $(dirname ${TRIMMED})
mkdir -p $(dirname ${LOG})

# Run cutadapt
cutadapt -a ${ADAPTER} -o ${TRIMMED} ${READS} > ${LOG} 2>&1
