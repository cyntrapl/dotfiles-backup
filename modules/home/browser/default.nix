{pkgs, inputs,  ...}:
{
 imports = [
   inputs.zen-browser.homeModules.beta 
 ];

  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      NoDefaultBookmarks = true;
      PasswordManagerEnabled = false;
      OfferToSaveLogins = false;
      DisableFirefoxAccounts = false;
      DisableSystemAddonUpdate = true;
      DisableBuiltinPDFViewer = true;
      NewTabPage = false;
      ExtensionSettings = {
        "446900e4-71c2-419f-a6a7-df9c091e268b" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/446900e4-71c2-419f-a6a7-df9c091e268b/latest.xpi";
        };
      }; 
    };

    profiles."default" = {
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
        ]; 
      };
    };

  };

  home.packages = with pkgs; [ rustdesk ];
}
