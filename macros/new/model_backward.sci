//# GRADED FUNCTION: L_model_backward
function grads = model_backward(dAL, Y, caches, parameters)
//    """
//    Implement the backward propagation for the [LINEAR->RELU] * (L-1) -> LINEAR -> SIGMOID group
//    
//    Arguments:
//    AL -- probability vector, output of the forward propagation (L_model_forward())
//    Y -- true "label" vector (containing 0 if non-cat, 1 if cat)
//    caches -- list of caches containing:
//                every cache of linear_activation_forward() with "relu" (it's caches[l], for l in range(L-1) i.e l = 0...L-2)
//                the cache of linear_activation_forward() with "sigmoid" (it's caches[L-1])
//    
//    Returns:
//    grads -- A dictionary with the gradients
//             grads["dA" + str(l)] = ... 
//             grads["dW" + str(l)] = ...
//             grads["db" + str(l)] = ... 
//    """
//    grads = {}
//    L = len(caches) # the number of layers
//    m = AL.shape[1]
//    Y = Y.reshape(AL.shape) # after this line, Y is the same shape as AL

//pause
    grads = tlist(["listtype","dA","dW","db"], list(), list(), list());
    L = size(caches) // the number of layers
    m = size(dAL,2);
    //Y = Y.reshape(AL.shape) // after this line, Y is the same shape as AL

//    
//    # Initializing the backpropagation
//    ### START CODE HERE ### (1 line of code)
//    dAL = - (np.divide(Y, AL) - np.divide(1 - Y, 1 - AL))
//    dAL = - ((Y./AL) - (1-Y)./(1-AL));
    
//    s = 1./(1+%e.^(-Z));
//    dZ = dA .* s .* (1-s);
//    
//    ### END CODE HERE ###
//    
//    # Lth layer (SIGMOID -> LINEAR) gradients. Inputs: "AL, Y, caches". Outputs: "grads["dAL"], grads["dWL"], grads["dbL"]
//    ### START CODE HERE ### (approx. 2 lines)
//    current_cache = caches[-1]
//    grads["dA" + str(L)], grads["dW" + str(L)], grads["db" + str(L)] = linear_activation_backward(dAL, current_cache, activation="sigmoid")
    current_cache = caches($);
    //[grads.dA(L), grads.dW(L), grads.dB(L)] = linear_activation_backward(dAL, current_cache, "ann_logsig");
    //[dA_prev_temp, dW_temp, db_temp] = linear_activation_backward(dAL, current_cache, af(L));
    [dA_prev_temp, dW_temp, db_temp] = linear_activation_backward_last(dAL, current_cache);
    grads.dA(L) = dA_prev_temp;
    grads.dW(L) = dW_temp;
    grads.db(L) = db_temp;
//    disp(dA_prev_temp);
//    disp(dW_temp);
//    disp(db_temp);
//    ### END CODE HERE ###
//    
//    for l in reversed(range(L-1)):
//        # lth layer: (RELU -> LINEAR) gradients.
//        # Inputs: "grads["dA" + str(l + 2)], caches". Outputs: "grads["dA" + str(l + 1)] , grads["dW" + str(l + 1)] , grads["db" + str(l + 1)] 
//        ### START CODE HERE ### (approx. 5 lines)
//        current_cache = caches[l]
//        
//        dA_prev_temp, dW_temp, db_temp = linear_activation_backward(grads["dA" + str(l + 2)], current_cache, activation="relu")
//        grads["dA" + str(l + 1)] = dA_prev_temp
//        grads["dW" + str(l + 1)] = dW_temp
//        grads["db" + str(l + 1)] = db_temp
//        ### END CODE HERE ###
    for l = (L-1):-1:1  // in python, range L-1 exclude L-1
        // lth layer: (RELU -> LINEAR) gradients.
        // Inputs: "grads["dA" + str(l + 2)], caches". Outputs: "grads["dA" + str(l + 1)] , grads["dW" + str(l + 1)] , grads["db" + str(l + 1)] 
        //## START CODE HERE ### (approx. 5 lines)
        current_cache = caches(l)
        
        [dA_prev_temp, dW_temp, db_temp] = linear_activation_backward(grads.dA(l + 1),current_cache, parameters.af(l));
        grads.dA(l) = dA_prev_temp;
        grads.dW(l) = dW_temp + parameters.l2.*parameters.W(l);
        grads.db(l) = db_temp;
        //## END CODE HERE ###
    end
    
//    return grads
    
endfunction
