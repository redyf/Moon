{
  description = "Redyf's Neovim Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      utils,
      ...
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        inherit (nixpkgs) lib;
        pkgs = nixpkgs.legacyPackages.${system};
        runtimeDeps = with pkgs; [
          # Tree sitter
          gcc

          # LSP/Linters
          nixd
          statix
          lua-language-server
          selene
          stylua

          # Telescope
          chafa
        ];

        nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
          pkgs.neovimUtils.makeNeovimConfig {
            customRC = ''
              set runtimepath^=${./.}
              source ${./.}/init.lua
            '';
          }
          // {
            wrapperArgs = [
              "--prefix"
              "PATH"
              ":"
              "${lib.makeBinPath runtimeDeps}"
            ];
          }
        );
      in
      {
        overlays = {
          neovim = _: _prev: {
            neovim = nvim;
          };
          default = self.overlays.neovim;
        };

        packages = rec {
          neovim = nvim;
          default = neovim;
        };

        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            lua # Lua programming language
            stylua # Lua formatter
            selene # Lua linter written in rust
            lua-language-server # Lua LSP
            luajitPackages.luarocks-nix # Package manager for Lua on Nix
          ];
          shellHook = ''
            echo "Environment is ready" | ${pkgs.lolcat}/bin/lolcat;
          '';
        };
      }
    );
}
