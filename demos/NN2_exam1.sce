// Chapter 2 - Example 1: Testing Example

function NN2_exam1()

// Start of demo
load(ann_getToolboxPath() + "/demos/imgs/img2.sod");
msg = 'Simple perceptron demo, press any key to continue...';
msgtitle = 'Understanding Perceptron''s Weights Update';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
scf(101);Matplot(S,'082');gcf().axes_size = [808 452];
msg = ['p1 = [1;2]; p2 = [-1;2]; p3 = [0;-1];'
't1 = 1; t2 = 0; t3 = 0;']
msgtitle = 'Activation Function';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")

// Define Inputs and Targets
p1 = [1 2]'; p2 = [-1 2]'; p3 = [0 -1]';
t1 = 1; t2 = 0; t3 = 0;
p = [p1 p2 p3];
t = [t1 t2 t3];

// Let’s randomly choose w = [1 -0.8];
w = [1 -0.8];

// Visualization i=0
scf(102);xgrid();plot_2group(p,t);plot_weight(w);
msg = ['w = [1 -0.8];']
msgtitle = 'Initial weights';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
xdel(102)

// 1st iteration using p1
a = ann_hardlim_activ(w*p1)

// t1 = 1, so there is error. Update weights with Wnew = Wold + epT
w = w + (t1-a)*(p1')

// Visualization i=i
scf(102);xgrid();plot_2group(p,t);plot_weight(w);
msg = ['w = [' + string(w(1)) + ' ' + string(w(2)) + '];'];
msgtitle = 'Initial weights';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
xdel(102)

// 2nd iteration using p2
a = ann_hardlim_activ(w*p2)

// t2 = 0, so there is error. Update weights with Wnew = Wold + epT
w = w + (t2-a)*(p2')

// Visualization i=2
scf(102);xgrid();plot_2group(p,t);plot_weight(w);
msg = ['w = [' + string(w(1)) + ' ' + string(w(2)) + '];'];
msgtitle = 'Initial weights';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
xdel(102)

// 3rd iteration using p3
a = ann_hardlim_activ(w*p3)

// t3 = 0, so there is error. Update weights with Wnew = Wold + epT
w = w + (t3-a)*(p3')

// Visualization i=3
scf(102);xgrid();plot_2group(p,t);plot_weight(w);
msg = ['w = [' + string(w(1)) + ' ' + string(w(2)) + '];'];
msgtitle = 'Initial weights';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
xdel(102)

//editor(ann_getToolboxPath() + "/demos/examples/NN2_exam2.sce", "readonly");
msg = 'End of demo, click exit to close all figures';
msgtitle = 'Understanding Perceptron''s Weights Update';
btn = messagebox(msg, msgtitle, "info", "exit", "modal")
xdel(101)

endfunction

NN2_exam1()
clear NN2_exam1
