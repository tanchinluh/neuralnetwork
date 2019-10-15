function neuron_dist=ann_som_linkdist(neuron_pos)
// Link distance function.
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
//     neuron_dist=ann_som_linkdist(neuron_pos)
//
// Parameters
//      neuron_pos : neuron positions
//      neuron_dist : distances between neurons
//
// Description
//     This is a distance function used to find the link distances between neurons.
//
// Examples
//    N = [1 2 3; 4 5 6; 7 8 9];
//    ann_som_linkdist(N)
//
// See also
//     ann_som_boxdist
//     ann_som_eudist
//     ann_som_mandist
//
// Authors
//     Chenwei, modified and used in Scilab NN Toolbox by Tan C.L. 

[dim,S]=size(neuron_pos);
links = double((ann_som_eudist(neuron_pos) <= 1.00001).*(1-eye(S,S)));

neuron_dist = S*(1-eye(S,S));
index = eye(S,S);
for i=1:S
  nextindex = (index*links) | index;
  newindex = nextindex & ~index;
  ind = find(newindex);
  if length(ind) == 0
    break;
  end
  neuron_dist(ind) = i;
  index = nextindex
end
endfunction
