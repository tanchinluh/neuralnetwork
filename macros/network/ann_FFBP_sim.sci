function y = ann_FFBP_sim(P,W,af)

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