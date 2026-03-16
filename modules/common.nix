{ config, pkgs, ... }:

{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  home.packages = [
    pkgs.ripgrep
    pkgs.fd
    pkgs.nerd-fonts.meslo-lg
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.neovim.enable = true;

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.config/home-manager/dotFiles/nvim";

  programs.kitty = {
        enable = true;
        settings = import "dotFiles/kitty/config.nix"
  }
}

