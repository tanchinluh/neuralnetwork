// Chapter 2 - Example 3: Training Linear Network

function NN2_exam3()

// Start of demo
msg = 'Training Linear Network demo, press any key to continue...';
msgtitle = 'Training Linear Network';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")

// Check variable in data file
listvarinfile(ann_getToolboxPath() + '/demos/dataset/NN2_data.sod')

// Load the data points into Workspace
load(ann_getToolboxPath() + '/demos/dataset/NN2_data.sod');

// Construct a two-input, single-output perceptron and train the linear network with training inputs (p) and targets (t)
[w,b] = ann_ADALINE(p,t,0.01);

// Run the perceptron network with same inputs, and the trained w and b
y = ann_ADALINE_run(p,w,b)

msg = ['T = [' + strcat(string(t),' , ')  + ']' 
'y = [' + strcat(string(round(y.*100)./100),' , ')+ ']'];
msgtitle = 'Training Linear Network';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
//editor(ann_getToolboxPath() + "/demos/examples/NN2_exam3.sce", "readonly");

endfunction

NN2_exam3()
clear NN2_exam3
