function W = ann_SOM(P,N,itermax,steps,NS,topfcn,distfcn)
//  ANN Self-Orginizing Map (Batch Training)
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
//     W = ann_SOM(P)
//     W = ann_SOM(P,N,itermax,steps,NS,topfcn,distfcn)
//
// Parameters
//     P : Training input
//     N : Structure of Feature Map
//     itermax : Maximum epoch for training
//     steps : steps of the NS decrease
//     NS : Initial neighbourhood size
//     topfcn : Topology Function
//     distfcn : Distance Function
//
// Description
//    This function perform Self-Orginizing batch training algorithm.
//    
// Examples
//    x = rand(2,10);
//    x(:,1:5) = x(:,1:5) + 1;
//    W =  ann_SOM(x,[2 2]);
//    [y,classes] = ann_SOM_run(W,x)
//
// See also
//     ann_SOM_online
//     ann_SOM_run
//     ann_SOM_visualize2d
//     ann_SOM_visualize3d
//
// Authors
//     Tan C.L. 

rhs=argn(2);

// Error Checking
if rhs < 1; error("Expect at least 1 argument, P");end
if rhs < 2; N=[8,8]; end
if rhs < 3; itermax = 200; end
if rhs < 4; steps = 100; end
if rhs < 5; NS = 3; end
if rhs < 6; topfcn = 'ann_som_gridtop'; end
if rhs < 7; distfcn = 'ann_som_linkdist';end


if N == []; N=[8,8]; end
if itermax == []; itermax = 200; end
if steps == []; steps = 100; end
if NS == []; NS = 3; end
if topfcn == []; topfcn = 'ann_som_gridtop'; end
if distfcn == []; distfcn = 'ann_som_linkdist';end
iter_span = itermax;

ieee(1);
lines(0);

[R,col]=size(P);
S=prod(N);

//calculate neuron's space position
extrasize = size(P,1) - size(N,2);
N = [N ones(1,extrasize)];
neuron_pos = evstr(topfcn +'(N)');

//calculate neuron's distance
neuron_dist=evstr(distfcn +'(neuron_pos)');

//initalize W
P_pr=[min(P,'c'),max(P,'c')];
n_pr=[min(neuron_pos,'c'),max(neuron_pos,'c')];
P_ctr = mean(P,'c')
n_ctr = mean(neuron_pos,'c')
c = P_pr(:,1);
m = (P_pr(:,2) - c)./n_pr(:,2);
new_pos = repmat(m,1,size(neuron_pos,2)).*neuron_pos + repmat(c,1,size(neuron_pos,2));
W = new_pos';
W(isnan(W)) = 0;
//W=zeros(S,R);
//W=ann_compet_init(P,S);pause

// Initialize Training Progress GUI
//handles = ann_training_process();
//handles.itermax.string = string(itermax);
//handles.msecurrent.visible = 'off';
//handles.msemin.visible = 'off';
//handles.msemax.visible = 'off';
//handles.mse.visible = 'off';
//handles.msetitle.visible = 'off';
//handles.gdcurrent.visible = 'off';
//handles.gdmin.visible = 'off';
//handles.gdmax.visible = 'off';
//handles.gd.visible = 'off';
//handles.gdtitle.visible = 'off';

for itercnt=1:itermax

    [S,R] = size(W);
    [R,Q] = size(P);

    n = ann_negdist(W,P);

    //find the winner
    a = ann_compet_activ(n);


    // Neighborhood distance
    nd = 1 + (NS-1) * (1-itercnt/steps);
    neighborhood = (neuron_dist <= nd);

    // Activations
    a = a .* double(rand(a)<0.9);
    a2 =  neighborhood * a + a;

    sum_a2 = sum(a2,2);
    loser_Index = (sum_a2 == 0);
    a3 = a2 ./ sum_a2(:,ones(1,Q));

    new_W = a3*P';
    dw = new_W - W;
    dw(loser_Index,:) = 0;

    W = W + dw;
    
//    handles.iter.value = round((itercnt/iter_span)*100);
//    handles.itercurrent.string = string(itercnt);
    mprintf('Epoch %3i / %i\n',itercnt,itermax);
end


endfunction

