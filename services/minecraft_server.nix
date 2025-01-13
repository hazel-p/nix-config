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
          gamemode = "creative";
          difficulty = "normal";
          simulation-distance = 10;
          level-seed = "hideandsoc";
          motd = "Welcome to Hide and Soc";
          white-list = true;
        };

        whitelist = {
          hzl4 = "a7bbac4b-d6f2-425e-a984-82f092b13da3";
          Poyni = "3dfb2091-cdea-4ffb-bc49-7117454a57ff";
        };

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

            # Fabric API
              FabricAPI = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/biIRIp2X/fabric-api-0.114.0%2B1.21.1.jar"; # 1.21.1
                sha512 = "sha512-cUzi6K09TKcASa53H3F5TFATiveAD9wU0rrGsu9jKse6Ownvx446xCXtIOohftSYJCB5LY/nN8s/SdA1OvivBQ==";
              };

            # Terrain Generator
              Terralith = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/8oi3bsk5/versions/lQreFvOm/Terralith_1.21.x_v2.5.7.jar"; # 1.21.x
                sha512 = "sha512-Q9QL/o3OYDt8nr63LbOJ4nfNMFVBRik1DyiDpsdkcqiHrDUKldnsVcKK7BZd7nc2QEYstnTNxMPvswCZ80Y7cg==";
              };
          });
        };

        jvmOpts = "-Xms4096M -Xmx4096M -XX:+UseG1GC";
      };

    };
  };
}
