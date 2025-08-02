# Notes:
# sudo mysql -u root
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'YourNewPassword';
# FLUSH PRIVILEGES;
# EXIT;
{
  pkgs,
  config,
  lib,
  userConfig,
  ...
}:

{
  config = lib.mkIf userConfig.dev.db {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
      ensureDatabases = [ "development" ];
      ensureUsers = [
        {
          name = userConfig.username;
          ensurePermissions = {
            "development.*" = "ALL PRIVILEGES";
          };
        }
      ];
    };

    environment.systemPackages = with pkgs; [
      mysql-workbench
      mariadb-client # Command line client
      # phpmyadmin # Web interface
    ];
  };
}
