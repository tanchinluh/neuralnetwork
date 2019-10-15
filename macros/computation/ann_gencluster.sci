function y = ann_gencluster(m,d,c,std)
// Generate Cluster of Data
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
//     y = ann_gencluster(m,d,c,std)
//
// Parameters
//     m : number of data points for each cluster
//     d : number of dimensions
//     c : Number of clusters
//     std : Standard Deviation of cluster of data
//     y : generated output data
//
// Description
//     Generate Cluster of data base for classification
//
// Examples
//    y = ann_gencluster(10,2,3,0.05)
//    plot(y(1,:),y(2,:),'.')
//
// See also
//     ann_SOM
//
// Authors
//     Tan C.L.


rhs=argn(2);

// Error Checking
if rhs < 1; m = 10;end
if rhs < 2; d = 2; end
if rhs < 3; c = 8; end

if m == []; m = 10; end
if d == []; d = 2; end
if c == []; c = 8; end

x = rand(d,c);
y = [];
for cnt = 1:c
    y = [y repmat(x(:,cnt),1,m) + std*rand(d,m, "normal")]; 
end

endfunction