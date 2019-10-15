function z = ann_d_tansig_activ(y)
//  Derivative of Tangent Sigmoid activation function
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
//     z = ann_d_tansig_activ(y)
//
// Parameters
//      y : Input points
//      z : Derivative Output 
//
// Description
//     This function compute the derivation of Tangent Sigmoid activation function.
//
// See also
//     ann_tansig_activ
//
// Authors
//     Tan C.L. 

  z = 1-(y.*y);

endfunction