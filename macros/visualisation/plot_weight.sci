function plot_weight(w,b)
// Plot the boundary for simple perceptron
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
//     plot_weight(w,b)
//
// Parameters
//     w : 2-D weights (2 values)
//     b : bias
//
// Description
//     This function used to plot the boundary for simple perceptron with 2 inputs
//
// Examples
//    w = [1 -1]; b = 0.1;
//    plot_weight(w,b)
//
// Authors
//     Tan C.L.
drawlater();
h = gca();

no_argin = argn(2);
if no_argin == 1 
    b=0;
end

//x_bound = h.data_bounds(:,1);
//y_bound = h.data_bounds(:,2);
data_bounds = h.data_bounds;

margin_x = (h.data_bounds(2) - h.data_bounds(1)).*0.5;
margin_y = (h.data_bounds(4) - h.data_bounds(3)).*0.5;

x_bound(1) = h.data_bounds(1) - margin_x;
x_bound(2) = h.data_bounds(2) + margin_x;

y_bound(3) = h.data_bounds(3) - margin_y;
y_bound(4) = h.data_bounds(4) + margin_y;

x = x_bound(1):x_bound(2);
//y = -w(1)/w(2).*x;
y = -w(1)/w(2).*x - b./w(2);

plot(x,y,'r');
mtlb_axis(data_bounds(:));

drawnow;

endfunction



