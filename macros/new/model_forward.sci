function [AL, caches] = model_forward(X, parameters)
    // Forward propagation for Feed-forward Back-Propagation Network (New)
    //
    //    Copyright 2020 ByteCode.
    //    
    //    This program is free software: you can redistribute it and/or modify
    //    it under the terms of the GNU General Public License as published by
    //    the Free Software Foundation, either version 2 of the License, or
    //    (at your option) any later version.
    //    
    //    This program is distributed in the hope that it will be useful,
    //    but WITHOUT ANY WARRANTY; without even the implied warranty of
    //    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    //    GNU General Public License for more details.
    //    
    //    You should have received a copy of the GNU General Public License
    //    along with this program.  If not, see <http://www.gnu.org/licenses/
    //
    // Calling Sequence
    //     [AL, caches] = model_forward(X, net)
    //
    // Parameters
    //     X : Input data
    //     net : Network object which contains the parameters of the trained network. 
    //     AL : Output prediction
    //     caches : Internal caches for study purpose
    //
    // Description
    //    This function implement forward path for the model created with nn_train based on Andrew Ng's Coursera Deep-Learning Specialization Course.
    //    
    // Examples
    //    P = [1 2 3 4; 1 2 3 4]./2 - 1; // Simple Normalization
    //    Tc = [1 2 3 4];
    //    T = nn_onehot(Tc); // Convert to one-hot encoding
    //    N = [2,3,4];
    //    af = ['ann_relu','ann_softmax'];
    //    num_iterations = 200;
    //    net = initialize_parameters(N,[-0.01,0.01],af);
    //    net.mini_batch = 1;
    //    net.cost_type = 'categorical_crossentropy';
    //    net.lr = 0.05;
    //    net.l2 = 0.01;
    //    net = nn_train(net,P,T,num_iterations);
    //    y = model_forward(P, net);
    //    [maxV, maxI] = max(y,'r')
    //    disp(maxI);
    // 
    // See also
    //     nn_train
    //     initialize_parameters
    //     nn_onehot
    //     nn_split_data
    //     nn_eval_performance
    //
    // Authors
    //     Tan C.L. 
        
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

    
    
