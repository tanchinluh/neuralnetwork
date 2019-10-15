function plot_2group(p,t)
// Visulized 2 groups of data, with the data being tagges as 0 and 1 respectively
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
//     plot_2group(p,t)
//
// Parameters
//     p : 2-D data, with x and y, each column build up 1 set of data
//     t : Target group, strictly 0 and 1 for the plot function to plot correctly
//
// Description
//    This is the function to Visulized 2 groups of data
//    
// Examples
//    x = rand(2,10);
//    x(:,1:5) = x(:,1:5) + 1;
//    t = [0 0 0 0 0 1 1 1 1 1];
//    plot_2group(x,t)
//
// Authors
//     Tan C.L.     
    
    
drawlater();
plot(p(1,t==1),p(2,t==1),'.');
plot(p(1,t==0),p(2,t==0),'g*');
xnumb(p(1,:)+0.1,p(2,:)+0.1,1:size(p,2));
h = gca();
margin_x = (h.data_bounds(2) - h.data_bounds(1)).*0.05;
margin_y = (h.data_bounds(4) - h.data_bounds(3)).*0.05;

h.data_bounds(1) = h.data_bounds(1) - margin_x;
h.data_bounds(2) = h.data_bounds(2) + margin_x;

h.data_bounds(3) = h.data_bounds(3) - margin_y;
h.data_bounds(4) = h.data_bounds(4) + margin_y;

drawnow();
endfunction
