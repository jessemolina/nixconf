{ config, lib, ...}:
{
  options = {
    spec.users = {
      user = {
        isAdmin = lib.mkOption {
          type = lib.types.bool;
          default = false; 
          description = "User administrative privileges";
        };

        isNormal = lib.mkOption {
          type = lib.types.bool;
          default = true; 
          description = "User administrative privileges";
        };

        name = lib.mkOption {
          type = lib.types.str;
          default = "default";
          description = "User account name";
        };

        hash = lib.mkOption {
          type = lib.types.str;
          default = "default";
          description = "User account name";
        };

        shell = lib.mkOption {
          type = lib.types.str;
          default = "bash";
          description = "User shell";
        };

      };

      group = {};

    };
  };

  config = 
  let 
    
    # TODO: Validate users.user.<name> attribute set.
    mkUser = { name, hash, shell, isAdmin ? false, isNormal ? true}:
      {
        description = "User ${name}";
        hashedPassword = hash;
        home = "/home/${name}";
        shell = "/run/current-system/sw/bin/${shell}";
        isNormalUser = isNormal;
        isSystemUser = !isNormal;
        extraGroups = if isAdmin then 
          [ "wheel" "networkmanager" "docker"] 
        else [];
      };
  in
  {
    # users.groups.noadmin = {
    #   name = "noadmin";
    # };

    # users.groups = {
    #   "${config.spec.users.user.name}" = {
    #       group = config.spec.user.name;
    #    };
    # };

    users.users = {
      "${config.spec.users.user.name}" = {
         isNormalUser = config.spec.users.user.isNormal;
         isSystemUser = !config.spec.users.user.isNormal;
         extraGroups = if config.spec.users.user.isAdmin then [ "wheel" "networkmanager"] else [];
         hashedPassword = config.spec.users.user.hash;
       };
    };
    

    # TODO: Fix creating one to many users.
    # users.users = lib.mkMerge (
    #   builtins.attrValues (
    #     if config ? spec.users.user.name then
    #       {
    #         "${config.spec.users.user.name}" = mkUser {
    #           name = config.spec.users.user.name;
    #           hash = config.spec.users.user.hash;
    #           isAdmin = config.spec.users.user.isAdmin;
    #         };
    #       }
    #     else
    #       lib.mapAttrs' (userName: userSpec: mkUser {
    #         name = userName;
    #         isAdmin = userSpec.isAdmin;
    #         hash = userSpec.hash;
    #       }) config.spec.users
    #   )
    # );
  };
}
