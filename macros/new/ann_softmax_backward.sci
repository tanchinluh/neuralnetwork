function dZ = ann_softmax_backward(dA, cache)
//    """
//    Implement the backward propagation for a single SIGMOID unit.
//
//    Arguments:
//    dA -- post-activation gradient, of any shape
//    cache -- 'Z' where we store for computing backward propagation efficiently
//
//    Returns:
//    dZ -- Gradient of the cost with respect to Z
//    """
//    
//    Z = cache
//
    Z = cache;

    [m,n] = size(Z);
//pause
//    s = exp(Z)./repmat(sum(exp(Z),1),m,1);
////    dZ = dA .* s .* (1-s);
//    dZ = dA;
//    
//    assert (dZ.shape == Z.shape)
//    
//    return dZ
    
endfunction
