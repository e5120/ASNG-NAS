#!/bin/bash

source activate env36

python ${HOME}/main_inpainting_cat.py \
       -d celebA \
       -p /mnt/ \
       -c Center \
       -g 0 \
       -o ./result/

source deactivate
