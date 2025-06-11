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
    assertions = with config.services.xserver; [
      {
        assertion = __elem "nvidia" videoDrivers;
        message = "nvidia-exec requires the nvidia driver to be present in services.xserver.videoDrivers";
      }

      {
        assertion = __head videoDrivers == "intel" || __head videoDrivers == "amdgpu";

        message = ''
          nvidia-exec requires that the intel/amdgpu driver be loaded first.
          intel/amdgpu must be the first item in the services.xserver.videoDrivers list.
        '';
      }
    ];

    boot.blacklistedKernelModules = [
      "nouveau"
      "nvidia"
      "nvidia-drm"
      "nvidia-modeset"
      "nvidia-uvm"
    ];

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
