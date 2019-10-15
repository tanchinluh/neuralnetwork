// This file is released into the public domain

function build_macros(TOOLBOX_NAME)

tbx_build_macros(TOOLBOX_NAME, get_absolute_file_path("buildmacros.sce") + '\visualisation');
tbx_build_macros(TOOLBOX_NAME, get_absolute_file_path("buildmacros.sce") + '\network');
tbx_build_macros(TOOLBOX_NAME, get_absolute_file_path("buildmacros.sce") + '\computation');
tbx_build_macros(TOOLBOX_NAME, get_absolute_file_path("buildmacros.sce") + '\utilities');
tbx_build_macros(TOOLBOX_NAME, get_absolute_file_path("buildmacros.sce") + '\new');
endfunction

build_macros(TOOLBOX_NAME);
clear build_macros; 
