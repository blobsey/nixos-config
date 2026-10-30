{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    pi.url = "github:earendil-works/pi/stable";
  };

  outputs = { self, nixpkgs, pi, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        {
          environment.systemPackages = [
            pi.packages.x86_64-linux.default
          ];
        }
      ];
    };
  };
}
