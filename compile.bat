@echo off
set ProjName=standalone_template
set IwadOnly=n
echo Ready to Start.

echo Step 1: Clean up previous release
echo Cleaning up...
rd /s /q build
mkdir build

echo Step 2: Unpacking iwad for merging
echo Unpacking...
7z\7za.exe x %ProjName%.ipk3 -obuild\data -y
echo Done unpacking.

echo Step 3: Merge unpacked iwad with data
echo Merging...
xcopy /E /I data\* build\data\

echo Step 4: Repack everything
echo Packing...
cd build\data
..\..\7z\7za.exe a -r -ssw -tzip ..\%ProjName%.ipk3 "*"
echo Done packing.

echo Step 5: Clean up unpacked data
echo Cleaning up unpacked data...
cd ..
rd /s /q data

if NOT "%IwadOnly%"=="y" (
    echo Step 6: Move ZDoom binaries to build folder
    echo Moving UZDoom binaries...
    cd ..
    xcopy bin\* build\
)

echo Done.
pause