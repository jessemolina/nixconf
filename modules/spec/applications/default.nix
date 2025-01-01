
{ config, lib, pkgs, ... }:

{
  options = {};

  imports = [
    ./steam.nix
  ];

  config = {
    # System-wide packages
    environment.systemPackages = with pkgs; [

      # ---------------------
      # Development tools
      # ---------------------
      gcc                     # C/C++ compiler
      gnumake                 # GNU Make tool
      git                     # Version control system
      stow                    # Symlink manager for dotfiles
      go                      # Go programming language
      rustc                   # Rust programming language compiler
      cargo                   # Rust package manager
      kubernetes-helm          # Kubernetes package manager
      kubectl                 # Kubernetes CLI
      kind                    # Kubernetes cluster manager
      telepresence2            # Kubernetes remote dev tool

      # Python environment
      (python312.withPackages (ps: with ps; [
        numpy                 # Numeric computing library
        scipy                 # Scientific computing library
        jupyterlab            # Jupyter notebook/lab
        pandas                # Data analysis and manipulation library
        statsmodels           # Statistical models library
        scikitlearn           # Machine learning library
      ]))

      evcxr                   # Rust REPL (read-eval-print loop)

      # ---------------------
      # Language Server Protocol (LSP) tools
      # ---------------------
      rust-analyzer           # Rust LSP (Language Server Protocol)
      marksman                # Markdown language server
      lua-language-server     # Lua language server
      jdt-language-server     # Java language server

      # ---------------------
      # Text editors and terminals
      # ---------------------
      neovim                  # Vim-based text editor
      vim                     # Vim text editor
      kitty                   # Terminal emulator
      tmux                    # Terminal multiplexer
      zellij                  # Terminal workspace manager

      # ---------------------
      # Utilities
      # ---------------------
      ripgrep                 # Fast file searcher
      unzip                   # Unzip utility
      wget                    # Network file retriever
      gh                      # GitHub CLI tool
      slides                  # Terminal-based presentation tool
      yazi                    # File manager
      glances                 # System monitor tui

      # ---------------------
      # Web browser
      # ---------------------
      firefox                 # Web browser

      # ---------------------
      # Screenshots and clipboard management (Wayland)
      # ---------------------
      grim                    # Screenshot utility for Wayland
      slurp                   # Select area for screenshot
      swappy                  # Annotate screenshots
      wl-clipboard            # Wayland clipboard manager
      wl-mirror               # Screen mirroring for Wayland
      mako                    # Notification daemon for Wayland

      # ---------------------
      # PDF and document viewers
      # ---------------------
      zathura                 # Document viewer

      # ---------------------
      # Certificates
      # ---------------------
      cacert                  # Certificate bundle

      # ---------------------
      # Miscellaneous
      # ---------------------
      lua51Packages.jsregexp  # Lua Regexp
      pulsemixer
      mdbook
      tree
      ffmpeg
      protonvpn-gui
      feh
      discord
      nodejs
      terraform
      terraform-ls
      bacon
      zola
      webcord
      atac
      obsidian
      emacs
      chemacs2
      rustfmt
      nushell
      fd
      vscode-extensions.vadimcn.vscode-lldb  # codelldb for VS Code
    ];

    environment.shells = with pkgs; [ nushell ];
  };
}

