#!/bin/bash

#SBATCH --job-name=local_ancestry_inference_chr14_five_ancestries
#SBATCH --output=/home/nathanhe/rfmix2_files/RFMix2_Out/local_ancestry_inference_chr14_five_ancestries.out
#SBATCH --error=/home/nathanhe/rfmix2_files/RFMix2_Out/local_ancestry_inference_chr14_five_ancestries.err

#SBATCH --partition=largemem
#SBATCH --cpus-per-task=1
#SBATCH --mem=20000m
#SBATCH --time=24:00:00

#SBATCH --mail-user=nathanhe@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL

# Set chromosome to 14
CHROMOSOME=14
echo "processing chromosome: ${CHROMOSOME}..."

/home/nathanhe/rfmix2_files/RFMix2_install/rfmix/rfmix -f /home/nathanhe/ffcw_imputed/chr14.dose.vcf.gz \
              -r /home/nathanhe/rfmix2_files/share_to_nathan/reference/HGDP_938_chr14_filtered_phased_Build38_FINAL_UPDATED_removed_oceania_scasia.vcf.gz \
              -m /home/nathanhe/rfmix2_files/share_to_nathan/reference/HGDP_938_SampleAncestry_no_Oceania_CSAsia.txt \
              -g /home/nathanhe/rfmix2_files/genetic_map_hg38_withX_with_chr_no_rate.txt \
              -o /home/nathanhe/rfmix2_files/RFMix2_Out/chr14_result_five_ancestries.rfmix \
              --chromosome=chr14 \
              --node-size=5 \
              --random-seed=20240404