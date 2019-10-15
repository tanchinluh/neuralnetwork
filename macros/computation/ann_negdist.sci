function d = ann_negdist(w,x)
// Negative distance weight function
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
//     d=ann_negdist(w,x)
//
// Parameters
//      w : weight
//      x : input
//      d : negative distance
//
// Description
//     Calculate negative distance weight function
//
// Examples
//    w = [1 2 3;4 5 6];
//    x = [1 2; 3 4; 5 6];
//    d = ann_negdist(w,x)
//
// See also
//     ann_dist
//
// Authors
//     Chenwei, modified and used in Scilab NN Toolbox by Tan C.L.

temp=ann_dist(w,x);
d=-temp;
endfunction
