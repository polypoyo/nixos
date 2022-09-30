{ config, pkgs }: {
  hardware.opengl.extraPackages = with pkgs; [
    # OpenCL
    rocm-opencl-icd
    rocm-opencl-runtime
  ];
}
