#!/bin/bash

if [ "$EUID" -eq 0 ]; then
  echo "❌ Não roda como root"
  exit 1
fi

REPO_DIR="$PWD"
echo "🚀 Instalando NixOS (setup limpo)"

# =========================
# CONFIG NIX
# =========================
sudo bash -c "cat << 'EOF' > /etc/nixos/meu-setup.nix
{ config, pkgs, ... }:

{
  time.timeZone = \"America/Sao_Paulo\";
  i18n.defaultLocale = \"pt_BR.UTF-8\";

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git wget curl micro nano
    kitty zsh fastfetch btop
    firefox vlc
    kdePackages.konsole
    kdePackages.dolphin
  ];

  programs.zsh.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
  ];
}
EOF"

# =========================
# IMPORT
# =========================
if ! grep -q "meu-setup.nix" /etc/nixos/configuration.nix; then
  sudo sed -i 's/imports = \[/imports = \[ \.\/meu-setup.nix /' /etc/nixos/configuration.nix
fi

# =========================
# BUILD
# =========================
sudo nixos-rebuild switch || exit 1

# =========================
# ZSH
# =========================
echo "🐚 Zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
fi

cp "$REPO_DIR/zsh/.zshrc" ~/.zshrc 2>/dev/null
cp "$REPO_DIR/zsh/.p10k.zsh" ~/.p10k.zsh 2>/dev/null
cp -r "$REPO_DIR/zsh/omz-custom/"* ~/.oh-my-zsh/custom/ 2>/dev/null

# =========================
# KITTY
# =========================
echo "🐱 Kitty..."
mkdir -p ~/.config
cp -r "$REPO_DIR/kitty" ~/.config/ 2>/dev/null

# =========================
# KDE
# =========================
echo "🎨 KDE..."
mkdir -p ~/.config
mkdir -p ~/.local/share

cp "$REPO_DIR/kde/"*.rc ~/.config/ 2>/dev/null
cp "$REPO_DIR/kde/plasma-org.kde.plasma.desktop-appletsrc" ~/.config/ 2>/dev/null

cp -r "$REPO_DIR/kde/share/"* ~/.local/share/ 2>/dev/null

# reinicia plasma
kquitapp6 plasmashell 2>/dev/null
plasmashell &

# =========================
# FONTES
# =========================
echo "🔤 Fonts..."
mkdir -p ~/.local/share/fonts
cp -r "$REPO_DIR/fonts/"* ~/.local/share/fonts/ 2>/dev/null

fc-cache -fv

# =========================
# SDDM
# =========================
if [ -d "$REPO_DIR/sddm" ]; then
  echo "🔐 SDDM..."
  sudo cp "$REPO_DIR/sddm/sddm.conf" /etc/ 2>/dev/null
  sudo cp -r "$REPO_DIR/sddm/"* /usr/share/sddm/themes/ 2>/dev/null
fi

echo "✅ Tudo pronto. Reinicia."