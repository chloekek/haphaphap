super: self:

{
    # Add the generated package list to nodePackages.
    nodePackages =
        self.nodePackages //
        import ./composition.nix {
            inherit (super) pkgs system nodejs;
        };
}
