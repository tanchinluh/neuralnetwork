
function subdemolist = demo_gateway()
  demopath = get_absolute_file_path("NeuralNet.dem.gateway.sce");

  subdemolist = ["Adaptive Filter for noise filtering", "AdaptiveDemo.sce"; ..
                 "ANN FeedForward Backpropagation Levenberg–Marquardt algorithm training function", "TestMulti.sce"; ..
                 "ANN Self-Orginizing Map with 2d visualization", "FaceSOMDemo.sce"; ..
                 "More examples", "examples.dem.gateway.sce"];
                 
  subdemolist(:,2) = demopath + subdemolist(:,2);
  
endfunction

subdemolist = demo_gateway();
clear demo_gateway; // remove demo_gateway on stack
