{ inputs, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        settings = {
          "browser.startup.homepage" = "https://noext.jokko.no/home/";
        };
        search = {
          force = true;
          order = [ "g" "ddg" "Nix Packages" "Home Manager" ];
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
            google.metaData.alias = "@g";
            ddg.metaData.alias = "@d";
          };
        };

        extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          vimium
          remove-youtube-s-suggestions
          zotero-connector
        ];
      };
    };
    policies = {
      Preferences = {
        "extensions.webextensions.restrictedDomains" = "accounts-static.cdn.mozilla.net,accounts.firefox.com,addons.cdn.mozilla.net,addons.mozilla.org,api.accounts.firefox.com,content.cdn.mozilla.net,discovery.addons.mozilla.org,install.mozilla.org,oauth.accounts.firefox.com,profile.accounts.firefox.com,support.mozilla.org,sync.services.mozilla.com,noext.jokko.no";
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
