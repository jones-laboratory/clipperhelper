#!/bin/bash
#SBATCH --job-name=clipperhelper
#SBATCH --output=clipperhelper_%j.out
#SBATCH --error=clipperhelper_%j.err
#SBATCH --time=03:00:00
#SBATCH --mem=8G
#SBATCH --cpus-per-task=2
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=jones.jeffrey@ufl.edu

set -euo pipefail

module purge 
ml conda
conda activate clipperhelper

# Go to clipperhelper directory
cd /blue/jones.jeffrey/jones.jeffrey/scripts/clipper_helper

# Run clipperhelper
python make_custom_species_files.py \
    --gtf /blue/jones.jeffrey/genomes/hg38/annotation/gencode.v38.annotation.gtf \
    --species hg38.clipper
