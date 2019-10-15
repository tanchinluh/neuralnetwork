// Chapter 2 - Example 3: Training Linear Network

function NN2_exam3()

// Check variable in data file
listvarinfile(ann_getToolboxPath() + '/demos/examples/NN2_data.dat')

// Load the data points into Workspace
load(ann_getToolboxPath() + '/demos/examples/NN2_data.dat');

// Construct a two-input, single-output perceptron and train the linear network with training inputs (p) and targets (t)
[w,b] = ann_ADALINE(p,t,0.01);

// Run the perceptron network with same inputs, and the trained w and b
y = ann_ADALINE_run(p,w,b)

editor(ann_getToolboxPath() + "/demos/examples/NN2_exam3.sce", "readonly");

endfunction

NN2_exam3()
clear NN2_exam3
