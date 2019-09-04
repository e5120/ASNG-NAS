#!/bin/bash

module load singularity/3.2.1
. ./var

src_dir=${root_dir}
export SINGULARITY_BIND="${src_dir}:${home_dir}"

singularity shell --cleanenv \
                  --home ${home_dir} \
                  ${env_dir}/environment.sif
#                  --overlay ${overlay} \
