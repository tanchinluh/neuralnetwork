//# GRADED FUNCTION: model_forward

function [AL, caches] = model_forward(X, parameters)
//    """
//    Implement forward propagation for the [LINEAR->RELU]*(L-1)->LINEAR->SIGMOID computation
//    
//    Arguments:
//    X -- data, numpy array of shape (input size, number of examples)
//    parameters -- output of initialize_parameters_deep()
//    
//    Returns:
//    AL -- last post-activation value
//    caches -- list of caches containing:
//                every cache of linear_relu_forward() (there are L-1 of them, indexed from 0 to L-2)
//                the cache of linear_sigmoid_forward() (there is one, indexed L-1)
//    """
//
//    caches = []
//    A = X
//    L = len(parameters) // 2                  # number of layers in the neural network

    caches = [];
    A = X;
    L = size(parameters.W);
    
//    
//    # Implement [LINEAR -> RELU]*(L-1). Add "cache" to the "caches" list.
//    for l in range(1, L):
//        A_prev = A 
//        ### START CODE HERE ### (≈ 2 lines of code)
//        A, cache = linear_activation_forward(A_prev, 
//                                             parameters["W" + str(l)], 
//                                             parameters["b" + str(l)], 
//                                             activation='relu')
//        caches.append(cache)
    caches = list()
    for l = 1:L-1
        A_prev = A;
        [A, cache] = linear_activation_forward(A_prev,parameters.W(l),parameters.b(l),parameters.af(l));
        caches($+1) = cache;
    end
    

//
//        ### END CODE HERE ###
//    
//    # Implement LINEAR -> SIGMOID. Add "cache" to the "caches" list.
//    ### START CODE HERE ### (≈ 2 lines of code)
//    AL, cache = linear_activation_forward(A, 
//                                             parameters["W" + str(L)], 
//                                             parameters["b" + str(L)], 
//                                             activation='sigmoid')
//    caches.append(cache)
//    
//    ### END CODE HERE ###

    [AL, cache] = linear_activation_forward(A,parameters.W(L),parameters.b(L),parameters.af(L))
    caches($+1) = cache;

//    
//    assert(AL.shape == (1,X.shape[1]))
//            
//    return AL, caches
    
endfunction

    
    
