function [w,b]=ann_compet_init(x,s)
// ANN Competitive Network initialization function
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
//     [w,b]=ann_compet_init(x,s)
//
// Parameters
//      x : Input dataset
//      s : The number of competitive layer's neurons 
//      w : Initial Output Weight
//      b : Initial output bias
//
// Description
//     Competitive network initialization function
//
// Examples
//    P = [1 2 3;4 5 6]
//    s = 5;
//    [w,b]=ann_compet_init(P,s)
//
// See also
//     ann_COMPET
//
// Authors
//     Chenwei, modified and used in Scilab NN Toolbox by Tan C.L. 


[lsh,rsh]=argn(0);
if(rsh<2),error('not enough input');end

//initalize weight matix
pr=[min(x,'c'),max(x,'c')];
w=mean(pr,'c')';
w = w(ones(1,s),:);

//initalize bias vector
//c :conscience value
c = ones(s,1)/s;
b = exp(1 - log(c));
endfunction
