#! /bin/sh

cd "$(dirname "$0")"

rm -r ./nixos/*
rm -r ./home-manager/*

cp -R /etc/nixos/. ./nixos/
cp -R $HOME/.config/home-manager/. ./home-manager/

echo "Copied files over"
