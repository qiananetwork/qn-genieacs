# INSTALL GENIEACS OTOMATIS

Auto installer untuk GenieACS + Logo Custom + Dark Mode + Auto Restart Service

## 📥 Cara Instalasi

```bash
apt install git curl -y
git clone https://github.com/qiananetwork/genieacs.git
cd genieacs
chmod +x install.sh darkmode.sh
./install.sh
```

## 🌐 Akses

Setelah selesai, buka:
```
http://localhost:3000
```

## 💡 Fitur
- Logo Qiana Network
- Dark mode UI aktif otomatis
- Service GenieACS auto restart saat reboot/error
- Cek status: `sudo systemctl status genieacs`
- Cek log: `journalctl -u genieacs -f`
