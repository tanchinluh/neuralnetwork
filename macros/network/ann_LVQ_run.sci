function [y,classes] = ann_LVQ_run(W,P)
//  ANN LVQ Network Simulation function
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
//     [y,classes] = ann_LVQ_run(W,P)
//
// Parameters
//     W : weights for the network
//     P : Testing input
//     y : Winning Neuron (Classes for the supervised portion of LVW Network)
//     classes : Classes for the input
//
// Description
//    LVQ network simulation function
//    
// Examples
//    x = rand(2,10);
//    x(:,1:5) = x(:,1:5) + 1;
//    T = [1 1 1 1 1 0 0 0 0 0;0 0 0 0 0 1 1 1 1 1]
//    [W,b] =  ann_LVQ1(x,T,4);
//    [y,classes] = ann_LVQ_run(W,x)
//
// See also
//     ann_LVQ1
//
// Authors
//     Tan C.L. 


//n = ann_negdist(W,P);
//y = ann_compet_activ(n);
//[maxval,classes] = max(y,'r');

Wa = sparse(W(:,:,1));
[ij,v,mn]=spget(Wa);
min_ij = min(ij,'r');
max_ij = max(ij,'r');
W1 = W(1:max_ij(1),1:max_ij(2),1);

Wb = sparse(W(:,:,2));
[ij,v,mn]=spget(Wb);
min_ij = min(ij,'r');
max_ij = max(ij,'r');
W2 = W(1:max_ij(1),1:max_ij(2),2);

n = ann_negdist(W1,P);
y1 = ann_compet_activ(n);
y = W2*y1;
[maxval,classes] = max(y,'r');

endfunction