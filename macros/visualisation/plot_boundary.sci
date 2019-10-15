function plot_boundary(P,T,W)
    // Plot the data set
    plot_2group(P,T);
    // Create the input range grids
    nx = 20; ny = 20;
    xx = linspace(min(P(1,:)),max(P(1,:)),nx);
    yy = linspace(min(P(2,:)),max(P(2,:)),ny);
    [X,Y] = ndgrid(xx,yy);
    // Use the trained NN to classify the grid data
    P2 = [X(:)';Y(:)'];
    y2 = ann_FFBP_run(P2,W);
    // Extract the data according to the categories
    G0 = P2(:,find(round(y2)<=0))
    G1 = P2(:,find(round(y2)>=1))
    // Plot the boundary and the region for the groups
    plot(G0(1,:),G0(2,:),'go');plot(G1(1,:),G1(2,:),'bo');
endfunction
