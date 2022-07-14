{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.nvidia-exec;
in
{
  options.services.nvidia-exec = {
    enable = mkEnableOption "nvidia-exec, GPU switching without login out for Nvidia Optimus laptops under Linux";

    package = mkOption {
      type = types.package;
      default = pkgs.nvidia-exec;
      defaultText = literalExpression "${pkgs.nvidia-exec}";
      description = "nvidia-exec package to use";
    };
  };

  config = mkIf cfg.enable {
    systemd.services.nvidia-exec = {
      description = "Turn off GPU during boot.";

      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${cfg.package}/bin/nvx off-boot";
      };

      wantedBy = [ "multi-user.target" ];
    };
  };
}
