function [net] = initialize_parameters(N,r,af,lr,cost_type,l2,mini_batch)
    // Initialize Network Object for Feed-forward Back-Propagation Network (New)
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
    //     [net] = initialize_parameters(N)
    //     [net] = initialize_parameters(N,r,af,lr,costfn,l2,mini_batch,cost_type)
    //
    // Parameters
    //     N : Network topology, in 1 x m layers including input and output layers, [Input layer nodes, Hidden layer nodes, Output layer nodes]. If the network is more than one hidden layer, repeat with another number in the "Hidden layer nodes" part.  
    //     r : Range of the weights initial values
    //     af : Activation functions for each layers
    //     lr : Learning rate
    //     cost_type : Function to calculate cost, currently support "mse", "crossentropy", "categorical_crossentropy"
    //     l2 : L2 regularization 
    //     mini_batch : Minibatch size
    //
    // Description
    //    Initialize Network Object for Feed-forward Back-Propagation Network Base on Andrew Ng's Coursera Deep-Learning Specialization Course.
    //    
    // Examples
    //    net = initialize_parameters([3 10 2]);
    // 
    // See also
    //     nn_train
    //     nn_onehot
    //     nn_split_data
    //     nn_eval_performance
    //     model_forward
    //
    // Authors
    //     Tan C.L. 
        
//    """
//    Argument:
//    n_x -- size of the input layer
//    n_h -- size of the hidden layer
//    n_y -- size of the output layer
//    
//    Returns:
//    parameters -- python dictionary containing your parameters:
//                    W1 -- weight matrix of shape (n_h, n_x)
//                    b1 -- bias vector of shape (n_h, 1)
//                    W2 -- weight matrix of shape (n_y, n_h)
//                    b2 -- bias vector of shape (n_y, 1)
//    """

//    np.random.seed(1)
//    
//    //### START CODE HERE ### (≈ 4 lines of code)
//    W1 = np.random.randn(n_h, n_x) * 0.012
//    b1 = np.zeros(shape=(n_h, 1))
//    W2 = np.random.randn(n_y, n_h) * 0.01
//    b2 = np.zeros(shape=(n_y, 1))
//    //### END CODE HERE ###
// Checking Input Arguement
rhs = argn(2);
if rhs<2 then r = [-0.01,0.01]; end;
if rhs<3 then
  for i = 1:length(N)-1
    af(i) = "ann_relu";
  end;
  af(i) = "ann_logsig";
end;

//lr,costfn,l2)
if rhs<4 then lr = 0.1; end;
if rhs<5 then cost_type = 'categorical_crossentropy'; end;
if rhs<6 then l2 = 0.01; end;
if rhs<7 then mini_batch = 0; end;
//if rhs<8 then cost_type = 'categorical_crossentropy'; end;


if r==[] then r = [-0.01,0.01];end;
if af==[] then af = ["ann_relu","ann_logsig"];end;
if lr==[] then lr = 0.1; end;
if cost_type==[] then costfn = 'categorical_crossentropy'; end;
if l2==[] then l2 = 0.01; end;
if mini_batch==[] then mini_batch = 0; end;
//if cost_type==[] then cost_type = 'categorical_crossentropy'; end;

W = list(0);
b = list(0);
for cnt = 1:size(N,2)-1
  W(cnt) = grand(N(cnt+1),N(cnt),"unf",r(1),r(2));
  b(cnt) = zeros(N(cnt+1),1);
end;

net.W = W;
net.b = b;
net.af = af;
net.l2 = l2;
net.lr = lr;
//net.costfn = costfn;
net.mini_batch = mini_batch;
net.cost_type = cost_type;
//    assert(W1.shape == (n_h, n_x))
//    assert(b1.shape == (n_h, 1))
//    assert(W2.shape == (n_y, n_h))
//    assert(b2.shape == (n_y, 1))
//    
//    parameters = {"W1": W1,
//                  "b1": b1,
//                  "W2": W2,
//                  "b2": b2}

//    return parameters   
endfunction

