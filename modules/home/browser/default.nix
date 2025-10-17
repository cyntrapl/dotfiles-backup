{ pkgs, inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;

    profiles."Default" = {
      spaces = {
        Work = {
          id = "12345678-1234-1234-1234-123456789abc"; # UUID v4
          position = 1;
          icon = "💼";
        };
        Personal = {
          id = "abcdefab-1234-1234-1234-123456789abc";
          position = 2;
          icon = "😎";
        };
      };

      spacesForce = true;
    };
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
