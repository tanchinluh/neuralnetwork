function y = ann_logsig_activ(x)
// Logistic Sigmoid activation function
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
//     y = ann_logsig_activ(x)
//
// Parameters
//     x : Input vector
//     y : Output vector
//
// Description
//    This is the Logistic Sigmoid activation function. 
//    
// Examples
//    x = [-10:0.05:10];
//    y = ann_logsig_activ(x);
//    plot(x,y,'.');
// 
// See also
//     ann_d_logsig_activ
//
// Authors
//     Tan C.L. 

y = 1 ./ (1+%e.^(-x));

endfunction

