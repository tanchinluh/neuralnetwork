function y = ann_compet_activ(x)
// Competitive Activation Function 
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
//     y = ann_compet_activ(x)
//
// Parameters
//     x : Input vector/matrix, one column represent 1 set of data
//     y : Output vector/matrix with winning neuron
//
// Description
//    This is the activation function for competitive network, in which it will return the winning neoron as 1, while others as 0.
//    
// Examples
//    ann_compet_activ(rand(5,5))
// 
// See also
//     ann_compet_init
//     ann_COMPET
//
// Authors
//     Tan C.L. 

[r,c] = size(x);
[maxval,maxind] = max(x,'r');
t = sparse([maxind(:),[1:c]'],ones(1,c),[r,c]);
y=full(t);

endfunction