{ pkgs, inputs, ... }:
{
	home.username = "retsudev";
	home.homeDirectory = "/home/retsudev";
	home.stateVersion = "26.05";

	imports = [ inputs.lazyvim.homeManagerModules.default ];
	
	programs.home-manager.enable = true;

	catppuccin = {
	  enable = true;
	  autoEnable = true;
	};

	home.packages = with pkgs; [
	  nerd-fonts.jetbrains-mono
	];
	fonts.fontconfig.enable = true;

	programs.waybar = {
	  enable = true;

	  settings = {
	    mainBar = {
	      layer = "top";
	      position = "top";
	      height = 34;

	      modules-left = [ "hyprland/workspaces" ];
	      modules-center = [ "clock" ];
	      modules-right = [ "network" "battery" ];

	      "hyprland/workspaces" = {
		format = "{icon}";
		on-click = "activate";
		format-icons = {
		  active = "";
		  default = "";
		};
	      };

	      "clock" = {
		format = "{:%H:%M}";
		tooltip-format = "{:%A, %d %B %Y}";
	      };

	      "network" = {
		format-wifi = "  {essid}";
		format-ethernet = "  {ipaddr}";
		format-disconnected = "⚠ disconnected";
		tooltip-format = "{ifname}: {ipaddr}/{cidr}";
	      };

	      "battery" = {
		format = "{icon}  {capacity}%";
		format-icons = [ "" "" "" "" "" ];
		format-charging = "  {capacity}%";
		states = {
		  warning = 20;
		  critical = 10;
		};
	      };
	    };
	  };

	  style = ''
	    @import "catppuccin.css";

	    * {
	      font-family: "JetBrainsMono Nerd Font";
	      font-size: 14px;
	      min-height: 0;
	    }

	    window#waybar {
	      background-color: @base;
	      color: @text;
	    }

	    #workspaces button {
	      color: @subtext0;
	      padding: 0 6px;
	    }

	    #workspaces button.active {
	      color: @mauve;
	    }

	    #clock {
	      color: @text;
	      font-weight: bold;
	    }

	    #network, #battery {
	      padding: 0 10px;
	      color: @text;
	    }

	    #battery.warning {
	      color: @peach;
	    }

	    #battery.critical {
	      color: @red;
	    }
	  '';
	};

	catppuccin.waybar.mode = "createLink";
		
	programs.kitty = {
	  enable = true;
	};


	programs.lazygit = {
	  enable = true;
	  settings = {
	    os.editPreset = "nvim";
	  };
	};

	programs.git = {
	  enable = true;
	  settings = { 
	    user = {
	      name = "retsudev";
	      email = "gamershpw@gmail.com";
	    };
	    init.defaultBranch = "main";
	    credential.helper = "store";
	  };
	};
	
	programs.lazyvim = {
	  enable = true;

	  plugins.colorscheme = ''
	    return {
	      "catppuccin/nvim",
	      opts = { flavour = "mocha" },
	    }
	  '';

	  extras.lang.nix.enable = true;
	  extraPackages = with pkgs; [ nixd alejandra ];
	};
}
