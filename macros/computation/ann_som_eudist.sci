function neuron_dist=ann_som_eudist(neuron_pos)
// Euclidean distance function.
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
//     neuron_dist=ann_som_eudist(neuron_pos)
//
// Parameters
//      neuron_pos : neuron positions
//      neuron_dist : distances between neurons
//
// Description
//     This is a distance function used to find the Euclidean distances between neurons.
//
// Examples
//    N = [1 2 3; 4 5 6; 7 8 9];
//    ann_som_eudist(N)
//
// See also
//     ann_som_boxdist
//     ann_som_linkdist
//     ann_som_mandist
//
// Authors
//     Chenwei, modified and used in Scilab NN Toolbox by Tan C.L. 

[dim,S]=size(neuron_pos);
neuron_dist=zeros(S,S);
for i=1:S
  for j=1:(i-1)
     neuron_dist(i,j)=sqrt(sum((neuron_pos(:,i)-neuron_pos(:,j)).^2));
  end
end
neuron_dist=neuron_dist+(neuron_dist)';
endfunction
