function [acc] = nn_eval_performance(yhat,y,ot)

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

