function y = ann_PERCEPTRON_run(P,w,b)
// ANN Perceptron simulate function.
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
//     y = ann_PERCEPTRON_run(P,w,b)
//
// Parameters
//     P : Testing input
//     w : weights for the network
//     b : bias for the network
//     y : simulated output
//
// Description
//     This funtion is a simple perceptron simulation function. Use after w and b created, either manually or by function ann_PERCEPTRON
//
// Examples
//     P = [0 0 1 1 ; 0 1 0 1];
//     T = [0 0 0 1];
//     [w,b] = ann_PERCEPTRON(P,T);
//     y = ann_PERCEPTRON_run(P,w,b)
// 
// See also
//     ann_PERCEPTRON
//     ann_PERCEPTRON_visualize
//
// Authors
//     Tan C.L.

//w = zeros(size(P,1),1);
y = ann_hardlim_activ(w*P+repmat(b,1,size(P,2)));


endfunction