function dZ = ann_purelin_backward(dA, cache)
//    """
//    Implement the backward propagation for a single RELU unit.
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
//    dZ = np.array(dA, copy=True) # just converting dz to a correct object.
//    
//    # When z <= 0, you should set dz to 0 as well. 
//    dZ[Z <= 0] = 0
//    dZ = dA;
    dZ = dA .*ones(dA);
//    
//    assert (dZ.shape == Z.shape)
//    
//    return dZ
    
endfunction
