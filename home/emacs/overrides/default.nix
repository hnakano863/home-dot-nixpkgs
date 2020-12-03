{ pkgs }:
self: super: {
  my-ivy-migemo = self.callPackage ./my-ivy-migemo {};
  initchart = self.callPackage ./initchart {};
  evil = self.melpaPackages.evil;
  ddskk = pkgs.callPackage ./ddskk {};
}
