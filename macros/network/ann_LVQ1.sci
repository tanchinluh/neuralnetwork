function [W,b] =  ann_LVQ1(P,T,N2,lr,itermax)
//  ANN LVQ Network Structure 1.
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
//     [W,b] =  ann_LVQ1(P,N2)
//     [W,b] =  ann_LVQ1(P,N2,lr,itermax)
//
// Parameters
//     P : Training input
//     T : Target Classes
//     N2 : Number of neurons in competition layer (Number of subclasses)
//     lr : Learning rate
//     itermax : Maximum epoch for training
//     W : weights for the network
//
// Description
//    This function perform LVQ training algorithm.
//    
// Examples
//    x = rand(2,10);
//    x(:,1:5) = x(:,1:5) + 1;
//    T = [1 1 1 1 1 0 0 0 0 0;0 0 0 0 0 1 1 1 1 1]
//    [W,b] =  ann_LVQ1(x,T,4);
//    [y,classes] = ann_LVQ_run(W,x)
//
// See also
//     ann_LVQ_run
//
// Authors
//     Tan C.L. 

rhs=argn(2);

// Error Checking
if rhs < 3; error("Expect at least 3 arguments, P,T and N");end
if rhs < 4; lr = 0.1; end
if rhs < 5; itermax = 100; end

if lr == []; lr = 0.1; end
if itermax == []; itermax = 100; end

// Creating weight matrix
[N1,col1]=size(P);
[N3,col2]=size(T);
N=[N1,N2,N3];
W=hypermat([max(N),max(N),size(N,'c')-1]);

// Randomized 1st Layer Weight
[w, b] = ann_compet_init(P, N(2));
W(1:N(2),1:N(1),1) = w;

// Design 2nd Layer Weight
ratio =sum(T,'c')./sum(T);

steps = [0; floor(cumsum(ratio)*N(2))];
for cnt=1:N(3)
  W(cnt,(steps(cnt)+1):steps(cnt+1),2) = 1;
end

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


for itercnt = 1:itermax
    for Pcnt = 1:size(P,2)
        //n = W*P(:,Pcnt);
        n1 = ann_negdist(W(1:N(2),1:N(1),1),P(:,Pcnt));
        a1 = ann_compet_activ(n1);
        
        a2 = W(1:N(3),1:N(2),2)*a1;

        if a2 == T(:,Pcnt)
            W(find(a1),1:N(1),1) = W(find(a1),1:N(1),1) +lr*(P(:,Pcnt)'-W(find(a1),1:N(1),1));
        else
            W(find(a1),1:N(1),1) = W(find(a1),1:N(1),1) -lr*(P(:,Pcnt)'-W(find(a1),1:N(1),1));
        end
             
    end
    
    handles.iter.value = round((itercnt/iter_span)*100);
    handles.itercurrent.string = string(itercnt);
    
end


endfunction