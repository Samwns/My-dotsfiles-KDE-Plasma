#!/bin/bash

if [ "$EUID" -eq 0 ]; then
  echo "❌ Por favor, NÃO execute como root. Rode: ./install-arch.sh"
  exit 1
fi

REPO_DIR="$PWD"
echo "🚀 Iniciando instalação completa no Arch/CachyOS..."

echo "📦 Instalando pacotes com yay..."
sudo pacman -Syu --noconfirm
yay -S --needed --noconfirm kitty alacritty btop fastfetch git wget curl micro nano \
    zsh bash-completion wl-clipboard xclip plasma-meta sddm sddm-kcm dolphin konsole ark \
    spectacle gwenview kcalc pipewire pipewire-pulse pipewire-alsa wireplumber bluez bluez-utils \
    bluedevil pavucontrol jdk-openjdk intellij-idea-community-edition dotnet-sdk npm godot \
    android-studio blender unityhub firefox google-chrome discord qbittorrent vlc obs-studio \
    cursor-bin curseforge hydra-launcher-bin

echo "📂 Aplicando suas configurações pessoais..."
[ -d "$REPO_DIR/kitty" ] && cp -a "$REPO_DIR/kitty" ~/.config/
cp "$REPO_DIR/zsh/.zshrc" ~/.zshrc 2>/dev/null
cp "$REPO_DIR/zsh/.p10k.zsh" ~/.p10k.zsh 2>/dev/null
if [ -d "$REPO_DIR/zsh/omz-custom" ]; then
    mkdir -p ~/.oh-my-zsh/custom
    cp -a "$REPO_DIR/zsh/omz-custom/"* ~/.oh-my-zsh/custom/ 2>/dev/null
fi
cp -a "$REPO_DIR/kde/"* ~/.config/ 2>/dev/null
[ -d "$REPO_DIR/kde/share-local" ] && cp -a "$REPO_DIR/kde/share-local/"* ~/.local/share/ 2>/dev/null

echo "⚙️ Aplicando configurações do sistema (SDDM e Plymouth)..."
if [ -d "$REPO_DIR/sddm" ]; then
    [ -f "$REPO_DIR/sddm/sddm.conf" ] && sudo cp "$REPO_DIR/sddm/sddm.conf" /etc/
    [ -d "$REPO_DIR/sddm/sddm.conf.d" ] && sudo cp -r "$REPO_DIR/sddm/sddm.conf.d" /etc/
    [ -d "$REPO_DIR/sddm/themes" ] && sudo cp -r "$REPO_DIR/sddm/themes/"* /usr/share/sddm/themes/
fi
[ -f "$REPO_DIR/plymouth/plymouthd.conf" ] && sudo cp "$REPO_DIR/plymouth/plymouthd.conf" /etc/plymouth/

echo "🐚 Mudando o shell padrão para Zsh..."
sudo chsh -s $(which zsh) $USER
echo "✅ Instalação concluída! Reinicie o computador."
