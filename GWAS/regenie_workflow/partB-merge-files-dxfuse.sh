#!/bin/sh
set -e
set -x

echo "first code"
run_merge="cp /mnt/project/Bulk/Genotype\ Results/Genotype\ calls/ukb22418_c{1..22}_b0_v2* .; ls *.bed | sed -e 's/.bed//g' > files_to_merge.txt; \
        plink --merge-list files_to_merge.txt --make-bed --autosome-xy --out ukb22418_c1_22_v2_merged; rm files_to_merge.txt;"
echo "second code"
dx run swiss-army-knife -iin="/Data/main_wes_450k.phe" \
   -icmd="${run_merge}" --tag="Step1" --instance-type "mem1_ssd1_v2_x16" --destination="/Data/" --brief --yes

