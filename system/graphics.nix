{ ... }:
{
  hardware.enableRedistributableFirmware = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.amdgpu.opencl.enable = true;
  hardware.amdgpu.legacySupport.enable = true;
  hardware.amdgpu.initrd.enable = true;

  services.hardware.openrgb.enable = true;
}
