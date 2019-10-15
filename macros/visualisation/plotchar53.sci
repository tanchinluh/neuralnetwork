function plotchar53(c)
//Plot a 15 element vector as a 5x3 grid.
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
//     plotchar53(c)
//
// Parameters
//     c : 15 elements with value from 0 - 1
//
// Description
//     This function used to plot the character in matrix of 5x3
//
// Examples
//    c = [0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;];
//    plotchar53(c)
//
// See also
//    plotchar
//
// Authors
//     Tan C.L.

c = matrix(c',1,15);

x1 = [-0.5 -0.5 +0.5 +0.5 -0.5];
y1 = [-0.5 +0.5 +0.5 -0.5 -0.5];

x2 = [x1 +0.5 +0.5 -0.5];
y2 = [y1 +0.5 -0.5 +0.5];

drawlater();
plot(x1*3.5 + 1.5,y1*5.5+2.5,'r');
//plot(x1*3.5+1.5,y1*7.5+1.5,'r');
//plot([-0.25 -0.25 3.25 3.25 -0.25],[-3.75 9.75 9.75 -3.75 -3.75],'r');
//plot(0,0,'ro');
h = gcf();
h.position = [200 70 300 400];

for i=1:length(c)
  x = modulo(i-1,3)+.5;
  y = 4-floor((i-1)/3)+.5;
  plot(x2*c(i)+x,y2*c(i)+y,'g');
  //  xnumb(x,y,c(i),2,90);
  end
mtlb_axis('off');

drawnow();
endfunction
//a = gca();
//delete(a.children);

