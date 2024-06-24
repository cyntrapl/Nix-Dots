{ pkgs, lib, ...}:
{
  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.9";
    };

    theme = "Grape";
  };
}
