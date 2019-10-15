function acc = ann_eval_onehot(T,y)
    [maxval,maxind] = max(y,'r');
    [maxval,maxind2] = max(T,'r');
    acc = sum(maxind==maxind2)/size(T,2);
    disp('Accuracy: ' + string(acc*100) + '%');
endfunction
