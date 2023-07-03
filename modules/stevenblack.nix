{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.networking.stevenblack;

  activatedHosts = with cfg.block; optionals fakeNews [ "fakenews" ]
    ++ optionals gambling [ "gambling" ]
    ++ optionals porn [ "porn" ]
    ++ optionals social [ "social" ];

  hostsPath = "${pkgs.stevenblack-blocklist}/alternates/" + concatStringsSep "-" activatedHosts + "/hosts";
in
{
  options.networking.stevenblack = {
    enable = mkEnableOption "Enable the stevenblack hosts file blocklist.";

    package = mkOption {
      type = types.package;
      default = pkgs.stevenblack-blocklist;
      defaultText = literalExpression "${pkgs.stevenblack-blocklist}";
      description = "stevenblack package to use";
    };

    block = {
      fakeNews = mkEnableOption "Block fake news websites.";
      gambling = mkEnableOption "Block gambling websites.";
      porn = mkEnableOption "Block porn websites.";
      social = mkEnableOption "Block social media websites.";
    };
  };

  config = mkIf cfg.enable {
    networking.hostFiles = optionals (activatedHosts != [ ]) [ hostsPath ]
      ++ optionals (activatedHosts == [ ]) [ "${pkgs.stevenblack-blocklist}/hosts" ];
  };

  meta.maintainers = [ lib.maintainers.fortuneteller2k ];
}
