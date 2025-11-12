if status is-interactive
	function fish_greeting
		hyfetch
	end
	alias rebuild-switch 'sudo nixos-rebuild switch --flake ~/dotfiles/nixos/'
	alias rebuild-boot 'sudo nixos-rebuild boot --flake ~/dotfiles/nixos/'
	alias upgrade-switch 'nix flake update --flake ~/dotfiles/nixos/ && sudo nixos-rebuild switch --flake ~/dotfiles/nixos/'
	alias upgrade-boot 'nix flake update --flake ~/dotfiles/nixos/ && sudo nixos-rebuild boot --flake ~/dotfiles/nixos/'
	alias dots 'cd ~/dotfiles/ && nvim ~/dotfiles/'
end
