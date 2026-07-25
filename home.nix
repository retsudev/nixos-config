{ pkgs, ... }:
{
	home.username = "retsudev";
	home.homeDirectory = "/home/retsudev";
	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

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
