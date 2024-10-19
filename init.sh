#!/bin/bash

# Memeriksa apakah argumen diberikan
if [ -z "$1" ]; then
  echo "Penggunaan: $0 <nama_node>"
  exit 1
fi

NODE_NAME="$1"

# Membuat direktori
mkdir -p "vm/$NODE_NAME/config"

# Copy docker-compose
cp docker-compose.yml script/*.sh "vm/$NODE_NAME/"

# Daftar subdirektori
SUBDIRS=(boot cdrom dev etc home lost+found media mnt opt proc root run srv sys tmp usr var)

# Loop untuk membuat subdirektori
for DIR in "${SUBDIRS[@]}"; do
  mkdir -p "vm/$NODE_NAME/data/$DIR"
done
