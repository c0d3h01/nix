{ inputs, ... }:
{
  flake.overlays.nixgl = inputs.nixgl.overlays.default;
}
