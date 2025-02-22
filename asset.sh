#!/bin/bash

echo "================================="
echo "   Cytus II DB Build Tool V2.0   "
echo "          A.R.C.  Tech.          "
echo "================================="

# clean
rm -rf ./res/export
rm -rf ./res/unitydata
rm -rf ./res/unitybundles

if [ ! $1 ]; then
  echo "Version not defined!"
  exit
fi

mkdir ./res/export
mkdir ./res/unitydata
mkdir ./res/unitybundles

mkdir ./res/export/audios
mkdir ./res/export/videos
mkdir ./res/export/images
mkdir ./res/export/audios/extra
mkdir ./res/export/audios/story
mkdir ./res/export/videos/extra
mkdir ./res/export/videos/titles
mkdir ./res/export/videos/story
mkdir ./res/export/videos/song_select
mkdir ./res/export/images/characters

echo "Cleaned cache."

# unzip files
unzip -q "./raw/$1.apk" -d ./res/apk
echo "Unziped APK."

unzip -q "./raw/$1.obb" -d ./res/obb
echo "Unziped OBB."

unzip -q "./raw/$1.patch.obb" -d ./res/vid
echo "Unziped Patch OBB."

# move unity
mv ./res/apk/assets/bin/Data/* ./res/unitydata
mv ./res/obb/assets/bin/Data/* ./res/unitydata
echo "Migrated Unity."

# move obb
mv ./res/obb/assets/AssetBundles/* ./res/unitybundles

mv ./res/vid/assets/RawAssets/EndPlay/*     ./res/export/videos
mv ./res/vid/assets/RawAssets/OASystem/*     ./res/export/videos
mv ./res/vid/assets/RawAssets/Story/*    ./res/export/videos
mv ./res/vid/assets/RawAssets/System/*    ./res/export/videos
mv ./res/vid/assets/RawAssets/TrueEnd/*     ./res/export/videos

rm -rf ./res/vid/assets/RawAssets/EndPlay
rm -rf ./res/vid/assets/RawAssets/OASystem
rm -rf ./res/vid/assets/RawAssets/Story
rm -rf ./res/vid/assets/RawAssets/System
rm -rf ./res/vid/assets/RawAssets/TrueEnd

mv ./res/vid/assets/RawAssets/Title/*     ./res/export/videos/titles
mv ./res/vid/assets/RawAssets/SongSelect/*     ./res/export/videos/song_select

rm -rf ./res/vid/assets/RawAssets/Title
rm -rf ./res/vid/assets/RawAssets/SongSelect

cp ./res/export/videos/*.mp4 ./res/export/videos/story

mv ./res/vid/assets/RawAssets/*        ./res/export/videos
echo "Migrated OBB."

# clean source
rm -rf ./res/apk ./res/obb ./res/vid
echo "Finished."
