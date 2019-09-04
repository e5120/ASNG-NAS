#!/bin/sh
##n current working directory
#$ -cwd
## type    cpu core  memory  gpu
## f_node     28      240     4
## h_node     14      120     2
## q_node     7       120     1
## s_core     1       7.5     0
## q_core     4       30      0
## s_gpu      2       15      1
#$ -l s_gpu=1
## maximum run time
#$ -l h_rt=10:00:00
## output filename
#$ -N asng-nas
#$ -o logs/
#$ -e logs/

. /etc/profile.d/modules.sh
module load singularity/3.2.1
module load intel
module load cuda/9.2.148
module load openmpi

. ./var

# [classification|inpainting|toy]
src_dir=${root_dir}/classification

#if [ ! -e ${overlay} ]; then
#  dd if=/dev/zero of=${overlay} bs=1M count=100 && /sbin/mkfs.ext3 ${overlay}
#fi

export SINGULARITY_BIND="${src_dir}:${home_dir},${data_dir}:/mnt"

## program file to run
singularity exec --cleanenv \
                 --nv \
                 --home ${home_dir} \
                 ${env_dir}/environment.sif \
                 bash classification.sh
#                 --overlay ${overlay} \
