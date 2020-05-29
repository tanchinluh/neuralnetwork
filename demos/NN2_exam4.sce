// Chapter 2 - Example 4: Training FFBP Network (GD)

function NN2_exam4()

// Start of demo
msg = 'Training FFBP Network (GD) demo, press any key to continue...';
msgtitle = 'Training FFBP Network (GD)';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")

// Check variable in data file
listvarinfile(ann_getToolboxPath() + '/demos/dataset/NN2_data.sod')

// Load the data points into Workspace
load(ann_getToolboxPath() + '/demos/dataset/NN2_data.sod');


// Start of demo
f = figure("default_axes", "on", ...
           "dockable", "off", ...
           "figure_name", "Network Input-Target", ...
           "axes_size", [400 150], ...
           "infobar_visible", "off", ...
           "menubar_visible", "off", ...
           "toolbar", "none", ...
           "toolbar_visible", "off", ...
           "layout", "gridbag",...
           "figure_id",101);

xstring(-0.1,0.75,'$P = $');gce().font_size = 3;
xstring(0,0.70,prettyprint(p));gce().font_size = 3;

xstring(-0.1,0.4,'$T = $');gce().font_size = 3;
xstring(0,0.4,prettyprint(t));gce().font_size = 3;

msgtitle = 'Training FFBP Network (GD)';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
//m=evstr(x_matrix('enter a  3x3 matrix ',rand(3,3)))


// Construct a two-input, single-output perceptron and train the linear network with training inputs (p) and targets (t)
scf(102)
winId=progressionbar('Training in progress, view the command window for details...');
w = ann_FFBP_gd(p,t,[2 3 1]);
close(winId);

// Run the perceptron network with same inputs, and the trained w and b
y = ann_FFBP_run(p,w)

msg = ['T = [' + strcat(string(t),' , ')  + ']' 
'y = [' + strcat(string(round(y.*100)./100),' , ')+ ']'];
msgtitle = 'Training FFBP Network (GD)';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
//editor(ann_getToolboxPath() + "/demos/examples/NN2_exam3.sce", "readonly");

msg = 'End of demo, click exit to close all figures';
msgtitle = 'Training FFBP Network (GD)';
btn = messagebox(msg, msgtitle, "info", "exit", "modal")
xdel(101:102);



endfunction

NN2_exam4()
clear NN2_exam4
