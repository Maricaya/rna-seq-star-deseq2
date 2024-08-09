#!/bin/bash

# Define the sample name and adapter sequences
SAMPLE="sample_name"  # Replace with your sample name
READS1="data/${SAMPLE}_R1.fastq"
READS2="data/${SAMPLE}_R2.fastq"
TRIMMED1="results/${SAMPLE}_R1_trimmed.fastq"
TRIMMED2="results/${SAMPLE}_R2_trimmed.fastq"
ADAPTER1="ADAPTER_SEQUENCE_R1"  # Replace with your adapter sequence for R1
ADAPTER2="ADAPTER_SEQUENCE_R2"  # Replace with your adapter sequence for R2
LOG="logs/cutadapt/${SAMPLE}.log"

# Create the output directories if they don't exist
mkdir -p $(dirname ${TRIMMED1})
mkdir -p $(dirname ${TRIMMED2})
mkdir -p $(dirname ${LOG})

# Run cutadapt
cutadapt -a ${ADAPTER1} -A ${ADAPTER2} -o ${TRIMMED1} -p ${TRIMMED2} ${READS1} ${READS2} > ${LOG} 2>&1
