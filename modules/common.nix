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
    pkgs.opencode
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.neovim.enable = true;

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.config/home-manager/dotFiles/nvim";

  programs.kitty = {
    enable = true;
    font = {
        package = pkgs.nerd-fonts.meslo-lg;
        name = "MesloLGS Nerd Font Mono";
    };
    themeFile = "Catppuccin-Mocha";
    settings = {
        url_style = "curly";
        enabled_layouts = "splits";
        draw_minimal_borders = true;
        window_padding_width = 2;
        macos_option_as_alt = "left";
        tab_bar_edge = "top";
        tab_bar_style = "powerline";
        background_opacity = 0.98;
        cursor_shape = "beam";
    };
    keybindings = {
        "f5" = "launch --location=vsplit";
        "shift+f5" = "launch --location=vsplit --cwd=current";
        "f6" = "launch --location=hsplit";
        "shift+f6" = "launch --location=hsplit --cwd=current";
        "f4" = "launch --location=split";
        "shift+f4" = "launch --location=split --cwd=current";
        "f7" = "layout_action rotate";
        "shift+up" = "move_window up";
        "shift+left" = "move_window left";
        "shift+right" = "move_window right";
        "shift+down" = "move_window down";
        "alt+h" = "neighboring_window left";
        "alt+l" = "neighboring_window right";
        "alt+k" = "neighboring_window up";
        "alt+j" = "neighboring_window down";
        "kitty_mod+up" = "scroll_line_up";
        "kitty_mod+k" = "scroll_line_up";
        "cmd+k" = "scroll_line_up";
        "cmd+up" = "scroll_line_up";
        "kitty_mod+down" = "scroll_line_down"; 
        "kitty_mod+j" = "scroll_line_down";
        "cmd+j" = "scroll_line_down";
        "cmd+down" = "scroll_line_down";
        "cmd+left" = "send_text all \\x01";
        "cmd+right" = "send_text all \\x05";
        "alt+left" = "send_text all \\x1b\\x62";
        "alt+right" = "send_text all \\x1b\\x66";
    };
  };
}

