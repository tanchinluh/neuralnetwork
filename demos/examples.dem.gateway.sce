
function subdemolist = ann_examples_gateway()
  subdemolist = ["Activation Function", "NN1_exam1.sce"; ..
                 "Testing Example", "NN2_exam1.sce"; ..
                 "Training Perceptron", "NN2_exam2.sce"; ..
                 "Training Linear Network", "NN2_exam3.sce"; ..
                 "Prediction Network", "NN2_exam4.sce"; ..
                 "Comparing Different Training Algorithms", "NN3_exam1.sce"; ..
                 "Choice of Architecture", "NN3_exam2.sce"; ..
                 "Classification using Competitive Network", "NN4_exam1.sce"; ..
                 "3D Classification", "NN4_exam2.sce"; ..
                 "Creating and Training the SOM", "NN4_exam3.sce"; ..
                 "Classification using LVQ Network", "NN4_exam3.sce"]; 
                 
  subdemolist(:,2) = ann_getToolboxPath() + "/demos/examples/" + subdemolist(:,2);
  
endfunction

subdemolist = ann_examples_gateway();
clear ann_examples_gateway;
