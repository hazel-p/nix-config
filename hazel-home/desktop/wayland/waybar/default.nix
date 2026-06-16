{
  outputs,
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  commonDeps = with pkgs; [coreutils gnugrep systemd];

  # Function to simplify making waybar outputs
  mkScript = {
    name ? "script",
    deps ? [],
    script ? "",
  }:
    lib.getExe (pkgs.writeShellApplication {
      inherit name;
      text = script;
      runtimeInputs = commonDeps ++ deps;
    });

  # Specialized for JSON outputs
  mkScriptJson = {
    name ? "script",
    deps ? [],
    script ? "",
    text ? "",
    tooltip ? "",
    alt ? "",
    class ? "",
    percentage ? "",
  }:
    mkScript {
      inherit name;
      deps = [pkgs.jq] ++ deps;
      script = ''
        ${script}
        jq -cn \
        --arg text "${text}" \
        --arg tooltip "${tooltip}" \
        --arg alt "${alt}" \
        --arg class "${class}" \
        --arg percentage "${percentage}" \
        '{text:$text,tooltip:$tooltip,alt:$alt,class:$class,percentage:$percentage}'
      '';
    };

  hyprland-enabled = config.wayland.windowManager.hyprland.enable;
  mango-enabled = config.wayland.windowManager.mango.enable;
in {
  imports = [./style.nix];

  systemd.user.services.waybar.Unit = {
    StartLimitBurst = 10;
    X-Restart-Triggers = lib.mkForce [];
    X-SwitchMethod = "reload";
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];
    });
    systemd.enable = true;
    settings.primary = {
      exclusive = false;
      passthrough = false;
      height = 30;
      margin = "8";
      position = "top";

      # Module Positions
      modules-left = [
        "custom/menu"
        "custom/currentplayer"
        "custom/player"
      ];

      modules-center =
        []
        ++ (lib.optionals hyprland-enabled ["hyprland/workspaces"])
        ++ (lib.optionals mango-enabled ["ext/workspaces"]);

      modules-right = [
        "tray"
        "pulseaudio"
        "network"
        "battery"
        "clock"
      ];

      # Right Side
      clock = {
        format = "{:%H:%M:%S %y-%m-%d}";
        interval = 1;
        tooltip-format = "<tt>{calendar}</tt>";
      };

      "pulseaudio" = {
        format = "{icon}{format_source}";
        format-bluetooth = "{icon} 󰂯{format_source}";
        format-source = "";
        format-source-muted = " 󰍭";
        format-icons = {
          default-muted = "󰸈";
          default = [
            "󰕿"
            "󰖀"
            "󰖀"
            "󰕾"
          ];
          headphone-muted = "󰟎";
          headphone = "󰋋";
          headset-muted = "󰋐";
          headset = "󰋎";
        };
        on-click = lib.getExe pkgs.pavucontrol;
      };

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = "󰒳";
          deactivated = "󰒲";
        };
      };

      battery = {
        interval = 10;
        format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        format = "{icon}";
        format-charging = "󰂄";
        tooltip-format = "{capacity}% ({time})";
        onclick = "";
      };

      network = {
        interval = 3;
        format-wifi = "󰖩";
        format-ethernet = "󰈀";
        format-disconnected = "";
        tooltip-format = ''
          {essid}
          {ifname}
          {ipaddr}/{cidr}
          Up: {bandwidthUpBits}
          Down: {bandwidthDownBits}'';
      };

      "custom/rfkill" = {
        interval = 3;
        exec-if = mkScript {
          deps = [pkgs.util-linux];
          script = "rfkill list wifi | grep yes -q";
        };
        exec = "echo 󰀝";
      };

      # Center
      "hyprland/workspaces" = {
        format = "{icon}";
        interval = 1;
        format-icons = {
          "active" = "";
          "default" = "";
          "empty" = "";
        };
      };

      # Left Side
      "custom/menu" = {
        return-type = "json";
        exec = mkScriptJson {
          tooltip = "$USER@$HOSTNAME";
          alt = "$(grep LOGO /etc/os-release | cut -d = -f2 | cut -d '\"' -f2)";
        };
        format = "{icon}";
        format-icons = {
          "nix-snowflake" = "";
        };
      };

      "custom/currentplayer" = {
        interval = 2;
        return-type = "json";
        exec = mkScriptJson {
          deps = [pkgs.playerctl];
          script = ''
            all_players=$(playerctl -l 2>/dev/null)
            selected_player="$(playerctl status -f "{{playerName}}" 2>/dev/null || true)"
            clean_player="$(echo "$selected_player" | cut -d '.' -f1)"
          '';
          alt = "$clean_player";
          tooltip = "$all_players";
        };
        format = "{icon}{text}";
        format-icons = {
          "" = " ";
          "Amberol" = "󰽰";
          "ncspot" = "󰓇 ";
          "firefox" = " ";
          "discord" = " 󰙯 ";
        };
      };

      "custom/player" = {
        exec-if = mkScript {
          deps = [pkgs.playerctl];
          script = ''
            selected_player="$(playerctl status -f "{{playerName}}" 2>/dev/null || true)"
            playerctl status -p "$selected_player" 2>/dev/null
          '';
        };
        exec = mkScript {
          deps = [pkgs.playerctl];
          # https://docs.gtk.org/gtk4/class.Label.html#markup-styled-text
          script = ''
            selected_player="$(playerctl status -f "{{playerName}}" 2>/dev/null || true)"
            playerctl metadata -p "$selected_player" --format '{"text": "{{artist}} - {{title}}", "alt": "{{status}}", "tooltip": "{{artist}} - {{title}} ({{album}})"}' | sed 's/&/&amp;/g' | sed 's/</&lt;/g' | sed 's/>/&rt;/g' 2>/dev/null
          '';
        };
        return-type = "json";
        interval = 2;
        max-length = 30;
        format = "{icon} {text}";
        format-icons = {
          "Playing" = "󰐊";
          "Paused" = "󰏤 ";
          "Stopped" = "󰓛";
        };
        on-click = mkScript {
          deps = [pkgs.playerctl];
          script = "playerctl play-pause";
        };
      };
    };
  };
}
