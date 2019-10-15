function dZ = ann_logsig_backward(dA, cache)
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

    Z = cache;
//    
//    s = 1/(1+np.exp(-Z))
//    dZ = dA * s * (1-s)
    // z = y .* (1 - y);
//    // y = 1 ./ (1+%e.^(-x));
    s = 1./(1+%e.^(-Z));
    dZ = dA .* s .* (1-s);
//    
//    assert (dZ.shape == Z.shape)
//    
//    return dZ
    
endfunction
