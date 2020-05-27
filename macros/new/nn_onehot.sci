function Tout = nn_onehot(Tin)
    // One-hot Encoding
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
    //     Tout = nn_onehot(Tin)
    //
    // Parameters
    //     Tin : Index of classes, starting from 1 to m
    //     Tout : One-hot encoding output for Tin, in m x p, where m is the number of classes, and p is the number of datasets
    //
    // Description
    //    One-hot Encoding for target data in Feed-forward Back-Propagation Network Base on Andrew Ng's Coursera Deep-Learning Specialization Course.
    //    
    // Examples
    //    P = [1 2 3 4; 1 2 3 4]./2 - 1; // Simple Normalization
    //    Tc = [1 2 3 4];
    //    T = nn_onehot(Tc); // Convert to one-hot encoding
    // 
    // See also
    //     nn_train
    //     initialize_parameters
    //     nn_split_data
    //     nn_eval_performance
    //     model_forward
    //
    // Authors
    //     Tan C.L. 
    
    
    // One-hot
    X = Tin';
    LinearIndices = sub2ind([length(X),max(X)], [1:length(X)]', X);
    Tout = zeros(length(X), max(X)); 
    Tout(LinearIndices) = 1;
    Tout = Tout'; 

endfunction
