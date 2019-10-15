function plotchar(c)
//Plot a 35 element vector (7 x 5)
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
//     plotchar(c)
//
// Parameters
//     c : 35 elements with value from 0 - 1
//
// Description
//     This function used to plot the character in matrix of 7x5
//
// Examples
//     c = [0 0 1 0 0];
//     c = repmat(c,7,1)
//     plotchar(c)
//
// See also
//     plotchar53
//
// Authors
//     Tan C.L.
c = c';
   
x1 = [-0.5 -0.5 +0.5 +0.5 -0.5];
y1 = [-0.5 +0.5 +0.5 -0.5 -0.5];

x2 = [x1 +0.5 +0.5 -0.5];
y2 = [y1 +0.5 -0.5 +0.5];


plot(x1*5.6+2.5,y1*7.6+3.5,'r');


for i=1:length(c)
  x = modulo(i-1,5)+.5;
  y = 6-floor((i-1)/5)+.5;
  plot(x2*c(i)+x,y2*c(i)+y,'g');
  //  xnumb(x,y,c(i),2,90);
  end

endfunction
