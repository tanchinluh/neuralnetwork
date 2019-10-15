function [cost,dAL] = compute_cost(AL, Y, cost_type)
    //    """
    //    Implement the cost function defined by equation (7).
    //
    //    Arguments:
    //    AL -- probability vector corresponding to your label predictions, shape (1, number of examples)
    //    Y -- true "label" vector (for example: containing 0 if non-cat, 1 if cat), shape (1, number of examples)
    //
    //    Returns:
    //    cost -- cross-entropy cost
    //    """
    //    
    //    m = Y.shape[1]

    //m = size(Y,2);
    [n,m] = size(Y);
    //
    //    # Compute loss from aL and y.
    //    ### START CODE HERE ### (≈ 1 lines of code)
    //    cost = (-1./ m) * np.sum(np.multiply(Y, np.log(AL)) + np.multiply((1-Y), np.log( 1-AL)))
    //pause

    //     dAL = -((Y./AL)-(1-Y)./(1-AL));


    select cost_type
    case 'mse'
        //     Cost function for MSE 
        cost = (1./ m) * sum((AL-Y).^2); 
    case 'crossentropy'
        //     Cost function for crossentropy 
        cost = (-1./ m) * sum(Y.*log(AL) + (1-Y).*log(1-AL)); 
    case 'categorical_crossentropy'
        cost = (-1./ m) *sum(Y.*log(AL));
    end

    //     dAL_s =  (2./ m) * sum((AL-Y),1);
    //     dAL = repmat(dAL_s,n,1);

    // Cost function for softmax
    //       cost = -sum(Y.*log(AL));
    //       dAL = -(Y./AL);
    //        cost = (-1./ m) * sum(Y.*log(AL));
    //       dAL = -(Y./AL);
    //       cost = (1./ m) * sum((AL-Y).^2); 
    //       dAL = AL-Y;


    dAL = AL-Y;

    //      e = Y-AL;
    //      cost = mean(e.^2);
    ////      (-2*m(layers).*e);

    //    ### END CODE HERE ###
    //    
    //    cost = np.squeeze(cost)      # To make sure your cost's shape is what we expect (e.g. this turns [[17]] into 17).
    //    assert(cost.shape == ())
    //    
    //    return cost

endfunction
