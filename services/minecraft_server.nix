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
            sha512 = "sha512-KINzkwPwu2AtN5fMYB7YbOaDPl7DE93OZ189avPuakC5sKBtr+OdMI2RlmkyXpXAqv0I14yXrNl2796JnHgQ/Q==";
          };
          FerriteCore = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/uXXizFIs/versions/Ii0gP3D8/ferritecore-8.2.0-fabric.jar";
            sha512 = "sha512-MhCSaoLrMu/ZvOur4vbAU9r1xDN+68bVusupbSg1EK+95kbn4ZV1HeeV7HCi6kT+93y1S/Isjle7gy1iF0GIaQ==";
          };
          Krypton = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/O9LmWYR7/krypton-0.2.10.jar";
            sha512 = "sha512-Tc1yKNGJDd/HjJn/KEtF+c9Aqud+9jWTCOJtBvoNk4NlJVaWr0zBLVJMRsSIbNzRkmjBZaK/Cig1IC/oV9pcqw==";
          };
          C2ME = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/VSNURh3q/versions/olrVZpJd/c2me-fabric-mc1.21.11-0.3.6.0.0.jar";
            sha512 = "sha512-ybERAFcvtxwwgP8RsBFGdiToATuZQqreCaXHfrYrMolme61wUB3eqPNd6wpdJohLefdtTtES0yNCRxynOEt4ig==";
          };
          ScalableLux = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/Ps1zyz6x/versions/PV9KcrYQ/ScalableLux-0.1.6%2Bfabric.c25518a-all.jar";
            sha512 = "sha512-cpUVwedc+NnNcE8Ss0h925Zkz5ko57hbEiicj7vH7YLQIR4YUTdcvVs4WCC0/tvD9hcDj/9eMLMCBHsJNwQq5w==";
          };
          Noisium = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/hasdd01q/versions/bQdp8Lez/noisium-fabric-2.7.0%2Bmc1.21-1.21.1.jar";
            sha512 = "sha512-UBzucejzeV2AOKvIM3K1CVvUan+jMrOCfWuMA117NASc6Qi0PWckQX+OPIWie35i9bKWgTavG4QlAwoETFiDDg==";
          };
          DistantHorizons = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/uCdwusMi/versions/GT3Bm3GN/DistantHorizons-2.4.5-b-1.21.11-fabric-neoforge.jar";
            sha512 = "sha512-qfZz+sH29VS3OUFoy+cm8aFesrvvG2WzyZeYU6+N5wvxOkV8iOvcMLlVoHHVGehsYxzb8d05zat8c7nC1/Fl4Q==";
          };

          # Necessary APIs
          FabricAPI = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/i5tSkVBH/fabric-api-0.141.3%2B1.21.11.jar";
            sha512 = "sha512-wgwBfiPW0ndGkNDdd0zshMFr+sVGHaLZNFoc2V7uSVsZVDM8Qh49HGYYYoTSSkM/awzO2AIfYuC/phfSOE0EcQ==";
          };
          ClothConfigAPI = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/9s6osm5g/versions/xuX40TN5/cloth-config-21.11.153-fabric.jar";
            sha512 = "sha512-j0VUidS3EGnpmFaM9OFFARb0NgpOtIHNiRF/YpxogxZIhs9jygisT8kp3RPRESFSdVpiFtShSY7mQG7xAgk+UQ==";
          };
          CristelLib = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/cl223EMc/versions/6vtzWpRI/cristellib-fabric-1.21.11-3.0.4.jar";
            sha512 = "sha512-QBMFrhR5hkURYVpg1tnXLco0sKWNt6/66x+aVYLq/yS1FulraGvRGY8lFlPHpZgNhqFAf2hKuVLDxF5k+Irmtg==";
          };

          # Worldgen!!
          Terralith = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/8oi3bsk5/versions/TFW9ZxPQ/Terralith_1.21.x_v2.5.14.jar";
            sha512 = "sha512-mKH+ohzL6s3CVy7KUdfw1Qp71B0UCLAe/4617sHNXEbOkNpYmwZS2eKNyyIqvjWjzpcJxsqrTkGF+e5HBhV8jg==";
          };
          MoogsStructures = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/1oUDhxuy/versions/HcWRsQG7/moogs_structure_lib-1.1.0-1.21.11-fabric.jar";
            sha512 = "sha512-Jkrh/cUQqp83/sy+Ae0fYhAypivFGwXTS5fETCnv1LpRH+qns0fep4N6nYeMVr1Tbt86x7TK5avqxtE/VrbCig==";
          };
          TownsAndTowers = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/DjLobEOy/versions/vXLcy6ev/t_and_t-fabric-neoforge-1.13.8.jar";
            sha512 = "sha512-Kue9/qBuJ6Tp2W+7/WQnHEaECsBMzfTE5EBxM8Lj5cIPa1b8yuh6/itbxMnjeiGd4Fyjf9hZYmltsY0YJV5LDA==";
          };
        });

      };
    };
  };
}
