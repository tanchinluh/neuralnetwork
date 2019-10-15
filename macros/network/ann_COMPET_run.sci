function [y,classes] = ann_COMPET_run(W,P)
// ANN Competitive Network simulation function
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
//     [y,classes] = ann_COMPET_run(W,P)
//
// Parameters
//     W : weights for the network
//     P : Testing input
//     y : Winning Neuron
//     classes : Classes for the input
//
// Description
//     Competitive network simulation function
//
// Examples
//    x = rand(2,10);
//    x(:,1:5) = x(:,1:5) + 1;
//    [W,b] =  ann_COMPET(x,2);
//    [y,classes] = ann_COMPET_run(W,x)
//
// See also
//     ann_COMPET
//     ann_COMPET_run
//     ann_COMPET_visualize3d
//
// Authors
//     Tan C.L. 
n = ann_negdist(W,P);
y = ann_compet_activ(n);
[maxval,classes] = max(y,'r');

endfunction