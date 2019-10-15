// Chapter 2 - Example 2: Training Perceptron

function NN2_exam2()

// Check variable in data file
listvarinfile(ann_getToolboxPath() + '/demos/examples/NN2_data.dat')

// Load the data points into Workspace
load(ann_getToolboxPath() + '/demos/examples/NN2_data.dat')

// Construct a two-input, single-output perceptron and train the perceptron network with training inputs (p) and targets (t)
[w,b] = ann_PERCEPTRON(p,t);

// Run the perceptron network with same inputs, and the trained w and b
y = ann_PERCEPTRON_run(p,w,b) 
disp(y)

editor(ann_getToolboxPath() + "/demos/examples/NN2_exam2.sce", "readonly");

endfunction

NN2_exam2()
clear NN2_exam2;
