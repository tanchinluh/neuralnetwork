//# GRADED FUNCTION: linear_backward

function [dA_prev, dW, db] = linear_backward(dZ, cache)
//    """
//    Implement the linear portion of backward propagation for a single layer (layer l)
//
//    Arguments:
//    dZ -- Gradient of the cost with respect to the linear output (of current layer l)
//    cache -- tuple of values (A_prev, W, b) coming from the forward propagation in the current layer
//
//    Returns:
//    dA_prev -- Gradient of the cost with respect to the activation (of the previous layer l-1), same shape as A_prev
//    dW -- Gradient of the cost with respect to W (current layer l), same shape as W
//    db -- Gradient of the cost with respect to b (current layer l), same shape as b
//    """
//    A_prev, W, b = cache
//    m = A_prev.shape[1]
    //A_prev, W, b = cache
    A_prev = cache(1);
    W = cache(2);
    b = cache(3);

    m = size(A_prev,2);
//
//    ### START CODE HERE ### (≈ 3 lines of code)
//    dW = (1. / m) * np.dot(dZ, cache[0].T) 
//    db = (1. / m) * np.sum(dZ, axis=1, keepdims=True)
//    dA_prev = np.dot(cache[1].T, dZ)

//  dZ = relu_backward(dA, activation_cache)
//            m(cnt) = evstr(af_d(cnt)+'(a('+string(cnt)+'))');
////            m(cnt) = evstr(af_d(cnt)+'(n('+string(cnt)+'))');
//            s(cnt) = m(cnt).*(W(cnt+1)(:,1:$-1)'*s(cnt+1));

    dW = (1/m).*dZ*A_prev'; 
    db = (1/m).*sum(dZ, 'c');

    dA_prev = W'*dZ
//    ### END CODE HERE ###
//
//    assert (dA_prev.shape == A_prev.shape)
//    assert (dW.shape == W.shape)
//    assert (db.shape == b.shape)
//    
//    return dA_prev, dW, db

endfunction
