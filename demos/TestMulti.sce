function demo_TestMulti()


    msg = 'Press any key to continue...';
    msgtitle = 'Multi-Level Output Network';
    btn = messagebox(msg, msgtitle, "info", "OK", "modal")
    // Main Calling File
    P = read(ann_getToolboxPath() + '/demos/dataset/NN4_exer2.dat',-1,4)';
    scf(101);plot(P');title('Input data'); legend(['x1','x2','x3','x4']);
    
    msg = 'Press any key to normalized data...';
    msgtitle = 'Multi-Level Output Network';
    btn = messagebox(msg, msgtitle, "info", "OK", "modal")
    
    minmax = [min(P,'c') max(P,'c')];
    P(1,:) = (P(1,:) - minmax(1,1))/(minmax(1,2)-minmax(1,1));
    P(2,:) = (P(2,:) - minmax(2,1))/(minmax(2,2)-minmax(2,1));
    P(3,:) = (P(3,:) - minmax(3,1))/(minmax(3,2)-minmax(3,1));
    P(4,:) = (P(4,:) - minmax(4,1))/(minmax(4,2)-minmax(4,1));
    scf(102);plot(P');title('Normalized Input data'); legend(['x1','x2','x3','x4']);
    
    msg = 'The output level for the data...';
    msgtitle = 'Multi-Level Output Network';
    btn = messagebox(msg, msgtitle, "info", "OK", "modal")
    T = [-1.*ones(1,50) 0.*ones(1,50) 1.*ones(1,50)];
    scf(102);plot(T,'k.-');
    
    msg = 'Press any key to train the network...';
    msgtitle = 'Multi-Level Output Network';
    btn = messagebox(msg, msgtitle, "info", "OK", "modal")
    xdel(102);
    
    N = [4 10 1];
    af = ['ann_tansig_activ','ann_purelin_activ'];
    scf(102);
    winId=progressionbar('Training in progress, view the command window for details...');
    W = ann_FFBP_lm(P,T,N,af,0.001,100000000,10,100,1e-5, 1e-5);
    close(winId);
    msg = 'Training Completed, press any key to compare the result...';
    msgtitle = 'Multi-Level Output Network';
    btn = messagebox(msg, msgtitle, "info", "OK", "modal")
    
//    xdel(gcf().figure_id)
   
    y = ann_FFBP_sim(P,W,af);

    scf(103);plot(T);plot(y,'rx');legend(['Target','Predicted'])
    xtitle("ANN FeedForward Backpropagation Levenberg–Marquardt algorithm training function");
    msg = 'End of demo, click exit to close all figures';
    msgtitle = 'AMulti-Level Output Network';
    btn = messagebox(msg, msgtitle, "info", "exit", "modal")
   
    xdel(101:103)
    
endfunction

demo_TestMulti()
clear demo_TestMulti;
