#!/bin/bash

ProjName="standalone_template"
IwadOnly="n"
echo "Ready to Start."

echo "Step 1: Clean up previous release"
echo "Cleaning up..."
rm -rf build
mkdir build

echo "Step 2: Unpacking iwad for merging"
echo "Unpacking..."
7z/7za x "$ProjName.ipk3" -obuild/data -y
echo "Done unpacking."

echo "Step 3: Merge unpacked iwad with data"
echo "Merging..."
cp -r data/* build/data/

echo "Step 4: Repack everything"
echo "Packing..."
cd build/data
../../7z/7za a -r -ssw -tzip ../"$ProjName.ipk3" "*"
echo "Done packing."

echo "Step 5: Clean up unpacked data"
echo "Cleaning up unpacked data..."
cd ..
rm -rf data

if [ "$IwadOnly" != "y" ]; then
    echo "Step 6: Move ZDoom binaries to build folder"
    echo "Moving UZDoom binaries..."
    cd ..
    cp -r bin/* build/
    echo "Removing files not allowed for commercial distribution..."
    rm build/brightmaps.pk3
    rm build/game_support.pk3
    rm build/game_widescreen_gfx.pk3
fi

echo "Done."