function plot3dot(x,y,z,mark_foreground,mark_style)
// 3-D Parametric plot for opoints
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
//     plot3dot(x,y,z)
//     plot3dot(x,y,z,mark_foreground,mark_style)
//
// Parameters
//     x : x data
//     y : y data
//     z : z data
//     mark_foreground : marker color
//     mark_style : marker style
//
// Description
//    This is the function to visualize 3-D Parametric plot for opoints
//    
// Examples
//    x = rand(1:10);
//    y = rand(1:10);
//    z = rand(1:10);
//    plot3dot(x,y,z)
//
// Authors
//     Tan C.L. 

rhs = argn(2);

if rhs < 4; mark_foreground=5; end
if rhs < 5; mark_style = 4;end

param3d1(x,y,z);
e2 = gce();
e2.line_mode='off';
e2.mark_mode='on';

execstr('e2.mark_foreground ='+ string(mark_foreground));
execstr('e2.mark_style ='+ string(mark_style));

endfunction