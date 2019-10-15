// Generate for Network functions

current_path = get_absolute_file_path('genhelpscript.sce');

//pMacrosNetwork = fullpath(current_path + '/network');
//pHelpNetwork = fullpath(current_path + '/../help/en_US/Neural_Network_Functions');
//files_Network = findfiles(pMacrosNetwork, '*.sci');
//for i = 1:size(files_Network, '*')
//  help_from_sci(pMacrosNetwork + filesep() + files_Network(i), pHelpNetwork);
//end
//
//pMacrosCompute = fullpath(current_path + '/computation');
//pHelpCompute = fullpath(current_path + '/../help/en_US/Computation_Functions');
//files_Compute = findfiles(pMacrosCompute, '*.sci');
//for i = 1:size(files_Compute, '*')
//  help_from_sci(pMacrosCompute + filesep() + files_Compute(i), pHelpCompute);
//end
//
pMacrosVisualisation = fullpath(current_path + '/visualisation');
pHelpVisualisation = fullpath(current_path + '/../help/en_US/Visualisation_Functions');
files_Visualisation = findfiles(pMacrosVisualisation, '*.sci');
for i = 1:size(files_Visualisation, '*')
  help_from_sci(pMacrosVisualisation + filesep() + files_Visualisation(i), pHelpVisualisation);
end

//pMacrosUtilities = fullpath(current_path + '/utilities');
//pHelpUtilities = fullpath(current_path + '/../help/en_US/Utilities_Functions');
//files_Utilities = findfiles(pMacrosUtilities, '*.sci');
//for i = 1:size(files_Utilities, '*')
//  help_from_sci(pMacrosUtilities + filesep() + files_Utilities(i), pHelpUtilities);
//end

// Build all
cd(fullpath(current_path + '/..'));
exec('builder.sce');
