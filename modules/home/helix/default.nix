{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.helix = {
    enable = true;

    settings = {
      theme = "catppuccin_mocha";

      editor = {
        line-number = "relative";
        cursorline = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        indent-guides = {
          render = true;
          character = "┊";
        };

        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
          ];
          center = [ ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
          separator = "│";
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        soft-wrap.enable = true;
        bufferline = "multiple";

        # Search configuration
        search = {
          smart-case = true;
          wrap-around = true;
        };
      };

      keys.normal = {
        # Space as leader key - SIMPLE AND WORKING
        space.space = "file_picker";
        space.w = ":write";
        space.q = ":quit";
        space.f = ":format";

        # Simple search bindings that definitely work
        space.s = {
          s = "search";
          f = "file_picker";
        };

        # LSP bindings that definitely work
        space.g = {
          d = "goto_definition";
          r = "goto_reference";
        };

        # Quick navigation
        "C-s" = "search";
        "C-f" = "file_picker";

        # LSP navigation
        "g" = {
          "d" = "goto_definition";
          "r" = "goto_reference";
          "h" = "hover";
        };

        "K" = "hover";
        "G" = "goto_last_line";

        # Search navigation
        "n" = "search_next";
        "N" = "search_prev";
        "*" = "search_selection";

        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
      };

      keys.select = {
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
        "*" = "search_selection";
      };
    };

    languages = {
      language-server = {
        rust-analyzer = {
          command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        };

        nil = {
          command = "${pkgs.nil}/bin/nil";
        };
      };

      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
          };
          language-servers = [ "nil" ];
        }
        {
          name = "rust";
          auto-format = true;
          formatter = {
            command = "${pkgs.rustfmt}/bin/rustfmt";
          };
          language-servers = [ "rust-analyzer" ];
        }
      ];
    };
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    rust-analyzer
    nixfmt-rfc-style
    nil
    rustfmt
  ];
}
