function [pred,dd] = knn(x, y, xtest, k)
// K Nearest neighbours classification
//
//    Copyright 2020 ByteCode.
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
//     [pred,dd] = knn(x, y, xtest, k)
//
// Parameters
//     x : Input data, in m x n matrix, where m is the features, n is different datasets
//     y : Target data, in 1 x n vector, where the value shall be the classes which correspond to each set of data in x
//     xtest : Data undertest, in m x p, where m must be the same number of features, p is any set of data to be tested.
//     k : Number of neighbours to be compare
//     pred : Predicted class for xtest
//     dd : Distance of the xtests to each classes 
//
// Description
//     K Nearest neighbours classification 
//
// Examples
//    P = [1 2 3 4; 1 2 3 4];
//    T = [1 2 3 4];
//    [pred,dd] = knn(P, T, [1.2 ; 1.2], 1);
//    disp("Predicted Class : " + string(pred));
//    disp("Distance from Class " + string([1:4]') + " : "  + string(dd));
//
// See also
//
// Authors
//     Tan C.L.
//  

    pred = zeros(1,size(xtest,2));
    for cnt = 1:size(xtest,2)
        dist = getDistance(x, xtest(:,cnt));
        dd(:,cnt) = dist;
        [V,i] = gsort(dist,'g','i');    
        f = stats_mode(y(i(1:k)));
        //pred(cnt) = y(f);
        pred(cnt) = f;
    end

endfunction

function dist = getDistance(x1, x2)

//    if length(x1)==length(x2) then
//        err = x1 - x2;
//    else
        err = x1 - repmat(x2,1,size(x1,2));
//    end

    //dist = sqrt(sum(err.^2,1));
    dist = sqrt(sum(err.^2,1));
endfunction

function f = stats_mode(i)

    m = tabul(i);                          
    [occ , p] = max(m(:,2));
    f = m(p);                  
    //results = [m(1,p) string(occ)] 

endfunction



