# Cytus II DB

Knowledge database maintained by A.R.C. 

Cytus II DB currently supports Cytus II version 4.0 from Google Play (Note that there haven't been any story updates since 4.1, and OA support hasn't been added.)

Donate: [爱发电](https://afdian.net/@dtsdao) / [Patreon](https://www.patreon.com/dtsdao).

## Requirements

This program can be executed on Linux. To use it on Windows, simply install WSL (Windows Subsystem for Linux).

These softwares are required:

- Git
- Zip
- Bash
- FFmpeg
- Node.js
- Python 3 with `pydub` and `Pillow`
- [AssetStudio](https://github.com/Perfare/AssetStudio)

## Compile

Compiling is to translate the original files to readable datasheets.

Follow the instruction to compile it.

1. Clone this project with `git`.
2. Put your `.obb` file into `./raw` and rename to `{version}.obb`
3. Put your `.apk` file into `./raw` and rename to `{version}.apk`
4. Execute `./asset.sh {version}`
5. Use AssetStudio to export files as below
6. Execute `./build.sh {version} dist`

## Usage

Type the following commands in the shell and then you can view the database at [localhost:8080](http://localhost:8080).

1. `cd web`
2. `npm run serve`

## Clean

If you you want a fresh start, execute `./clean.sh`

Remember, converting audios needs a long time, so keep your cache as possible.

You can delete the cache of any module as you wish. They are stored in `./res/converted/*` and `./res/cache_*.json`.

## Export Instruction

1.  Enable the following options in `Options` menu.
- `Display all assets`
- `Display asset information(original name)`
- `Convert Texture2D(PNG)`
- `Group > container path`
2.  Load folder `./res/unitybundles`
3.  Filter `AudioClip`, `TextAsset`, `Sprite`
4.  `Export > Filtered assets` to `./res/export`
5.  Options: Group assets by `do not group`
6.  Export `AudioClip` : `story_*`, `*bossstage` to `./res/export/audios/story`
7.  Load folder `./res/unitydata`
8.  Export `Sprite` : `{character}_s` to `./res/export/images/characters`
9.  Export `AudioClip` : `title*`, `ending*`, `{character}_*` to `./res/export/audios/extra`

## Deploy To Github Pages

Make sure you have added your ssh keys to your Github account.

To deploy, edit `./deploy.sh` and execute it.

## Announcement

**None of the repo, the tool, nor the repo owner is affiliated with, or sponsored or authorized by, Rayark Inc. or its affiliates.**
