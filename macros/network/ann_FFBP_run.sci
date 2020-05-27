function y = ann_FFBP_run(P,W,af)
// ANN FeedForward Backpropagation Network simulation function
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
//     [y] = ann_FFBP_run(W,P,af)
//
// Parameters
//     P : Testing input
//     W : Output Weight and bias
//     af : Activation Function
//     y : Simulation result
//
// Description
//     FeedForward Backpropagation simulation/run function to produce predicted output.
//
// Examples
//    P = [1 2 3 4; 1 2 3 4];
//    T = [1 2 3 4];
//    W = ann_FFBP_lm(P,T,[2 3 1]);
//    y = ann_FFBP_run(P,W)
//
// See also
//     ann_FFBP_gd
//     ann_FFBP_gda
//     ann_FFBP_gdm
//     ann_FFBP_gdx
//     ann_FFBP_lm
//
// Authors
//     Tan C.L. 

rhs=argn(2);
if rhs < 3; af = ['ann_tansig_activ','ann_purelin_activ']; end

if size(W) ~= size(af,2) then
    error('Numbers of activation functions must match numbers of layers (N-1)');
end

layers = size(W);

n = list(0);
a = list(0);
// Simulate Phase
n(1) = W(1)(:,1:$-1)*P + repmat(W(1)(:,$),1,size(P,2)); // This could be save in temp n to save memory
a(1) = evstr(af(1)+'(n('+string(1)+'))');
for cnt = 2:layers
    n(cnt) = W(cnt)(:,1:$-1)*a(cnt-1) + repmat(W(cnt)(:,$),1,size(P,2)); // This could be save in temp n to save memory
    a(cnt) = evstr(af(cnt)+'(n('+string(cnt)+'))');
end

y = a($);


endfunction
