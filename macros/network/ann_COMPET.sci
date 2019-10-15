function [W,b] =  ann_COMPET(P,N,lr,lr_c,itermax)
// ANN Competitive Network.
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
//     [W,b] =  ann_Compete(P,N)
//     [W,b] =  ann_Compete(P,N,lr,lr_c,itermax)
//
// Parameters
//      P : Training input
//      N : Number of neurons in competition layer (Number of classes)
//      lr : Learning rate
//      lr_c : Learning Rate for bias (Conscience learning rate)
//      itermax : Maximum epoch for training
//      W : Output Weight
//      b : Output bias
//
// Description
//     Competitive network training algorithm.
//
// Examples
//    x = rand(2,10);
//    x(:,1:5) = x(:,1:5) + 1;
//    plot(x(1,:),x(2,:),'.');
//    [W,b] =  ann_COMPET(x,4);close;
//    plot(W(:,1), W(:,2), 'or');
//
// See also
//     ann_COMPET_run
//     ann_COMPET_visualize2d
//     ann_COMPET_visualize3d
//
// Authors
//     Tan C.L. 

rhs=argn(2);

// Error Checking
if rhs < 2; error("Expect at least 2 arguments, P and N");end
if rhs < 3; lr = 0.1; end
if rhs < 4; lr_c = 0.1; end
if rhs < 5; itermax = 100; end

if lr == []; lr = 0.1; end
if lr_c == []; lr_c = 0.1; end
if itermax == []; itermax = 100; end



[W, b] = ann_compet_init(P, N);
iter_span = itermax;

// Initialize Training Progress GUI
handles = ann_training_process();
handles.itermax.string = string(itermax);
handles.msecurrent.visible = 'off';
handles.msemin.visible = 'off';
handles.msemax.visible = 'off';
handles.mse.visible = 'off';
handles.msetitle.visible = 'off';
handles.gdcurrent.visible = 'off';
handles.gdmin.visible = 'off';
handles.gdmax.visible = 'off';
handles.gd.visible = 'off';
handles.gdtitle.visible = 'off';
 Q = size(P,2);


for itercnt = 1:itermax
    for Pcnt = 1:size(P,2)
        //n = W*P(:,Pcnt);
        q = fix(rand(1,'uniform')*Q)+1;
        p = P(:,q);        
        n = ann_negdist(W,p);
        a = ann_compet_activ(n + b);
        W(find(a),:) = W(find(a),:) +lr*(p'-W(find(a),:));
        b(find(a)) = b(find(a)) - 0.2;
        b(find(~a)) = lr_c.*b(find(~a));        
    end
    
    handles.iter.value = round((itercnt/iter_span)*100);
    handles.itercurrent.string = string(itercnt);
    
end


endfunction
