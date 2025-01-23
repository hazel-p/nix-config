# Minecraft Server 

{pkgs, inputs, ...}: {
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    dataDir = "/var/lib/minecraft";
    
    servers = {
      hide-and-soc = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_21_1;
        openFirewall = true;
        autoStart = true;

        serverProperties = {
          server-port = 25565;
          gamemode = "spectator";
          difficulty = "normal";
          simulation-distance = 16;
          level-seed = "-2529980149474362834";
          motd = "UoN Hide and Soc Server - no mods required";
          white-list = true;
        };

        whitelist = {
          hzl4 = "a7bbac4b-d6f2-425e-a984-82f092b13da3";
          Poyni = "3dfb2091-cdea-4ffb-bc49-7117454a57ff";
        };

        jvmOpts = "-Xms20G -Xmx20G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1";

        symlinks = {
          # Fetching from the internet
          mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            # Optimisations
              Lithium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/9xfJi96s/lithium-fabric-0.14.3-snapshot%2Bmc1.21.1-build.92.jar";
                sha512 = "sha512-1GpHxKxzcrW65inlkQog7/WzBkBT0kQXYKqMQgldgXOoXW+7Yk/8EMaPyVRXljDFb1XbzzkvsCU7XD/9CW7goA==";
              };
              FerriteCore = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/uXXizFIs/versions/bwKMSBhn/ferritecore-7.0.2-hotfix-fabric.jar";
                sha512 = "sha512-ypdb03CM2W0wzxRHrIiDVyETVi6y3Wl+YMHPOC1rcNCxpRH8v9BCxRss9dX/xxi4R/hF5Mij5CHoye50ERmkIQ==";
              };
              Krypton = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/Acz3ttTp/krypton-0.2.8.jar";
                sha512 = "sha512-X4z5bHm/1NiT8dcNpYLmICa+02r0mn+nseAPtu+yjZrWoe7BRwIElrT+OGk9M/5r/NHuu9k0dWEu5EKQwkg3hA==";
              };
              C2ME = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/VSNURh3q/versions/H5YtgA2t/c2me-fabric-mc1.21.1-0.3.0%2Balpha.0.310.jar";
                sha512 = "sha512-6sjys9MfKWzYTVgjisARsQeuNCj0cKv1Cw7fe2ObomCO4Hi/Uw1IRil8XBREZjWFeMxUYjzufvxD50OBlPhcbQ==";
              };
              ScalableLux = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/Ps1zyz6x/versions/Oh80nTJ5/ScalableLux-0.1.0%2Bfabric.26c6e72-all.jar";
                sha512 = "sha512-WGtF1UKCf2WwjZ7K4sI2cTO3ogTaBkttV43PARlingtZU0MDXoTcSoYlTB4hzWTF7Tk/10ayjVRy8eEZs9CJIw==";
              };
              Noisium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/KuNKN7d2/versions/4sGQgiu2/noisium-fabric-2.3.0%2Bmc1.21-1.21.1.jar";
                sha512 = "sha512-YGunjPfzDZnkF8lqoEL2AMG2Ju2ceDkZSW0TneZQAT8UNPz5NUV4LjiJZgMig3zm6FUw2eGlzCD5rRYTV+3kPg==";
              };

            # Necessary APIs
              FabricAPI = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/biIRIp2X/fabric-api-0.114.0%2B1.21.1.jar"; # 1.21.1
                sha512 = "sha512-cUzi6K09TKcASa53H3F5TFATiveAD9wU0rrGsu9jKse6Ownvx446xCXtIOohftSYJCB5LY/nN8s/SdA1OvivBQ==";
              };
              ClothConfigAPI = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/9s6osm5g/versions/HpMb5wGb/cloth-config-15.0.140-fabric.jar"; # 1.21.1
                sha512 = "sha512-Gz9dtPwdSBcEBT25g31TCRk3S/dRjXzt5gc2DwNIwE/GNHo6csz+81VVnh9K7wtlDNWOXuecc7Ev8PwnRnl6AA==";
              };
              CristelLib = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/cl223EMc/versions/8iGbvXwk/cristellib-fabric-1.2.8.jar"; # 1.21.1
                sha512 = "sha512-w4QPaMADBVd/zTy8WCsx7/rDPl0YugSrrBG+AA1d4AkVhmqGrWlDIxe2dUNcxJf39IElc5hNTJ8oljfc2zheMg==";
              };
              YungsAPI = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/Ua7DFN59/versions/DeaIlZ9A/YungsApi-1.21.1-Fabric-5.1.3.jar"; # 1.21.1
                sha512 = "sha512-SlUYVa9mB4Py4ZTBMyDfBGGes4HHHi0Rlutn/2wmeutDJCCUtepHGoNSOKMQ/MsB7rhqKQ8E0HC9q2G3kJoDEw==";
              };


            # World Generator
              Terralith = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/8oi3bsk5/versions/lQreFvOm/Terralith_1.21.x_v2.5.7.jar"; # 1.21.x
                sha512 = "sha512-Q9QL/o3OYDt8nr63LbOJ4nfNMFVBRik1DyiDpsdkcqiHrDUKldnsVcKK7BZd7nc2QEYstnTNxMPvswCZ80Y7cg==";
              };
              MoogsStructures = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/OQAgZMH1/versions/VYyt5avd/mvs-4.2.8-1.21.jar"; # 1.21.x
                sha512 = "sha512-frxyiotwNGFooTXynXq0ku9TgsVWyzM0zVGF/F84mmb5WPEOzlxcn5oXw1UDJ2f+dPPaVvuB2fKVxXTX9mzOGQ==";
              };
              TownsAndTowers = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/DjLobEOy/versions/MntMLupc/t_and_t-neoforge-fabric-1.13.2.jar"; # 1.21.1
                sha512 = "sha512-55//rzq1VoAnAfai/yhDuKGJTGg2IeY6BdXkzu21+NNuvrF4jpwHaLD+9RaeikuNpvsqKtgp0LCqHLBQQyKlDg==";
              };
              YBDungeons = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/o1C1Dkj5/versions/fQ7EjDPE/YungsBetterDungeons-1.21.1-Fabric-5.1.4.jar"; # 1.21.1
                sha512 = "sha512-ShGxsfhF3dFwnmpsrWxtUENwSvvUuXyyr80xb4/c9uOY+N1VSA0C4yMmrFtJtrJz7JnNKx4xG+0k94bm0XZhLA==";
              };
              YBNetherForts = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/Z2mXHnxP/versions/wWdEPfV3/YungsBetterNetherFortresses-1.21.1-Fabric-3.1.3.jar"; # 1.21.1
                sha512 = "sha512-14f80pQqNbcIDML0evGlGNBknunOK9h1V9AAXmMucfGYWaZ3dUqAmzmdK/Emiwgh00vdBpjYDP2ZAVhqgQB4Jg==";
              };
              YBMineshafts = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/HjmxVlSr/versions/4ybDuGhA/YungsBetterMineshafts-1.21.1-Fabric-5.1.1.jar"; # 1.21.1
                sha512 = "sha512-8ZxT7KxShm9l4Xkfe0bsxo//axkSrEe0K/ZAlwEiYmkccYTqSpXbXnv8/abJUyE43+KeKa9KsQikB4B6jbKAdA==";
              };
              YBOceanMonuments = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/3dT9sgt4/versions/TGK6gpeO/YungsBetterOceanMonuments-1.21.1-Fabric-4.1.2.jar"; # 1.21.1
                sha512 = "sha512-KtVor/4AWqSb4iXKHOQyctdzFA3ucFPuSlmBKIte9+6SU2odBBrj8Atjmd4vSZq9G/kFz7t2TVaamd2bLPiEHw==";
              };
              YBStrongholds = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/kidLKymU/versions/mPpbOC9S/YungsBetterStrongholds-1.21.1-Fabric-5.1.2.jar"; # 1.21.1
                sha512 = "sha512-Rb2do7zqZ1tl+wCCO/SKdmit9485NlVtiPo6CNScJQABQG6UTxv9JjidMycjnmHbRzX9o7lFHsa38KVGdxKqCw==";
              };
              YBWitchHuts = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/t5FRdP87/versions/bdpPtvTn/YungsBetterWitchHuts-1.21.1-Fabric-4.1.1.jar"; # 1.21.1
                sha512 = "sha512-ymdJvQHNW2I9b1hWGlfC4qj3acMeOUf86sIuSV9dpbgD0Fd3xuPhItpAxN1JRE1YqvrOAiCwoxBqW14nZYstnw==";
              };
              YUNGsExtras = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/ZYgyPyfq/versions/aVsikHca/YungsExtras-1.21.1-Fabric-5.1.1.jar"; # 1.21.1
                sha512 = "sha512-pbMoH8SCFnhkdF3zTYDINMQqpDTzcuu2zLDNhKiILONEwkfbWo3qAwD+MO854qhfplAhb/Eq3rbENeGC4K4uVQ==";
              };
              YBJungleTemples = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/z9Ve58Ih/versions/uiGCmR8O/YungsBetterJungleTemples-1.21.1-Fabric-3.1.2.jar"; # 1.21.1
                sha512 = "sha512-CykSYGYH5Ohc2bcTw9CJhsTnZi2olkythtIw7xP1f9U63Ht0RxRduVxsPpyF7bbDoRWp8xJpZYVVd3kuKYdulw==";
              };
              YBDesertTemples = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/XNlO7sBv/versions/wyk3RO8o/YungsBetterDesertTemples-1.21.1-Fabric-4.1.2.jar"; # 1.21.1
                sha512 = "sha512-U++aZ2PDPTZoKPS0NRqSuqaeSArXxtl/Rd8YDpgKMHtYdX5XwbCLZQtAa9qSyOfrWt4EX9tWhl75aos1Rgun6w==";
              };
          });
        };
      };
    };
  };
}
