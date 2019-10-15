// Chapter 1 - Example 1: Activation Function

function NN1_exam1()

p1 = 2.5;
p2 = 3;
w1 = 0.5;
w2 = -0.7;
b = 0.3;
n = w1*p1 + w2*p2 + b;
a = ann_hardlim_activ(n);

editor(ann_getToolboxPath() + "/demos/examples/NN1_exam1.sce", "readonly");

endfunction

NN1_exam1();
clear NN1_exam1