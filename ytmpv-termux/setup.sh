#!/data/data/com.termux/files/usr/bin/bash

echo -e "\n🔄 Updating Termux packages..."
pkg update -y && pkg upgrade -y

echo -e "\n📦 Installing dependencies..."
pkg install -y python mpv ffmpeg git curl

echo -e "\n🐍 Installing yt-dlp via pip..."
pip install --upgrade pip
pip install --upgrade yt-dlp

# Create ~/bin if not exists and ensure it's in PATH
mkdir -p $PREFIX/bin
if ! echo $PATH | grep -q "$PREFIX/bin"; then
    echo 'export PATH=$PREFIX/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
fi

# Install ytmpv (MPV method)
if [ -f ./bin/ytmpv.sh ]; then
    chmod +x ./bin/ytmpv.sh
    ln -sf $(pwd)/bin/ytmpv.sh $PREFIX/bin/ytmpv
    echo "✅ Installed: ytmpv (MPV method)"
fi

# Install ytvlc (termux-open-url method)
if [ -f ./bin/ytvlc.sh ]; then
    chmod +x ./bin/ytvlc.sh
    ln -sf $(pwd)/bin/ytvlc.sh $PREFIX/bin/ytvlc
    echo "✅ Installed: ytvlc (VLC/external method)"
fi

echo -e "\n🎉 Setup complete! You can now run:"
echo "👉 ytmpv  - plays in MPV (if supported)"
echo "👉 ytvlc  - opens stream in VLC or browser"
