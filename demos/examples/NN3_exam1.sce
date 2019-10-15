// Chapter 3 - Example 1: Comparing Different Training Algorithms

function NN3_exam1()

// Define at the Scilab command window, the training inputs and targets
P = [0 0 1 1;0 1 0 1]
T = [0 1 1 0];
N = [2 3 1];

// using the minimum calling sequence:
W = ann_FFBP_gd(P,T,N);
y = ann_FFBP_run(P,W);

// using the minimum calling sequence:
W = ann_FFBP_gdx(P,T,N);
y = ann_FFBP_run(P,W);

// using the minimum calling sequence:
W = ann_FFBP_lm(P,T,N);
y = ann_FFBP_run(P,W);

editor(ann_getToolboxPath() + "/demos/examples/NN3_exam1.sce", "readonly");

endfunction

NN3_exam1()
clear NN3_exam1

