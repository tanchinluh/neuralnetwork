// Chapter 4 - Example 2 : 3D Classification

function NN4_exam2()

// Generating Data Cluster
m = 10; // number of data points 
d = 3; // number of dimensions
c = 8;  // Number of clusters
std = 0.05; // Standard deviation of each cluster
P = ann_gencluster(m,d,c,std);

// Visualizing Input Data
plot3dot(P(1,:),P(2,:),P(3,:),3,9);

// Create a three-neuron competitive network and train the network with the data
[W,b] =  ann_COMPET(P,8);

// Plot and compare the input vectors and cluster centres determined by the competitive network
figure(); newaxes();
plot3dot(P(1,:),P(2,:),P(3,:),3,2);
plot3dot(W(:,1),W(:,2),W(:,3),5,3);

// Extra - Animation
[W,b] =  ann_COMPET_visualize3d(P,8);

editor(ann_getToolboxPath() + "/demos/examples/NN4_exam2.sce", "readonly");

endfunction

NN4_exam2()
clear NN4_exam2
