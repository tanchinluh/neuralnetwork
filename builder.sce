// This file is released into the public domain


function builder_main()
mode(-1);
lines(0);

TOOLBOX_NAME  = "NeuralNet";
TOOLBOX_TITLE = "A Neural Network Module for Scilab";
toolbox_dir   = get_absolute_file_path("builder.sce");

// Check Scilab's version
// =============================================================================

try
	v = getversion("scilab");
catch
	error(gettext("Scilab 5.2 or more is required."));
end

// Check development_tools module avaibility
// =============================================================================

if ~isdef('tbx_build_loader') then
  error(msprintf(gettext("%s module not installed."), "module_manager"));
end

// Action
// =============================================================================

tbx_builder_macros(toolbox_dir);
tbx_builder_help(toolbox_dir);
tbx_build_loader(TOOLBOX_NAME, toolbox_dir);

endfunction

builder_main()
clear builder_main;
