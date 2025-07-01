#!/bin/bash

# Aktifkan dark mode UI GenieACS secara otomatis
FILE=./dist/app*.js
if [ -f $FILE ]; then
    sed -i 's/theme: "light"/theme: "dark"/g' $FILE
    echo "🌑 Dark mode diaktifkan"
else
    echo "⚠️ File UI tidak ditemukan. Pastikan GenieACS sudah dibuild."
fi
