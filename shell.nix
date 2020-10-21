with import (builtins.fetchTarball {
  name = "nixos-20.03-2020-10-20";
  url =
    "https://github.com/NixOS/nixpkgs/archive/d3784204ba1a6bbb0c0ebf89b706bda50c113112.tar.gz";
  sha256 = "0y1jznny96r4ngdiqnriq7c4pylf5dzmjc4c0hgi52lkrkhrly3v";
}) { };

mkShell {
  buildInputs = [ git kicad ];

  shellHook = ''
    git config filter.kicad_project.clean "sed -E 's/^update=.*$/update=Date/'"
    git config filter.kicad_project.smudge cat

    git config filter.kicad_sch.clean "sed -E 's/#(PWR|FLG)[0-9]+/#\1?/'"
    git config filter.kicad_sch.smudge cat
  '';
}
