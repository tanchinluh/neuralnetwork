function d = ann_dist(w,x)
// Distance weight function
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
//     d=ann_dist(w,x)
//
// Parameters
//      w : weight
//      x : input
//      d : distance
//
// Description
//     Calculate distance weight function
//
// Examples
//    w = [1 2 3;4 5 6];
//    x = [1 2; 3 4; 5 6];
//    d = ann_dist(w,x)
//
// See also
//     ann_negdist
//
// Authors
//     Chenwei, modified and used in Scilab NN Toolbox by Tan C.L.

[lsh,rsh]=argn(0);
if(rsh<1),error('wrong input');end;
if(rsh<2),x=w';end;
[S,R]=size(w);
[R1,P]=size(x);
if(R~=R1),error('Inner matrix dimension do not match');end
d=zeros(S,P);
if(P<S)
   x=x';
   temp=zeros(1,S);
   for p=1:P
   d(:,p)=sum((w-x(p+temp,:)).^2,2);
   end
else
   w=w';
   temp=zeros(1,P);
   for i=1:S
   d(i,:)=sum((w(:,i+temp)-x).^2,1);
   end
end
d=sqrt(d);
endfunction


