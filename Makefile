SYSTEM := dev

build:
	sudo nixos-build --flake .#$(SYSTEM)

dry:
	sudo nixos-rebuild dry-run --flake .#$(SYSTEM)

rebuild: 
	sudo nixos-rebuild switch --flake .#$(SYSTEM) --upgrade

vga:
	nix shell nixpkgs#pciutils -c lspci | grep ' VGA '
