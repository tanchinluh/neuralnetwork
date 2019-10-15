// Chapter 3 - Example 2: Choice of Architecture

function NN3_exam2()

// Define at the Scilab command window, the training inputs and targets
P = [-2:0.01:2]
i = 4;
T = 1 + sin(i*%pi/4*P);
N = [1 3 1];

// Define activation functions for each layers
af = ['ann_logsig_activ','ann_purelin_activ'];

// Call the network with extra argument
W = ann_FFBP_lm(P,T,N,af,[],[],[],200,1e-4,1e-5)

// Simulate the plot the result
y = ann_FFBP_run(P,W,af);

figure;
newaxes();
plot(P,T,P,y);

editor(ann_getToolboxPath() + "/demos/examples/NN3_exam2.sce", "readonly");

endfunction

NN3_exam2()
clear NN3_exam2;