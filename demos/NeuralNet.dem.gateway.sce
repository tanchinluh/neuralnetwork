
function subdemolist = demo_gateway()
  demopath = get_absolute_file_path("NeuralNet.dem.gateway.sce");

  subdemolist = ["Activation Functions Demo","NN1_exam1.sce"; ..
                 "Understanding Perceptron''s Weights Update","NN2_exam1.sce"; ..
                 "Training Perceptron","NN2_exam2.sce"; ..
                 "Training Linear Network","NN2_exam3.sce"; ..
                 "Training FFBP Network (GD)","NN2_exam4.sce"; ..
                 "Adaptive Filter for noise filtering", "AdaptiveDemo.sce"; ..
                 "ANN FeedForward Backpropagation Levenberg–Marquardt algorithm training function", "TestMulti.sce"; ..
                 "ANN Self-Orginizing Map with 2d visualization", "FaceSOMDemo.sce";];
                 
  subdemolist(:,2) = demopath + subdemolist(:,2);
  
endfunction

subdemolist = demo_gateway();
clear demo_gateway; // remove demo_gateway on stack
