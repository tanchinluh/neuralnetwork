// Chapter 1 - Example 1: Activation Function

function NN1_exam1()

// Start of demo
load(ann_getToolboxPath() + "/demos/imgs/img1.sod");
msg = 'Activation Function Demo, press any key to continue...';
msgtitle = 'Activation Function';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
scf(101);Matplot(S,'082');gcf().axes_size = [638 201];
msg = ['p1 = 2.5;'
'p2 = 3;'
'w1 = 0.5;'
'w2 = -0.7;'
'b = 0.3;'
'n = w1*p1 + w2*p2 + b;']
msgtitle = 'Activation Function';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")

// Define parameters
p1 = 2.5;
p2 = 3;
w1 = 0.5;
w2 = -0.7;
b = 0.3;
n = w1*p1 + w2*p2 + b;

// Hardlimit Activation
a = ann_hardlim_activ(n);

// Show Hardlimit result
x = -1:0.01:1; y = ann_hardlim_activ(x);
scf(102);xgrid();plot(x,y);plot(n,a,'r*');gca().data_bounds = [-1 -1;1 2]; 

msg = ['n = ' + string(n)
'ann_hardlim_activ output : ' + string(a);]
msgtitle = 'Activation Function';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
xdel(102)

// Linear Activation
a = ann_purelin_activ(n);

// Show Linear result
x = -1:0.01:1; y = ann_purelin_activ(x);
scf(102);xgrid();plot(x,y);plot(n,a,'r*');gca().data_bounds = [-1 -1;1 1]; 

msg = ['n = ' + string(n)
'ann_purelin_activ output : ' + string(a);]
msgtitle = 'Activation Function';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
xdel(102)

// Logsig Activation
a = ann_logsig_activ(n);

// Show Logsig result
x = -10:0.01:10; y = ann_logsig_activ(x);
scf(102);xgrid();plot(x,y);plot(n,a,'r*');gca().data_bounds = [-10 -1;10 2]; 

msg = ['n = ' + string(n)
'ann_logsig_activ output : ' + string(a);]
msgtitle = 'Activation Function';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")

msg = 'End of demo, click exit to close all figures';
msgtitle = 'Activation Function';
btn = messagebox(msg, msgtitle, "info", "exit", "modal")
xdel(101:102)
//editor(ann_getToolboxPath() + "/demos/NN1_exam1.sce", "readonly");

endfunction

NN1_exam1();
clear NN1_exam1 
