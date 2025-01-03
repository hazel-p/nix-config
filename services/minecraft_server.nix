# Minecraft Server 

{ pkgs, lib, …}: {
  services.minecraft = {
    enable = true;
    eula = true;
    declarative = true;
 
    package = pkgs.papermcServers.papermc-1_20_6;
 
    serverProperties = {
      gamemode = “survival”;
      difficulty = “normal”;
      simulation-distance = 10;
      level-seed = “hideandsoc”;
    };
 
    whitelist = {
      ShoQ_ = “a7bbac4b-d6f2-425e-a984-82f092b13da3”;
    };
 
    jvmOpts = “-Xms4092M -Xmx4092M -XX:+UseG1GC”;
  };
}
