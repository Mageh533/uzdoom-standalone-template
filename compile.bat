@echo off
set ProjName=standalone_template
echo Ready to Start.

echo Step 1: Unpacking iwad for merging
echo Unpacking...
7z\7za.exe x %ProjName%.ipk3 -o build\data -y
echo Done unpacking.

echo Step 2: Merge unpacked iwad with data
echo Merging...
xcopy /E /I data\* build\data\

echo Step 3: Repack everything
echo Packing...
7z\7za.exe a -r -ssw -tzip build\%ProjName%n.ipk3 build\data\*
echo Done packing.

echo Step 4: Replace old version
echo Replacing old version.
cd build
del %ProjName%.pk3
ren %ProjName%n.pk3 %ProjName%.pk3
echo Done replacing.

echo Step 5: Clean up
echo Cleaning up...
rd /S /Q data

echo Done.
pause