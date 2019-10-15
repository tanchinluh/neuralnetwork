// Chapter 2 - Example 1: Testing Example

function NN2_exam1()

// Define Inputs and Targets
p1 = [1 2]'; p2 = [-1 2]'; p3 = [0 -1]';
t1 = 1; t2 = 0; t3 = 0;

// Let’s randomly choose w = [1 -0.8];
w = [1 -0.8];

// 1st iteration using p1
a = ann_hardlim_activ(w*p1)

// t1 = 1, so there is error. Update weights with Wnew = Wold + epT
w = w + (t1-a)*(p1')

// 2nd iteration using p2
a = ann_hardlim_activ(w*p2)

// t2 = 0, so there is error. Update weights with Wnew = Wold + epT
w = w + (t2-a)*(p2')

// 3rd iteration using p3
a = ann_hardlim_activ(w*p3)

// t3 = 0, so there is error. Update weights with Wnew = Wold + epT
w = w + (t3-a)*(p3')


editor(ann_getToolboxPath() + "/demos/examples/NN2_exam2.sce", "readonly");


endfunction

NN2_exam1()
clear NN2_exam1