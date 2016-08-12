#!/usr/bin/env bash
cd ./volumes && find . -name *.lock | sudo xargs -i rm {}