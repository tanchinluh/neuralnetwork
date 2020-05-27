function net = nn_train(net,X,Y,num_iterations)
    // Feed-forward Back-Propagation Network (New)
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
    //     net = nn_train(net,X,Y,num_iterations)
    //
    // Parameters
    //     net : Network object which contains the parameters of the network created and trained. 
    //     X : Training data, in m x n matrix, where m is the features, n is different datasets
    //     Y : Target data, in 1 x n vector, where the value shall be the classes which correspond to each set of data in x
    //     num_iterations : Iteration to run
    //
    // Description
    //    Feed-forward Back-Propagation Network Base on Andrew Ng's Coursera Deep-Learning Specialization Course.
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
    //     initialize_parameters
    //     nn_onehot
    //     nn_split_data
    //     nn_eval_performance
    //     model_forward
    //
    // Authors
    //     Tan C.L. 

    grads = tlist(["listtype","dA","dW","db"], list(), list(), list());

    [m,n] = size(X);
    ind = 1:n;
    if net.mini_batch == 0 then
        net.mini_batch = n;
    end

    if net.mini_batch > n then
        net.mini_batch = 1;
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
