function [net] = initialize_parameters(N,r,af,lr,costfn,l2,mini_batch,cost_type)
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
if rhs<5 then costfn = 'cross_entropy'; end;
if rhs<6 then l2 = 0.01; end;
if rhs<7 then mini_batch = 0; end;
if rhs<8 then cost_type = 'categorical_crossentropy'; end;


if r==[] then r = [-0.01,0.01];end;
if af==[] then af = ["ann_relu","ann_logsig"];end;
if lr==[] then lr = 0.1; end;
if costfn==[] then costfn = 'cross_entropy'; end;
if l2==[] then l2 = 0.01; end;
if mini_batch==[] then mini_batch = 0; end;
if cost_type==[] then cost_type = 'categorical_crossentropy'; end;

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
net.costfn = costfn;
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

