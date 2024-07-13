#!/bin/bash

# Memeriksa apakah skrip dijalankan dengan hak akses root
if [ "$EUID" -eq 0 ]; then
    echo "Jangan jalankan skrip ini sebagai root. Jalankan sebagai pengguna biasa."
    exit 1
fi

# Memperbarui daftar paket
echo "Memperbarui daftar paket..."
sudo apt update

# Menginstal software-properties-common
echo "Menginstal software-properties-common..."
sudo apt install software-properties-common -y

# Menambahkan deadsnakes PPA
echo "Menambahkan deadsnakes PPA..."
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update

# Menginstal Python 3.12
echo "Menginstal Python 3.12..."
sudo apt install python3.12 python3.12-venv python3.12-dev -y

# Memverifikasi instalasi
echo "Memverifikasi instalasi Python..."
python --version 