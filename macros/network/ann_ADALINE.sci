function [w,b] = ann_ADALINE(P,T,alpha,itermax,initfunc)
// ANN ADALINE training function (batch training)
//
//    Copyright 2011 Trity Technologies.
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
//     [w,b] = ann_ADALINE(P,T)
//     [w,b] = ann_ADALINE(P,T,alpha,itermax,initfunc)
//
// Parameters
//     P : Training input
//     T : Training target
//     alpha : Learning Rate
//     itermaxs : Maximum Training Iteration
//     initfunc : Weight and Bias Initialize functions, either 'rand', 'zeros', or 'ones'
//     w : weights for the network
//     b : bias for the network
//
// Description
//     Adaptive Linear Neuron with batch training algorithm.
//
// Examples
//    P = [0 0 1 1 ; 0 1 0 1];
//    T = [0 0 0 1];
//    [w,b] = ann_ADALINE(P,T);
//    y = ann_ADALINE_run(P,w,b)
//
// See also
//     ann_ADALINE_online
//     ann_ADALINE_predict
//     ann_ADALINE_run
//
// Authors
//     Tan C.L.

rhs=argn(2);
lines(0);
// Error Checking
if rhs < 2; error("Expect at least 2 arguments, P and T"); end    
if rhs < 3; alpha = 0.01; end
if rhs < 4; itermax = 100; end
if rhs < 5; w = rand(size(T,1),size(P,1)); b = rand(size(T,1),1); end

//Initializing Weight and Bias
if  rhs == 5 then
    select initfunc
    case 'rand' then 
        w = rand(size(T,1),size(P,1));
        b = rand(size(T,1),1);
    case 'zeros' then
        w = zeros(size(T,1),size(P,1));
        b = zeros(size(T,1),1);
    case 'ones' then 
        w = ones(size(T,1),size(P,1));
        b = ones(size(T,1),1);        
    else 
        error("Wrong command for input argement 5");      
    end
end

if itermax == []; itermax = 100; end
if alpha == []; alpha = 0.01; end    

itercnt = 0;


while itercnt < itermax

    // Simulate Phase
    n = w*P + repmat(b,1,size(P,2));
    a = ann_purelin_activ(n);
    e = T - a;
    w = w + (2*alpha*e*P')./size(P,2);
    b = b + 2*alpha*mean(e,2);

    n = w*P +  repmat(b,1,size(P,2));
    a = ann_purelin_activ(n);
    e = T - a;   
    // Stopping Criteria
    mse = mean(e.^2);

    itercnt = itercnt + 1;
    disp('Epoch: ' + string(itercnt) + '  MSE: ' + string(mean(mse)));

end

endfunction