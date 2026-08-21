{ config, pkgs, ... }:

{
    programs.zed-editor = {
        userSettings = {
          icon_theme = {
            mode = "dark";
            light = "Zed (Default)";
            dark = "Zed (Default)";
          };
          project_panel = {
            dock = "left";
          };
          cli_default_open_behavior = "new_window";
          agent_servers = {
            claude-acp = {
              type = "registry";
            };
          };
          vim_mode = true;
          ui_font_size = 16;
          buffer_font_size = 15;
          theme = {
            mode = "dark";
            light = "Ayu Light";
            dark = "Ayu Dark";
          };
        };
    };
}
