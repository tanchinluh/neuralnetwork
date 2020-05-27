// Generate for Network functions

current_path = get_absolute_file_path("genhelpscript_single.sce");

pMacrosNetwork = fullpath(current_path + '/network');
pHelpNetwork = fullpath(current_path + '/../help/en_US/Neural_Network_Functions');
files_Network = findfiles(pMacrosNetwork, '*.sci');
//for i = 1:size(files_Network, '*')
//    help_from_sci(pMacrosNetwork + filesep() + 'ann_FFBP_lm.sci', pHelpNetwork);
//end
pMacrosNew = fullpath(current_path + '/new');
help_from_sci(pMacrosNew + filesep() + 'knn.sci', pHelpNetwork);
help_from_sci(pMacrosNew + filesep() + 'nn_train.sci', pHelpNetwork);
help_from_sci(pMacrosNew + filesep() + 'initialize_parameters.sci', pHelpNetwork);
help_from_sci(pMacrosNew + filesep() + 'nn_onehot.sci', pHelpNetwork);
help_from_sci(pMacrosNew + filesep() + 'nn_split_data.sci', pHelpNetwork);
help_from_sci(pMacrosNew + filesep() + 'nn_eval_performance.sci', pHelpNetwork);
help_from_sci(pMacrosNew + filesep() + 'model_forward.sci', pHelpNetwork);
//pMacrosNew = fullpath(current_path + '/new');
//pHelpNew = fullpath(current_path + '/../help/en_US/New_Functions');
//files_New = findfiles(pMacrosNew, '*.sci');
//for i = 1:size(files_New, '*')
//    try
//        help_from_sci(pMacrosNew + filesep() + files_New(i), pHelpNew);
//    catch
//        disp(lasterror);
//    end
//end

pMacrosCompute = fullpath(current_path + '/computation');
pHelpCompute = fullpath(current_path + '/../help/en_US/Computation_Functions');
files_Compute = findfiles(pMacrosCompute, '*.sci');
//for i = 1:size(files_Compute, '*')
//    help_from_sci(pMacrosCompute + filesep() + files_Compute(i), pHelpCompute);
//end

pMacrosVisualisation = fullpath(current_path + '/visualisation');
pHelpVisualisation = fullpath(current_path + '/../help/en_US/Visualisation_Functions');
files_Visualisation = findfiles(pMacrosVisualisation, '*.sci');
//for i = 1:size(files_Visualisation, '*')
//    help_from_sci(pMacrosVisualisation + filesep() + files_Visualisation(i), pHelpVisualisation);
//end

// Build all
cd(fullpath(current_path + '/..'));
exec('builder.sce');
