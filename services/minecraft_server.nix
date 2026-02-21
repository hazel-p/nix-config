{
  pkgs,
  inputs,
  ...
}: let
  directory = "/var/lib/minecraft-servers";
in {
  # Using nix-minecraft by Infinidoge
  # Featuring:
  # - Multiple Servers
  # - Declarative mod management

  imports = [inputs.nix-minecraft.nixosModules.minecraft-servers];
  nixpkgs.overlays = [inputs.nix-minecraft.overlay];

  environment.systemPackages = [
    pkgs.lazymc
  ];

  #environment.persistence."/nix/persist".directories = [ directory ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    dataDir = directory;

    servers = {
      hazel-private-server = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_21_11;
        openFirewall = true;

        serverProperties = {
          server-port = 44000;
          gamemode = "survival";
          difficulty = "normal";
          view-distance = 32;
          simulation-distance = 16;
          level-seed = "-lesbian";
          motd = "Hazel's Personal Server";
          white-list = true;
        };
        whitelist = {
          hzl4 = "a7bbac4b-d6f2-425e-a984-82f092b13da3";
          Carpengizmat = "5aff9fb9-f278-4921-a2f8-bab1ab8f3af9";
        };

        jvmOpts = "-Xms20G -Xmx20G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1";

        symlinks.mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
          # Optimisations
          Lithium = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/qvNsoO3l/lithium-fabric-0.21.3%2Bmc1.21.11.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
          FerriteCore = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/uXXizFIs/versions/Ii0gP3D8/ferritecore-8.2.0-fabric.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
          Krypton = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/O9LmWYR7/krypton-0.2.10.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
          C2ME = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/VSNURh3q/versions/olrVZpJd/c2me-fabric-mc1.21.11-0.3.6.0.0.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
          ScalableLux = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/Ps1zyz6x/versions/PV9KcrYQ/ScalableLux-0.1.6%2Bfabric.c25518a-all.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
          Noisium = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/hasdd01q/versions/VyMvRQKq/noisium-fabric-2.8.3%2Bmc1.21.11.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
          DistantHorizons = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/uCdwusMi/versions/GT3Bm3GN/DistantHorizons-2.4.5-b-1.21.11-fabric-neoforge.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };

          # Necessary APIs
          FabricAPI = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/i5tSkVBH/fabric-api-0.141.3%2B1.21.11.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
          ClothConfigAPI = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/9s6osm5g/versions/xuX40TN5/cloth-config-21.11.153-fabric.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
          CristelLib = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/cl223EMc/versions/6vtzWpRI/cristellib-fabric-1.21.11-3.0.4.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
          
          # Worldgen!
          Terralith = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/8oi3bsk5/versions/vGKEdR1w/Terralith_1.21.x_v2.5.9.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
          MoogsStructures = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/1oUDhxuy/versions/HcWRsQG7/moogs_structure_lib-1.1.0-1.21.11-fabric.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
          TownsAndTowers = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/DjLobEOy/versions/vXLcy6ev/t_and_t-fabric-neoforge-1.13.8.jar";
            sha512 = "sha512-LiMEsbF+z5V4Ou6S4m5Uyb+tMlx9/NFN7r+YkSZuspM9sA/3eIXKoIP6qW8JxVHrVvk89zs1d4nLMe2tSTn/6w==";
          };
        });
      };
    };
  };
}
