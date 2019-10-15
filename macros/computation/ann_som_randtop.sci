function neuron_pos=ann_som_randtop(dim)
// Random topology function.
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
//     neuron_pos = ann_som_randtop(dim)
//
// Parameters
//      dim : dimension
//      neuron_pos : neurons position
//
// Description
//     This is the function to create Random topology neuron
//
// Examples
//    N = [5,5];
//    y = ann_som_randtop(N);
//    ann_som_plot2d(y);
//
// See also
//     ann_som_gridtop
//     ann_som_hextop
//
// Authors
//     Chenwei, modified and used in Scilab NN Toolbox by Tan C.L. 

dims= length(dim);
neuron_pos = zeros(dims,prod(dim));
//adding random noise 
noiseLen = 0.8;
noiseElement = (noiseLen^2)/dims;
noise = rand(dims,prod(dim)) * noiseElement;
//designing neuron position 
hexpos =ann_som_hextop(dim);
neuron_pos =  (hexpos + noise) * 0.6/noiseLen;
neuron_posmin = min(neuron_pos,'c');
neuron_pos = neuron_pos - neuron_posmin(:,ones(1,prod(dim)));
endfunction
