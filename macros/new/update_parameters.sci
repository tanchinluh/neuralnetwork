function parameters = update_parameters(parameters, grads, learning_rate)
//    """
//    Update parameters using gradient descent
//    
//    Arguments:
//    parameters -- python dictionary containing your parameters 
//    grads -- python dictionary containing your gradients, output of L_model_backward
//    
//    Returns:
//    parameters -- python dictionary containing your updated parameters 
//                  parameters["W" + str(l)] = ... 
//                  parameters["b" + str(l)] = ...
//    """
//    
//    L = len(parameters) // 2 # number of layers in the neural network
    L = size(parameters.W);
//
//    # Update rule for each parameter. Use a for loop.
//    ### START CODE HERE ### (≈ 3 lines of code)
//    for l in range(L):
//        parameters["W" + str(l+1)] = parameters["W" + str(l+1)] - learning_rate * grads["dW" + str(l+1)]
//        parameters["b" + str(l+1)] = parameters["b" + str(l+1)] - learning_rate * grads["db" + str(l+1)]
    for l = 1:L
        parameters.W(l) = parameters.W(l) - learning_rate * grads.dW(l);
        parameters.b(l) = parameters.b(l) - learning_rate * grads.db(l);
    end
    
//    ### END CODE HERE ###
//        
//    return parameters


endfunction
