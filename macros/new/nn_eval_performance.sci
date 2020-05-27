function [acc] = nn_eval_performance(yhat,y,ot)
    // Evaluate the network performance
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
    //     [acc] = nn_eval_performance(yhat,y,ot)
    //
    // Parameters
    //     yhat : Predicted output
    //     y : Actual target
    //     ot : Orientation, 'r' or 'c'
    //     acc : Accuracy
    //
    // Description
    //    This function used to evaluate the accuracy of predicted output
    //    
    // Examples
    //    P = [1 2 3 4; 1 2 3 4]./2 - 1; // Simple Normalization
    //    Tc = [1 2 3 4];
    //    T = nn_onehot(Tc); // Convert to one-hot encoding
    //    [P_train, T_train, P_test, T_test] = nn_split_data(P,T,0.25,3);
    // 
    // See also
    //     nn_train
    //     initialize_parameters
    //     nn_onehot
    //     nn_split_data
    //     model_forward
    //
    // Authors
    //     Tan C.L. 
    
    
    if ot == 'r' then
        sz_ot = 'c';
    elseif  ot == 'c' then
        sz_ot = 'r';

    end
    if or(size(y)==1) then

        hit = sum(yhat==y);
        acc = (hit ./size(y,sz_ot)) .*100;
        disp("Accuracy : "+string(acc)+" %");

    else
        [maxV1,maxI1] = max(y,ot);
        [maxV2,maxI2] = max(yhat,ot);

        hit = sum(maxI1==maxI2);
        acc = (hit ./size(y,sz_ot)) .*100;
        disp("Accuracy : "+string(acc)+" %");

    end
endfunction

