function path = ann_getToolboxPath()
    // Returns the path to the current module.
    // 
    // Calling Sequence
    //   path = ann_getToolboxPath ( )
    //
    // Parameters
    //   path : a 1-by-1 matrix of strings, the path to the current module.
    //
    // Examples
    //   path = ann_getToolboxPath ( )
    //
    // Authors
    //   Copyright (C) 2011 - Equalis

  [fs, path] = libraryinfo("NeuralNet_networklib");
  path = pathconvert(fullpath(path + "/../../"), %t, %t);
endfunction


