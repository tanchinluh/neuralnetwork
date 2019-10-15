function z = ann_d_softmax_activ(y)
// Derivative of softmax activation function
//
//    Copyright 2011-2018 Trity Technologies.
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
//     z = ann_d_softmax_activ(y)
//
// Parameters
//     y : Input vector
//     z : Output vector
//
// Description
//    This is the derivative of softmax activation function. 
//    
// Examples
//    x = [-10:0.05:10];
//    y = ann_d_softmax_activ(x);
//    plot(x,y,'.');
// 
// See also
//     ann_softmax_activ
//
// Authors
//     Tan C.L. 

//y = 1 ./ (1+%e.^(-x));
//y = exp(x)./sum(exp(x));

z = diag(y)-y*y';

endfunction

