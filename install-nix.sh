#!/bin/bash

# Define que o script vai parar imediatamente se ocorrer algum erro crítico
set -e

if [ "$EUID" -eq 0 ]; then
  echo "❌ Por favor, não rode o script como root (não use sudo ./install-nix.sh)."
  echo "O script vai pedir sua senha apenas quando for necessário."
  exit 1
fi

REPO_DIR="$PWD"
echo "🚀 Iniciando setup do NixOS (Plasma 6 + CachyOS Kernel + Dotfiles)"

# =========================
# 1. GERANDO A CONFIGURAÇÃO NIX
# =========================
echo "📝 Criando a receita do sistema (meu-setup.nix)..."

sudo bash -c "cat << 'EOF' > /etc/nixos/meu-setup.nix
{ config, pkgs, ... }:

{
  # Fuso horário e Idioma
  time.timeZone = \"America/Sao_Paulo\";
  i18n.defaultLocale = \"pt_BR.UTF-8\";

  # 🏎️ Kernel do CachyOS para máxima performance
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  # Interface Gráfica (Wayland + Plasma 6 + SDDM)
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Drivers de Vídeo e Áudio
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Permitir pacotes proprietários (Discord, Chrome, etc)
  nixpkgs.config.allowUnfree = true;

  # 📦 Seus Pacotes (Traduzidos da lista do Arch)
  environment.systemPackages = with pkgs; [
    # Terminal e CLI
    kitty zsh fastfetch btop micro nano
    git wget curl unzip unrar
    wl-clipboard xclip xsel
    
    # Utilitários do KDE (Muitos já vêm com o Plasma, estes são extras úteis)
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.filelight
    kdePackages.spectacle
    kdePackages.yakuake

    # Internet e Mídia
    firefox google-chrome vlc qbittorrent discord
    obs-studio
    
    # Desenvolvimento (Java, C#, Godot)
    intellij-idea-community-edition
    vscode
    android-studio
    dotnet-sdk
    godot_4
    blender
    
    # Jogos
    prismlauncher # Melhor launcher de Minecraft para NixOS
    unityhub
  ];

  # Habilitar o Zsh no sistema
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Fontes
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
  ];
}
EOF"

# =========================
# 2. INJETANDO NO CONFIGURATION.NIX
# =========================
echo "🔗 Conectando o setup ao sistema principal..."
if ! grep -q "meu-setup.nix" /etc/nixos/configuration.nix; then
  sudo sed -i 's/imports = \[/imports = \[ \.\/meu-setup.nix /' /etc/nixos/configuration.nix
  echo "✅ Importação concluída."
else
  echo "⚡ O import já existe, pulando..."
fi

# =========================
# 3. BUILD DO SISTEMA (A Mágica do NixOS)
# =========================
echo "⚙️ Construindo o NixOS... (Isso pode demorar um pouco)"
# Desativamos o 'set -e' temporariamente caso o rebuild dê um aviso não-crítico
set +e 
sudo nixos-rebuild switch
if [ $? -ne 0 ]; then
  echo "❌ Falha no rebuild do NixOS! Verifique as mensagens de erro acima."
  exit 1
fi
set -e
echo "✅ Sistema atualizado com sucesso!"

# =========================
# 4. APLICANDO SEUS DOTFILES (Pastas Home)
# =========================
echo "📂 Restaurando seus arquivos pessoais..."

# ZSH
echo "🐚 Configurando Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Baixando Oh-My-Zsh..."
  git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
fi
cp "$REPO_DIR/zsh/.zshrc" ~/.zshrc 2>/dev/null || true
cp "$REPO_DIR/zsh/.p10k.zsh" ~/.p10k.zsh 2>/dev/null || true
mkdir -p ~/.oh-my-zsh/custom/
cp -r "$REPO_DIR/zsh/omz-custom/"* ~/.oh-my-zsh/custom/ 2>/dev/null || true

# KITTY
echo "🐱 Configurando Kitty..."
mkdir -p ~/.config
cp -r "$REPO_DIR/kitty" ~/.config/ 2>/dev/null || true

# FONTES
echo "🔤 Instalando fontes extras do repositório..."
mkdir -p ~/.local/share/fonts
cp -r "$REPO_DIR/fonts/"* ~/.local/share/fonts/ 2>/dev/null || true
fc-cache -fv

# KDE PLASMA 6
echo "🎨 Restaurando configurações do Plasma 6..."
mkdir -p ~/.config
mkdir -p ~/.local/share

# Copia os .rc e o appletsrc
cp "$REPO_DIR/kde/"*.rc ~/.config/ 2>/dev/null || true
cp "$REPO_DIR/kde/plasma-org.kde.plasma.desktop-appletsrc" ~/.config/ 2>/dev/null || true

# Copia a pasta share (temas, auroras, etc)
cp -r "$REPO_DIR/kde/share/"* ~/.local/share/ 2>/dev/null || true

# =========================
# 5. FINALIZAÇÃO
# =========================
echo "🔄 Reiniciando a interface gráfica para aplicar as mudanças..."
kquitapp6 plasmashell 2>/dev/null || true
plasmashell & disown

echo "🎉 Tudo pronto! O seu NixOS está configurado e seguro."