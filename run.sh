#!/bin/bash

mkdir FeaturesPNG
mkdir LabelsPNG

for numdir in CS_168_Lesion_Data/*/ ; do
    number=$(basename $numdir)
    
    for filepath in ${numdir}/Features/* ; do
        filename=$(basename $filepath)
        mritopng $filepath "FeaturesPNG/${number}_${filename}.png"
    done
    
    for filepath in ${numdir}/Labels/* ; do
        filename=$(basename $filepath)
        mritopng $filepath "LabelsPNG/${number}_${filename}.png"
    done
done

python tools/process.py --input_dir FeaturesPNG --b_dir LabelsPNG --operation combine --output_dir mridataset
python pix2pix.py --mode train --output_dir mritrain --max_epochs 200 --input_dir mridataset --which_direction AtoB
python pix2pix.py --mode test --output_dir mritestoutput --input_dir mritestinput --checkpoint mritrain