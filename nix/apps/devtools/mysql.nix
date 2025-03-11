{ pkgs, ... }:

{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  # Install MySQL Workbench and MySQL 8.4
  environment.systemPackages = with pkgs; [
    parallel-full
    mysql-workbench
    mysql84
  ];

  # Add MySQL 8.4 to PATH for all users
  environment.variables = {
    PATH = [
      "${pkgs.mysql84}/bin"
    ];
  };
}
