import "themes" as themes;
import "tools" as tools;

export const data = #{
    wallpaper: "~/media/pics/wallpapers/fog-forest.png",
    font: "JetBrainsMono Nerd Font",
    colors: themes::themes.everforest.medium_dark,
    tf: #{
        perf: false,
        viewmodel_fov: 70,
    },
};

export let eggs = #{
    alacritty: #{
        targets: "~/.config/alacritty",
        templates: ["alacritty.toml"],
        enabled: true,
    },
    eww: #{
        targets: "~/.config/eww",
        templates: ["eww.scss"],
        enabled: true,
    },
    fonts: #{
        targets: "~/.local/share/fonts",
        unsafe_shell_hooks: #{
            post_deploy: "fc-cache -fv",
        },
        enabled: true,
    },
    foot: #{
        targets: "~/.config/foot",
        templates: ["foot.ini"],
        enabled: true,
    },
    gtk3: #{
        targets: "~/.config/gtk-3.0",
        enabled: true,
    },
    heroic: #{
        targets: "~/.config/heroic/",
        templates: ["theme/base16.css"],
        strategy: "merge",
        enabled: true,
    },
    hypr: #{
        targets: "~/.config/hypr",
        templates: ["hyprland.conf", "hyprlock.conf"],
        enabled: true,
    },
    icons: #{
        targets: "~/.icons",
        enabled: true,
    },
    nushell: #{
        targets: "~/.config/nushell",
        strategy: "merge",
        enabled: true,
    },
    qt5ct: #{
        targets: "~/.config/qt5ct",
        templates: ["colors/base16-yolk.conf"],
        enabled: true,
    },
    rofi: #{
        targets: "~/.config/rofi",
        templates: ["theme.rasi"],
        enabled: true,
    },
    tf2: #{
        targets: "~/.local/share/Steam/steamapps/common/Team Fortress 2/tf/",
        templates: ["**/*.cfg"],
        strategy: "merge",
        enabled: true,
    },
    tf2_custom_perf: #{
        targets: "~/.local/share/Steam/steamapps/common/Team Fortress 2/tf/custom/",
        enabled: data.tf.perf,
    },
    tf2_custom_visual: #{
        targets: "~/.local/share/Steam/steamapps/common/Team Fortress 2/tf/custom/",
        enabled: !data.tf.perf,
    },
    themes: #{
        targets: "~/.themes",
        enabled: true,
    },
    tmux: #{
        targets: "~/.config/tmux",
        templates: ["tmux.conf"],
        enabled: true,
    },
    zed: #{
        targets: "~/.config/zed",
        enabled: true,
    },
};
