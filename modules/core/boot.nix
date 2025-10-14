{
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
  };

  boot.supportedFilesystems = [ "nfts" ]; 
}
