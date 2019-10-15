function W = ann_ffbp_init(N, r)
// ANN FeedForward Backpropagation Weight initialization function.
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
//      W = ann_ffbp_init(N, r)
//
// Parameters
//      N : Number of Neurons in each layer, incluing Input and output layer
//      r : Range for the initialization values
//      W : Initial Weights
//
// Description
//     Initialize weight for FFBP Network
//
// Examples
//    N = [3 5 2];
//    r = [-10 10];
//    W = ann_ffbp_init(N, r)
//
// See also
//     ann_FFBP_gd
//     ann_FFBP_gda
//     ann_FFBP_gdm
//     ann_FFBP_gdx
//     ann_FFBP_lm
//     ann_FFBP_run
//
// Authors
//     Tan C.L.

// Checking Input Arguement
rhs=argn(2);

// Error Checking
if rhs < 2; r = [-0.1 0.1];end
    W = list(0);
    for cnt = 1:size(N,2)-1
        W(cnt) = [grand(N(cnt+1),N(cnt),'unf',r(1),r(2)),zeros(N(cnt+1),1)];
    end
endfunction

