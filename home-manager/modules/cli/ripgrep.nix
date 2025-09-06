{
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--smart-case"
      "--max-columns=200"
      "--max-columns-preview"
      "--hidden"
      "--follow"
    ];
  };
}
