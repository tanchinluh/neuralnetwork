function [Z, cache] = linear_forward(A, W, b)
//    """
//    Implement the linear part of a layer's forward propagation.
//
//    Arguments:
//    A -- activations from previous layer (or input data): (size of previous layer, number of examples)
//    W -- weights matrix: numpy array of shape (size of current layer, size of previous layer)
//    b -- bias vector, numpy array of shape (size of the current layer, 1)
//
//    Returns:
//    Z -- the input of the activation function, also called pre-activation parameter 
//    cache -- a python dictionary containing "A", "W" and "b" ; stored for computing the backward pass efficiently
//    """
    
//    ### START CODE HERE ### (≈ 1 line of code)
//    Z = np.dot(W, A) + b
//    ### END CODE HERE ###
    // repmat(W(cnt)(:,$),1,size(T,2))
//    pause
    WA = W*A;
    Z = WA + repmat(b,1,size(WA,2));
    
//    assert(Z.shape == (W.shape[0], A.shape[1]))
//    cache = [A, W, b)
//    
//    return Z, cache
    cache = list(A, W, b);
    
endfunction 
