function W = ann_SOM_online(P,N,itermax,lr,NS,NDEC,topfcn,distfcn)
//  ANN Self-Orginizing Map (incremental training)
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
//     W = ann_SOM_online(P)
//     W = ann_SOM_online(P,N,itermax,lr,NS,NDEC,topfcn,distfcn)
//
// Parameters
//     P : Training input
//     N : Structure of Feature Map
//     itermax : Maximum itercnt for training
//     lr : Learning Rate
//     NS : Initial neighbourhood size
//     NDEC : Nrighbourhood size decrease rate
//     topfcn : Topology Function
//     distfcn : Distance Function
//
// Description
//    This function perform Self-Orginizing incremental training algorithm.
//    
// Examples
//    x = rand(2,10);
//    x(:,1:5) = x(:,1:5) + 1;
//    W =  ann_SOM_online(x,[2 2]);
//    [y,classes] = ann_SOM_run(W,x)
//
// See also
//     ann_SOM
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
    if rhs < 4; lr = 1; end
    if rhs < 5; NS = 3; end
    if rhs < 6; NDEC = 0.999; end
    if rhs < 7; topfcn = 'ann_som_gridtop'; end
    if rhs < 8; distfcn = 'ann_som_linkdist';end


    if N == []; N=[8,8]; end
    if itermax == []; itermax = 200; end
    if lr == []; lr = 1; end
    if NS == []; NS = 3; end
    if NDEC == []; NDEC = 0.999; end    
    if topfcn == []; topfcn = 'ann_som_gridtop'; end
    if distfcn == []; distfcn = 'ann_som_linkdist';end
    iter_span = itermax;

    ieee(1);
    lines(0);

    [R,col]=size(P);
    S=prod(N);

    //calculate neuron's space position
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

    [s,r] = size(W);
    Q = size(P,2);

    for itercnt=1:itermax

        if itercnt ==1 then
            figure();newaxes();plot(P(1,:),P(2,:),'gx');
            ann_som_plot2d(W,neuron_dist);        
            w_handle = gca();
            //sleep(1000);

        else
            drawlater();
            delete(w_handle.children);
            plot(P(1,:),P(2,:),'gx');
            ann_som_plot2d(W,neuron_dist) ;
            drawnow();
            //sleep(1000);
        end


        q = fix(rand(1,'uniform')*Q)+1;
        p = P(:,q);

        // NETWORK OUTPUT
        n = ann_negdist(W,p);

        //find the winner
        a = ann_compet_activ(n);


        //  a = ann_compet_activ(W*p);
        i = find(a);
        a = 0.5*(a + (neuron_dist(:,i) <= NS));

        W = W + (lr*a*ones(1,r)) .* (ones(s,1)*p'-W);
        lr = (lr-0.01)*0.998+0.01;
        NS = (NS-1)*NDEC+1;

        handles.iter.value = round((itercnt/iter_span)*100);
        handles.itercurrent.string = string(itercnt);

    end

endfunction
