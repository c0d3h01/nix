let
  userPublicKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG5qPWYOZSxl3Fnsiu3fBCTxQuwGrigSoqHAoMpLGmAC harshalsawant.dev@gmail.com"
  ];

  systemPublicKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG5aLVlwNTE6Qw7yBLKJc8YRWcwFbRZaZ9bwzqwboOcc root@devbox"
  ];
in
{
  "ssh.age".publicKeys = userPublicKeys ++ systemPublicKeys;
  "element.age".publicKeys = userPublicKeys ++ systemPublicKeys;
}
