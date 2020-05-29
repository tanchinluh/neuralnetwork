// Chapter 2 - Example 2: Training Perceptron

function NN2_exam2()


// Start of demo
msg = 'Training Perceptron demo, press any key to continue...';
msgtitle = 'Training Perceptron';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")

// Check variable in data file
listvarinfile(ann_getToolboxPath() + '/demos/dataset/NN2_data.sod')

// Load the data points into Workspace
load(ann_getToolboxPath() + '/demos/dataset/NN2_data.sod')


// Visualize dataset
scf(101);xgrid();plot_2group(p,t);
msg = ['2 Groups of Data']
msgtitle = 'Training Perceptron';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
//xdel(101);

// Construct a two-input, single-output perceptron and train the perceptron network with training inputs (p) and targets (t)
[w,b] = ann_PERCEPTRON(p,t);
plot_weight(w,b);
msg = ['Trained Perceptron']
msgtitle = 'Training Perceptron';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")

// Run the perceptron network with same inputs, and the trained w and b
y = ann_PERCEPTRON_run(p,w,b) 
disp(y)
plot_2group(p,y,'bx','gx');

msg = 'End of demo, click exit to close all figures';
msgtitle = 'Training Perceptron';
btn = messagebox(msg, msgtitle, "info", "exit", "modal")
xdel(101);

//editor(ann_getToolboxPath() + "/demos/examples/NN2_exam2.sce", "readonly");

endfunction

NN2_exam2()
clear NN2_exam2;
