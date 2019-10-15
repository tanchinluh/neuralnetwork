function z = ann_d_relu_activ(y)
// Derivative of Rectified linear activation function
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
//     z = ann_d_relu_activ(y)
//
// Parameters
//     y : Input vector
//     z : Output vector
//
// Description
//    This is the derivative of rectified linear activation function. 
//    
// 
// See also
//     ann_relu_activ
//
// Authors
//     Tan C.L. 

z = max(0,y);

endfunction

