
function demo_SOM()

  if isdef('aivplib') then
    //Read Face Image
    S = imread(ann_getToolboxPath() + '/demos/aaa.jpg');
    imshow(S);

    //Image Processing
    S2 = rgb2gray(S);
    Threshold = imgraythresh(S2);
    //S3 = S2 > 150;
    S3 = im2bw(S2,Threshold);
    S4 = ~S3;
    imshow(S4);

    // Feature Extraction
    [x,y] = find(S4 == %t);
    plot(y,max(x) - x,'.');
    h = gca();
    h.children.children.mark_size = 1;

    // SOM
    P = [y;max(x)-x];
    W = ann_SOM_visualize2d(P,[8 8],200);
  else
    messagebox('This Demo required AIVP toolbox'); 
  end
endfunction

demo_SOM();
clear demo_SOM;
