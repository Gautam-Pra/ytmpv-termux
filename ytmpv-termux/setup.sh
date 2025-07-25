#!/data/data/com.termux/files/usr/bin/bash
pkg update -y && pkg install -y python mpv git ffmpeg
pip install --upgrade yt-dlp
mkdir -p ~/bin
cp bin/ytmpv ~/bin/ytmpv
chmod +x ~/bin/ytmpv
if ! grep -q 'export PATH=$HOME/bin:$PATH' ~/.bashrc; then
    echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
fi
echo "✅ Setup complete! Run 'ytmpv' to play YouTube at 1.7x speed."
