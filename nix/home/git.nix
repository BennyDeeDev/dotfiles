{ ... }:

{
  programs.gpg.enable = true;

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "master";
      pull.rebase = true;
    };
  };
}
