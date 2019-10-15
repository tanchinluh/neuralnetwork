function [w,b] = ann_PERCEPTRON(P,T)
// ANN Perceptron training function.
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
//     [w,b] = ann_PERCEPTRON(P,T)
//
// Parameters
//     P : Training input
//     T : Training target
//     w : weights for the network
//     b : bias for the network
//
// Description
//    This funtion is a simple perceptron training function. 
//
// Examples
//    P = [0 0 1 1 ; 0 1 0 1];
//    T = [0 0 0 1];
//    [w,b] = ann_PERCEPTRON(P,T);
//    y = ann_PERCEPTRON_run(P,w,b)
// 
// See also
//     ann_PERCEPTRON_run
//     ann_PERCEPTRON_visualize 
//
// Authors
//    Tan C.L.

//w = zeros(size(T,1),size(P,1));
//b = zeros(size(T,1),1);

w = rand(size(T,1),size(P,1));
b = rand(size(T,1),1);

iter = %t;
itercnt = 0;

while iter == %t

no_err = 0
    for cnt = 1:size(P,2)
        e = T(:,cnt) - ann_hardlim_activ(w*P(:,cnt)+b);
        w = (w + e*P(:,cnt)');
        b = b + e;
        if sum(e) == 0 then
            no_err = no_err + 1;
        end
        if  no_err == size(P,2) then
            iter = %f;
        end
    end
    itercnt = itercnt + 1;
    disp('Epoch: ' + string(itercnt));
end

endfunction