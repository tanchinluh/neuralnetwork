function net = nn_train(net,X,Y,num_iterations)

    grads = tlist(["listtype","dA","dW","db"], list(), list(), list());

    [m,n] = size(X);
    ind = 1:n;
    if net.mini_batch == 0 then
        net.mini_batch = n;
    end
    mini_batch_size = net.mini_batch;
    last_batch_exist = modulo(n,mini_batch_size)~=0;

    for i = 1:num_iterations

        if  modulo(i,10) == 0
            mprintf('Epoch %i / %i',i,num_iterations);
            mprintf('[');
        end

        for cnt = 1:floor(n/mini_batch_size)

            if last_batch_exist
                X_mini = X(:,ind((cnt-1)*mini_batch_size+1:$));
                Y_mini = Y(:,ind((cnt-1)*mini_batch_size+1:$));
            else
                X_mini = X(:,ind((cnt-1)*mini_batch_size+1:cnt*mini_batch_size));
                Y_mini = Y(:,ind((cnt-1)*mini_batch_size+1:cnt*mini_batch_size));
            end

            [AL, caches] = model_forward(X_mini, net)
            [cost,dAL] = compute_cost(AL, Y_mini,net.cost_type)
            grads = model_backward(dAL, Y, caches,net)
            net = update_parameters(net, grads, net.lr)
            //if  modulo(i,10) == 0
             mprintf('.');
            //end
        end

        if  modulo(i,10) == 0
            mprintf('>] ');
            mprintf('loss: %f\n',cost);
        end

        costs(i) = cost;
    end
    plot(costs);

endfunction

// Normal Batch Processing 
//        [AL, caches] = model_forward(X, net);
//        [cost,dAL] = compute_cost(AL, Y);
//        grads = model_backward(dAL, Y, caches,net);
//        net = update_parameters(net, grads, net.lr);
