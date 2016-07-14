#!/usr/bin/env bash
# Everything that is in A will be added to B:
# A => B
sudo rsync -az /home/path/folder1/ /home/path/folder2
sudo rsync --dry-run -az /home/path/folder1/ /home/path/folder2