// Chapter 4 - Example 3 :　Creating and Training the SOM

function NN4_exam3()

// Load the data into Scilab
load(ann_getToolboxPath() + '/demos/examples/NN4_exam3.dat')
plot(P(1,:),P(2,:),'gx');

// Create a 8-by-8 SOM with following command, and superimpose the initial weights onto the input space
// W = ann_SOM(P,N,itermax,steps,NS,topfcn,distfcn)
W = ann_SOM(P,[8 8],200);

// Create Topology and Distance Matrix for visualization
neuron_pos = ann_som_gridtop([8 8]);
d = ann_som_linkdist(neuron_pos);

figure();
newaxes();
plot(P(1,:),P(2,:),'gx');
ann_som_plot2d(W,d);

editor(ann_getToolboxPath() + "/demos/examples/NN4_exam3.sce", "readonly");

endfunction

NN4_exam3()
clear NN4_exam3
