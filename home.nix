{ pkgs, ... }:
{
	home.username = "retsudev";
	home.homeDirectory = "/home/retsudev";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	home.packages = with pkgs; [
	  nerd-fonts.jetbrains-mono
	];
	fonts,fontconfig.enable = true;

	programs.waybar = {
	  enable = true;
	  settings = {
	    mainBar = {
	      layer = "top";
	      position = "top";
	      height = 30;
	      modules-left = [ "hyprland/workspaces" ];
	      modules-center = [ "clock" ];
	      modules-right = [ "wireplumber" "network" "battery" ];

	      wireplumber = {
	        format = "{volume}% {icon}";
		format-muted = "";
		format-icons = [ "" "" "" ];
	      };
	    };
	  };
	  style = ''
	  * { font-family; "JetBrainsMono Nerd Font"; }
	  '';
	};

	programs.lazygit = {
	  enable = true;
	  settings = {
	    gui.theme.selectedLineBgColor = [ "reverse" ];
	    os.editPreset = "nvim";
	    git.paging = {
	      colorArg = "always";
	      pager = "delta --dark --paging=never";
	    };
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
}
