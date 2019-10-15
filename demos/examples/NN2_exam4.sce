// Chapter 2 - Example 4: Prediction Network

function NN2_exam4()

// Creating Input sequence and Target sequence
time = 0:0.01:2;
P = sin(2.*%pi*5*time);
T = 2.*sin(2.*%pi*5*time-%pi/4);
plot(time,P,time,T);

// Create and train a network with different delays and compare the results
Delay = 5;
[w,b,y,ee] = ann_ADALINE_predict(P,T,0.05,1,Delay);
plot(T);
plot(y,'r')

editor(ann_getToolboxPath() + "/demos/examples/NN2_exam4.sce", "readonly");

endfunction

NN2_exam4()
clear NN2_exam4;