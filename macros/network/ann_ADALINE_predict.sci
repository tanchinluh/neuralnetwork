function [w,b,y,ee] = ann_ADALINE_predict(X,T,alpha,itermax,D,initfunc)
// ANN ADALINE training function (incremental training with tapped delay)
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
//     [w,b] = ann_ADALINE_predict(P,T,alpha)
//     [w,b] = ann_ADALINE_predict(P,T,alpha,itermax,D,initfunc)
//
// Parameters
//      X : Training input
//      T : Training target
//      alpha : Learning Rate
//      itermaxs : Maximum Training Iteration
//      D : number of delays 
//      initfunc : Weight and Bias Initialize functions, either 'rand', 'zeros', or 'ones'
//      w : weights for the network
//      b : bias for the network
//      y : Predicted output
//      ee : Error between T and y 
//
// Description
//     Adaptive Linear Neuron with incremental (going throught data one by one) training algorithm and tapped delay
//
// Examples
//    x = 0:0.02:20;
//    P = sin(x);
//    T = 2.*sin(x - 0.2);
//    plot(x,P,x,T);
//    
//    // Create and train a network to preduct T from P 
//    Delay = 3;
//    [w,b,y,ee] = ann_ADALINE_predict(P,T,0.2,1,Delay);
//    figure(); plot(T); plot(y,'r');
//
// See also
//     ann_ADALINE
//     ann_ADALINE_online
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
if rhs < 5; D = 1; end    
if rhs < 6; w = rand(size(T,1),D); b = rand(size(T,1),1); end

//Initializing Weight and Bias
if  rhs == 6 then
    select initfunc
    case 'rand' then 
        w = rand(size(T,1),D);
        b = rand(size(T,1),1);
    case 'zeros' then
        w = zeros(size(T,1),D);
        b = zeros(size(T,1),1);
    case 'ones' then 
        w = ones(size(T,1),D);
        b = ones(size(T,1),1);        
    else 
        error("Wrong command for input argement 5");      
    end
end

if itermax == []; itermax = 100; end
if alpha == []; alpha = 0.01; end    
if D == []; D = 1; end  

itercnt = 0;

// Reshape Input with correspond to the delays
P = [];
for cnt = 1:D
    P = [P; X(cnt:$-D+cnt-1)];
end
T = T(1:$-D+1);

//for cnt = 1:N
//    P = [P; X(cnt:$-N+cnt-1)];
//end
//T = T(1:$-N+1);

while itercnt < itermax

    no_err = 0
    for cnt = 1:size(P,2)
        n = w*P(:,cnt)+b;
        a = ann_purelin_activ(n);
        //e = T - a;
        e = T(:,cnt) - a;
        y(cnt) = a;  
        ee(cnt) = e;            
        w = (w + 2*alpha*e*P(:,cnt)');
        b = b + 2*alpha*e;
        e_all(cnt) = e.^2;
    end
    itercnt = itercnt + 1;
    disp('Epoch: ' + string(itercnt) + '  MSE: ' + string(mean(e_all)));

end

endfunction