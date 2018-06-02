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
