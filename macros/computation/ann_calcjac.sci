function jac = ann_calcjac(P, s)
//  Calculate Jacobian Matrix
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
// Description
//    This function is called by ann_FFBP_lm to calculate Jacobian matrix as part of the Levenberg–Marquardt algorithm.
//
// See also
//     ann_FFBP_lm
//
// Authors
//     Tan C.L. 

  rhs = argn(2);
  
  if rhs ~= 2 then 
    error('2 inputs arguments expected');
  end,
  
  [r1,q] = size(s);
  [r2,q] = size(P);
  
  jac = (P'.*.ones(1, r1)) .* (ones(1, r2).*.s');
  
endfunction
