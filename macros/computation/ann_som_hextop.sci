function neuron_pos = ann_som_hextop(dim)
// Hexagonal topology function.
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
//     neuron_pos = ann_som_hextop(dim)
//
// Parameters
//      dim : dimension
//      neuron_pos : neurons position
//
// Description
//     This is the function to create Hexagonal topology neuron
//
// Examples
//    N = [5,5];
//    y = ann_som_hextop(N);
//    ann_som_plot2d(y);
//
// See also
//     ann_som_gridtop
//     ann_som_randtop
//
// Authors
//     Chenwei, modified and used in Scilab NN Toolbox by Tan C.L. 

dims= length(dim);
neuron_pos = zeros(dims,prod(dim));

len = 1;
neuron_pos(1,1) = 0;
cen = zeros(0,0);
//squishes = zeros(0,0);
for i=1:dims 
  dimi = dim(i);
  newlen = len*dimi;
  offset = sqrt(1-sum(sum(cen.^2),'c'));
  
  if (i>1)
    for j=2:dimi
      iShift = cen * ((j+1)-floor((j+1)/2)*2);
      doShift = iShift(:,ones(1,len));
      neuron_pos(1:(i-1),[1:len]+len*(j-1)) = neuron_pos(1:(i-1),1:len) + doShift;
    end
  end
  
  neuron_posi = [0:(dimi-1)]*offset;
  neuron_pos(i,1:newlen) = neuron_posi(floor((0:(newlen-1))/len)+1);
  
  len = newlen;
  cen = ([cen; 0]*i + [cen; offset])/(i+1);
end
endfunction
