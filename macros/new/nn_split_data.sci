function [P_train, T_train, P_test, T_test] = nn_split_data(P,T,test_ratio,seed)
    // Split the data into training and testing dataset
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
    //     [P_train, T_train, P_test, T_test] = nn_split_data(P,T,test_ratio,seed)
    //
    // Parameters
    //     P : Input data
    //     T : Target data
    //     test_ratio : Ratio for testing dataset, from 0 - 1
    //     seed : Random seed
    //
    // Description
    //    This function used to split the data into training and testing dataset.
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
    //     nn_eval_performance
    //     model_forward
    //
    // Authors
    //     Tan C.L. 
        
    // to-do : split propotion according to the classes
    grand("setsd", seed);
    m = size(P,2);
	n = size(P,1);
    t = size(T,1);
	ind = grand(1, "prm", 1:m);
    
    test_sz = round(m * test_ratio);
    train_sz = m - test_sz;
    
	P_train	= P(:,1:train_sz);
	P_test	= P(:,train_sz+1:$);
	T_train	= T(:,1:train_sz);
	T_test	= T(:,train_sz+1:$);
    
endfunction
