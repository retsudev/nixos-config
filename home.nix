{ pkgs, ... }:
{
	home.username = "retsudev";
	home.homeDirectory = "/home/retsudev";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	programs.git = {
	  enable = true;
	  userName = "retsudev";
	  userEmail = "gamershpw@gmail.com";
	  extraConfig = {
	    init.defaultBranch = "main";
	    credential.helper = "store";
	  };
	};
}
