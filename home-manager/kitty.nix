
{

  programs.kitty = {
    enable = true;
    settings = {
        include = "colors.conf";

        shell = "nu";

        confirm_os_window_close = 0;
        
        window_padding_width = "0 20 10"; # top horizontal bottom
    };
  };  
}