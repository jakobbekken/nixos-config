#! /bin/sh

cd "$(dirname "$0")"

rm -r ./nixos/*
rm -r ./home-manager/*
rm -r ./wallpapers

cp -R /etc/nixos/. ./nixos/
cp -R $HOME/.config/home-manager/. ./home-manager/
cp -R $HOME/Pictures/wallpapers/. ./wallpapers/

echo "Copied files over"
