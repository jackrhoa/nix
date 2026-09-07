{
  programs.hyprlock = {
    enable = true;
    settings ={ 
      background = [{ 
        blur_passes=0;
        path="screenshot";
        color = "rgba(25, 20, 20, 1.0)";
        }];

      # input-field = [{ }];
    };
  };

}
