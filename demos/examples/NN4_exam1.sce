// Chapter 4 - Example 1 : Classification using Competitive Network

function NN4_exam1()

// Define at the SCILAB command window, the four two-element vectors
P = [-0.2 0.2 1.0 1.0 -0.6 -0.8;1.0 1.0 0.2 -0.2 -1.0 -0.6];

// Visualize the Data
plot(P(1,:),P(2,:),'+r');
title('Input Vectors');
xlabel('p(1)');
ylabel('p(2)');
h = gca();
h.data_bounds =[-2 2 -2 2];

// Create a three-neuron competitive network and train the network with the data
[W,b] =  ann_COMPET(P,3);

// Simulate the network with input vectors again
[y,classes] = ann_COMPET_run(W,P)

// Visualize the result
figure();
newaxes();
plot(P(1,:),P(2,:),'+r');
plot(W(:,1), W(:,2), 'ob');
h = gca();
h.data_bounds =[-2 2 -2 2];

// Extra - Animation
[W,b] =  ann_COMPET_visualize2d(P,3);

editor(ann_getToolboxPath() + "/demos/examples/NN4_exam1.sce", "readonly");

endfunction

NN4_exam1()
clear NN4_exam1
