{inputs, ...}: {
  imports = [
    inputs.mangowm.hmModules.mango
    ./binds.nix
  ];

  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;
    autostart_sh = "
    #TODO THIS 
    ";
    settings = {

    };
  };
}
