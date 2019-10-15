//=============================================================================
// Copyright (C) Equalis LLC - 2012 - 
// http://www.gnu.org/licenses/gpl-2.0.txt
//=============================================================================
// =============================================================================
function cleaner_help()
  path = get_absolute_file_path("cleaner_help.sce");
  langdirs = dir(path);
  langdirs = langdirs.name(langdirs.isdir);

  for l = 1:size(langdirs, '*')
    masterfile = fullpath(path + filesep() + langdirs(l) + "/master_help.xml");
    mdelete(masterfile);
   
    jarfile = fullpath(path + "/../jar/scilab_" + langdirs(l) + "_help.jar");
    mdelete(jarfile);
    
    tmphtmldir = fullpath(path + "/" + langdirs(l) + "/scilab_" + langdirs(l) + "_help");
    rmdir(tmphtmldir, 's');
  end
endfunction
// =============================================================================
cleaner_help();
clear cleaner_help;
// =============================================================================
