function [P_train, T_train, P_test, T_test] = nn_split_data(P,T,test_ratio,seed)
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
