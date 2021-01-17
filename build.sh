#! /usr/bin/env nix-shell
#! nix-shell -i bash -E "with builtins; let f = getFlake \"routeromen\"; in f.devShells.${builtins.currentSystem}.gd32"

# nix-shell -i bash -E "with builtins; let f = getFlake (toString ~/nixos); in f.devShells.${builtins.currentSystem}.gd32"

# nix-shell -i bash -p "with builtins; let f = getFlake (toString ~/nixos); p = f.packages.${builtins.currentSystem}; in p.nixpkgs.mkShell { buildInputs = [ p.gcc-gd32 ]; }"

#~/nixos#binutils-gd32 ~/nixos#rustc-gd32 ~/nixos#cargo-gd32 nixpkgs#gcc nixpkgs#lld_11

# nix shell ~/nixos#gcc-gd32 ~/nixos#binutils-gd32 ~/nixos#rustc-gd32 ~/nixos#cargo-gd32 nixpkgs#gcc nixpkgs#lld_11
nix run routeromen#cargo-gd32 -- build --example blinky

