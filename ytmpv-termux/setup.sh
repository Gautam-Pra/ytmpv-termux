#!/data/data/com.termux/files/usr/bin/bash

# Create bin directory if it doesn't exist
mkdir -p $PREFIX/bin

# Link ytmpv script (MPV method)
if [ -f ./bin/ytmpv.sh ]; then
    chmod +x ./bin/ytmpv.sh
    ln -sf $(pwd)/bin/ytmpv.sh $PREFIX/bin/ytmpv
    echo "✅ Installed: ytmpv (MPV method)"
fi

# Link ytvlc script (VLC/termux-open-url method)
if [ -f ./bin/ytvlc.sh ]; then
    chmod +x ./bin/ytvlc.sh
    ln -sf $(pwd)/bin/ytvlc.sh $PREFIX/bin/ytvlc
    echo "✅ Installed: ytvlc (VLC method)"
fi

# Confirm done
echo -e "\n🎉 Setup complete! You can now run:"
echo "👉 ytmpv (for mpv inside Termux)"
echo "👉 ytvlc (to open in VLC or browser)"
