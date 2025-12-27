# Ultimate ZDoom Standalone Template

A starter template made for the latest primary version of the zdoom engine (UZDoom). [Based of Nash standalone template](https://forum.zdoom.org/viewtopic.php?t=70232) with some extras of my own.

## About

If you are someone like me, you probably have a certain love for the Doom engine (including its limitations), and wanted to try to make your own standalone game after making some mods inside ZDoom. If thats the case then this template should help you get started with the absolute bare minimum needed to run under UZDoom with some helpful scripts to build and play your game.

Its a modified version of Nash template but changed to be version control friendly, in fact this is what he recommended when I asked on his discord, since working directly on the ipk3 is bad practice.

If you never touched ZDoom before then I recommend making some basic Doom mods before attempting to make a standalone game. You can find a bunch of resources in the [ZDoom page](https://zdoom.org) to get you started.

## Dependencies

Other than a [UZDoom](https://github.com/UZDoom/UZDoom), there is really no other dependency, however if you want the scripts I made as well as other useful tools for development then I recommend:

- [SLADE3](https://slade.mancubus.net/index.php?page=downloads) (For editing lumps and also map editing)
- [Ultimate Doom Builder](https://ultimatedoombuilder.github.io/) (Good for level editing and better compared to Slade but its only compatible with Windows)
- [7zip](https://www.7-zip.org/) (Used in the compile script to create a proper ipk3 to use standalone)

## Setting up

Either compile your own or [download UZDoom](https://zdoom.org/downloads) binaries and place them under a 'bin' folder from the root directory of this project. This will allow you to compile your project later.

Then you should rename and open up the `standalone_template.ipk3` inside slade and change the IWAD settings to match the name of your game/project. From then on everything else should be worked on from the data folder.

The `start.bat` or `start.sh` should allow you to run the game before compiling. Before using these you should either modify them to include the paths of your UZDoom binaries or setup enviromental variables.

The `compile.bat` or `compile.sh` require you have the console version of 7zip binaries under a `7z` folder in the root of this repo. These should generate a folder that contains your game iwad packaged under a single iwad alongside the UZDoom executable dedicated to only running your game. You can then send that folder to other people so they can run your game. If you would like to only generate the iwad then set the `IwadOnly` variable inside the compile script to `y`.
