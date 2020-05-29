
function demo_SOM()

//    For use with IPCV
//    //Read Face Image
//    S = imread(ann_getToolboxPath() + '/demos/aaa.jpg');
//    imshow(S);
//
//    //Image Processing
//    S2 = rgb2gray(S);
//    Threshold = imgraythresh(S2);
//    //S3 = S2 > 150;
//    S3 = im2bw(S2,Threshold);
//    S4 = ~S3;
//    imshow(S4);
//
//    // Feature Extraction
//    [x,y] = find(S4 == %t);
//    plot(y,max(x) - x,'.');
//    //h = gca();
//    //h.children.children.mark_size = 1;
    load(ann_getToolboxPath() + "/demos/dataset/som_data.sod");
    msg = 'Press any key to start SOM Demo';
    msgtitle = 'SOM Demo';
    btn = messagebox(msg, msgtitle, "info", "OK", "modal")
    // SOM
    
    P = [y;max(x)-x];
    W = ann_SOM_visualize2d(P,[8 8],100);
    
    msg = 'End of demo, click exit to close all figures';
    msgtitle = 'SOM Demo';
    btn = messagebox(msg, msgtitle, "info", "exit", "modal")
    xdel(gcf().figure_id);

endfunction

demo_SOM();
clear demo_SOM;
