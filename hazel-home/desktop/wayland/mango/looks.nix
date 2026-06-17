{inputs, ...}: {
  wayland.windowManager.mango.settings = {
    # Window effects
    blur = 1;
    blur_optimized = 1;
    blur_params = {
      radius = 5;
      num_passes = 2;
    };
    border_radius = 3;
    focused_opacity = 1.0;

    # Animations - use underscores for multi-part keys
    animations = 1;
    animation_type_open = "slide";
    animation_type_close = "slide";
    animation_duration_open = 400;
    animation_duration_close = 800;

    # Or use nested attrs (will be flattened with underscores)
    animation_curve = {
      open = "0.46,1.0,0.29,1";
      close = "0.08,0.92,0,1";
    };
  };
}
