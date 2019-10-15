
function demo_TestMulti()
  scf(0);


  // Main Calling File
  P = read(ann_getToolboxPath() + '/demos/NN4_exer2.dat',-1,4)';
  minmax = [min(P,'c') max(P,'c')];
  P(1,:) = (P(1,:) - minmax(1,1))/(minmax(1,2)-minmax(1,1));
  P(2,:) = (P(2,:) - minmax(2,1))/(minmax(2,2)-minmax(2,1));
  P(3,:) = (P(3,:) - minmax(3,1))/(minmax(3,2)-minmax(3,1));
  P(4,:) = (P(4,:) - minmax(4,1))/(minmax(4,2)-minmax(4,1));
  T = [-1.*ones(1,50) 0.*ones(1,50) 1.*ones(1,50)];
  N = [4 10 1];
  af = ['ann_tansig_activ','ann_purelin_activ'];
  
  W = ann_FFBP_lm(P,T,N,af,0.001,100000000,10,1000,1e-5, 1e-5);

  y = ann_FFBP_sim(P,W,af);

  figure();
  newaxes();
  plot(y);
  xtitle("ANN FeedForward Backpropagation Levenberg–Marquardt algorithm training function");
endfunction

demo_TestMulti()
clear demo_TestMulti;
