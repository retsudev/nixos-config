{ _ }:

{
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
