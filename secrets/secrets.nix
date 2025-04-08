let
  keys = import ./keys.nix;
in
with keys;
{
  "ssh-private-key" = {
    file = ./ssh-private-key.age;
    owner = "root";
    group = "root";
    mode = "600";
    publicKey = [ keys.c0d3h01 ];
  };
}
