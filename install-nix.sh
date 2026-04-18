#!/bin/bash

if [ "$EUID" -eq 0 ]; then
  echo "❌ Por favor, NÃO execute como root. Rode: ./install-nix.sh"
  exit 1
fi

REPO_DIR="$PWD"
echo "🚀 Iniciando instalação e automação do NixOS..."

echo "⚙️ Gerando configuração do sistema..."
sudo bash -c "cat << 'EOF' > /etc/nixos/meu-setup.nix
{ config, pkgs, ... }:
{
  time.timeZone = \"America/Sao_Paulo\";
  i18n.defaultLocale = \"pt_BR.UTF-8\";
  console.keyMap = \"br-abnt2\";

  hardware.graphics = { enable = true; enable32Bit = true; };
  services.xserver.videoDrivers = [ \"amdgpu\" ];

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  security.rtkit.enable = true;
  services.pipewire = { enable = true; alsa.enable = true; alsa.support32Bit = true; pulse.enable = true; };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    kitty alacritty btop fastfetch git wget curl micro zsh wl-clipboard
    godot_4 blender jdk jetbrains.idea-community android-studio code-cursor dotnet-sdk nodejs
    firefox google-chrome discord qbittorrent vlc obs-studio prismlauncher curseforge
  ];

  programs.zsh.enable = true;
}
EOF"

if ! grep -q "meu-setup.nix" /etc/nixos/configuration.nix; then
    sudo sed -i 's/imports = \[/imports = \[ \.\/meu-setup.nix /' /etc/nixos/configuration.nix
fi

echo "📦 Instalando o NixOS (Baixando pacotes...)"
sudo nixos-rebuild switch

echo "📂 Aplicando suas configurações pessoais (Plasma, Kitty, Zsh)..."
mkdir -p ~/.config
[ -d "$REPO_DIR/kitty" ] && cp -a "$REPO_DIR/kitty" ~/.config/
cp "$REPO_DIR/zsh/.zshrc" ~/.zshrc 2>/dev/null
cp "$REPO_DIR/zsh/.p10k.zsh" ~/.p10k.zsh 2>/dev/null
if [ -d "$REPO_DIR/zsh/omz-custom" ]; then
    mkdir -p ~/.oh-my-zsh/custom
    cp -a "$REPO_DIR/zsh/omz-custom/"* ~/.oh-my-zsh/custom/ 2>/dev/null
fi
cp -a "$REPO_DIR/kde/"* ~/.config/ 2>/dev/null
[ -d "$REPO_DIR/kde/share-local" ] && cp -a "$REPO_DIR/kde/share-local/"* ~/.local/share/ 2>/dev/null

echo "✅ Instalação do NixOS concluída!"
