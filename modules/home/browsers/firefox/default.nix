{ inputs, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        settings = {
          "browser.startup.homepage" = "https://jokko.no";
        };
        search = {
          force = true;
          default = "DuckDuckGo";
          order = [ "DuckDuckGo" "Nix Packages" "Home Manager" "Google" ];
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "https://search.nixos.org/favicon.png";
              definedAliases = [ "@np" ];
            };
            "Nix Options" = {
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "https://search.nixos.org/favicon.png";
              definedAliases = [ "@no" ];
            };
            "Home Manager" = {
              urls = [{
                template = "https://home-manager-options.extranix.com/";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "https://search.nixos.org/favicon.png";
              definedAliases = [ "@hm" ];
            };
            "Google".metaData.alias = "@g";
            "DuckDuckGo".metaData.alias = "@d";
          };
        };

        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          vimium-c
        ];
      };
    };
    policies = {
      Preferences = {
        "extensions.ublock-origin.enabled" = true;
        "extensions.autoDisableScopes" = 0;
        "signon.rememberSignon" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.compactmode.show" = true;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "services.sync.prefs.sync.extensions.activeThemeID" = false;
        "extensions.pocket.enabled" = false;
        "identity.fxaccounts.toolbar.enabled" = false;
      };
    };
  };
}
