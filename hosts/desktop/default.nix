{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };

  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };

  services.xserver.xkb = { layout = "us"; variant = ""; };
  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.jack = {
    isNormalUser = true;
    description = "Jack";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "openrazer" ];
  };
  
  programs.zsh.enable = true;

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.pcscd.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.nix-ld.enable = true;
  nixpkgs.hostPlatform = "x86_64-linux";

  environment.systemPackages = with pkgs; [
    kitty waybar wofi hyprpaper libnotify
    neovim wl-clipboard cliphist eww
    hyprpolkitagent git claude-code
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    settings = {
      default-cache-ttl-ssh = 43200;
      max-cache-ttl-ssh = 86400;
    };
  };

  services.openssh.enable = true;
  programs.coolercontrol.enable = true;
  system.stateVersion = "26.05";

  hardware.openrazer.enable = true;
}
