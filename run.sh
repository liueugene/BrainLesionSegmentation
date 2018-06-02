#!/bin/bash

cd CS_168_Lesion_Data

for numdir in */ ; do
    mritopng -f "$numdir/Features" "$numdir/FeaturesPNG"
    mritopng -f "$numdir/Labels" "$numdir/LabelsPNG"
done
