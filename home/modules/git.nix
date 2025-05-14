{
  userConfig,
  ...
}:

{
  programs = {
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };

    git = {
      enable = true;
      lfs.enable = true;

      # User Configurations
      userName = userConfig.username;
      userEmail = userConfig.email;

      # Git Configuations
      extraConfig = {
        color.ui = true;
        diff.algorithm = "histogram";
        merge.conflictstyle = "zdiff3";
        branch.autosetuprebase = "always";
        pull.rebase = "merges";
        init.defaultBranch = "main";

        rebase = {
          autostash = true;
          updateRefs = true;
        };

        push = {
          default = "current";
          autosetupremote = true;
        };

        fetch = {
          prune = true;
          recurseSubmodules = true;
        };

        alias = {
          unstage = "reset HEAD --";
          graph = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        };
      };

      # Delta for better diffs
      delta = {
        enable = true;
        options = {
          navigate = true;
          light = false;
          side-by-side = true;
          syntax-theme = "ansi";
        };
      };
    };
  };
}
