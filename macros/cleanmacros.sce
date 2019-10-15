// =============================================================================
// Copyright (C) DIGITEO - 2010 - Allan CORNET
// =============================================================================
libpath = get_absolute_file_path('cleanmacros.sce');
// =============================================================================
all_items =dir(libpath);
all_items2 = all_items(2);
all_dir = all_items2(all_items(5)==%t);

num_dir = size(all_dir,1);

for cnt = 1:num_dir
cd(libpath + '/' + all_dir(cnt));
binfiles = ls(pwd()+'/*.bin');
for i = 1:size(binfiles,'*')
    mdelete(binfiles(i));
end

mdelete(libpath + '/' + all_dir(cnt) + '/names');
mdelete(libpath + '/' + all_dir(cnt)+ '/lib');

end 

// =============================================================================

