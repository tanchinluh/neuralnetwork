function Tout = nn_onehot(Tin)

    // One-hot
    X = Tin';
    LinearIndices = sub2ind([length(X),max(X)], [1:length(X)]', X);
    Tout = zeros(length(X), max(X)); 
    Tout(LinearIndices) = 1;
    Tout = Tout'; 

endfunction
