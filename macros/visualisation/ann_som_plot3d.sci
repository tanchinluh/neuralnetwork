function ann_som_plot3d(w,d,nd)
// Visualize 3-D Self-Organizing Map
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
//     ann_som_plot3d(w,d,nd)
//
// Parameters
//     w : weight matrix
//     d : distance matrix
//     nd : neibourhood distance
//
// Description
//    This is the function to visualize 3-D Self-Organizing Map
//    
// Examples
//    N = [5,5,5];
//    y = ann_som_hextop(N);
//    ann_som_plot3d(y);
// 
// See also
//     ann_som_plot2d
//
// Authors
//     Tan C.L. 

[lsh,rsh]=argn(0);
if(rsh < 1), error('Not enough arguments.');end
if(rsh<2) then
  d = ann_som_eudist(w);
  w = w';
  t = 'Neuron Positions';
  var = 'position(%g,i)';
else
  t = 'Weight Vectors';
  var = 'W(i,%g)';
end
if(rsh<3)
  nd = 1;
end

// Check Dimensions
[S,R] = size(w);
if(R < 3)
  w = [w zeros(S,3-R)];
elseif R > 3
  disp('Warning - PLOTSOM only shows first three dimensions.');
  w = w(:,1:3);
end 

//Line coordinates
[I,J] = meshgrid(1:S,1:S);
[i,j] = find((d <= (nd+1e-10)) & (I<J));    
keep = find((w(i,1) ~= w(j,1)) | (w(i,2) ~= w(j,2)) | (w(i,3) ~= w(j,3)));
i = i(keep);
j = j(keep);
numLines = length(i);
x = [w(i,1)'; w(j,1)'; zeros(1,numLines)+%nan];
y = [w(i,2)'; w(j,2)'; zeros(1,numLines)+%nan];
z = [w(i,3)'; w(j,3)'; zeros(1,numLines)+%nan];
x = matrix(x,1,3*numLines);
y = matrix(y,1,3*numLines);
z = matrix(z,1,3*numLines);

// Plot

plot3d3(x,y,z);
l = gce();
l.foreground = 2;
plot3dot(w(:,1),w(:,2),w(:,3));
theta=-55;alpha=80;
xgrid(2);
xtitle(t,sprintf(var,1),sprintf(var,2),sprintf(var,3));


endfunction
