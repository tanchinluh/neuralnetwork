// Chapter 4 - Example 4 : Classification using LVQ Network

function NN4_exam4()
// Load the data
load(ann_getToolboxPath() + '/demos/examples/NN4_exam4.dat');

// Create and Train LVQ network
[W,b] =  ann_LVQ1(P,T,4,0.1,300);

// Simulate and Plot result
[y,classes] = ann_LVQ_run(W,P);

figure();
newaxes();
plot(classes,'.');

editor(ann_getToolboxPath() + "/demos/examples/NN4_exam4.sce", "readonly");

endfunction

NN4_exam4()
clear NN4_exam4