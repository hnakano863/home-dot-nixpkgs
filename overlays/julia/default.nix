self: super: {
  julia-1_5_2 = super.callPackage ./template.nix {
    version = "1.5.2";
    sha256 = "0k3bpw8v07b70z50dyvjgz5wc58bnvw505lfcssczmhpfqd5zj49";
  };
  julia-bin = super.callPackage ./template.nix {
    version = "1.5.3";
    sha256 = "1yc60dl39sa0rbiaj2v7vf79j0c9zd93h1mwcahq99w44c81k3q6";
  };
}
