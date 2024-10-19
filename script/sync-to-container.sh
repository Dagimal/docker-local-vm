#!/bin/bash

# Daftar direktori yang ingin dicopy ke container
directories=("bin" "boot" "dev" "etc" "home" "lib" "lib32" "lib64" "libx32" "media" "mnt" "opt" "proc" "root" "run" "sbin" "srv" "sys" "tmp" "usr" "var")

# Hitung total direktori
total=${#directories[@]}

# Loop melalui setiap direktori dan salin dari direktori lokal ke container
for ((i=0; i<total; i++)); do
    dir=${directories[i]}
    echo "Copying $dir to container..."
    
    # Salin dari direktori lokal ke kontainer
    docker cp data/"$dir" local-node1:/
    
    # Hitung progress
    progress=$((i + 1))
    percent=$((progress * 100 / total))
    
    # Tampilkan progress bar
    printf "\rProgress: [%-50s] %d%%" "$(printf '#%.0s' $(seq 1 $((percent / 2))))" "$percent"
done

# New line after completion
echo -e "\nDone!"
