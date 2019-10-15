function [w,b] = ann_PERCEPTRON_visualize(P,T,delay)
// ANN Perceptron training function with visualization.
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
//     [w,b] = ann_PERCEPTRON_visualize(P,T,delay)
//
// Parameters
//     P : Training input
//     T : Training target
//     w : weights for the network
//     b : bias for the network
//     delay : time delay for animation
//
// Description
//    This funtion is a simple perceptron training function with visualisation 
//
// Examples
//    P = [0 0 1 1 ; 0 1 0 1];
//    T = [0 0 0 1];
//    [w,b] = ann_PERCEPTRON_visualize(P,T,1000);
//    y = ann_PERCEPTRON_run(P,w,b)
// 
// See also
//     ann_PERCEPTRON_run
//     ann_PERCEPTRON
//
// Authors
//    Tan C.L.

// Initializing Plot
//w = zeros(size(T,1),size(P,1));
//w($) = w($)+0.001;
//b = zeros(1,size(T,1));
w = rand(size(T,1),size(P,1));
b = rand(size(T,1),1);
x = min(P)-1:0.1:max(P)+1;

P0 = P(:,T==0);
P1 = P(:,T==1);
   
plot([min(P(1,:))-1 max(P(1,:))+1],[0 0],'k');
plot([0 0],[min(P(2,:))-1 max(P(2,:))+1],'k');    

plot(P0(1,:),P0(2,:),'ro');
plot(P1(1,:),P1(2,:),'g*');

for cnt = 1:size(P,2)
    xstring(P(1,cnt)+0.1,P(2,cnt),string(cnt));
end

y = -w(1)/w(2).*x - b./w(2);
plot(x,y);
mtlb_axis([min(P(1,:))-1 max(P(1,:))+1 min(P(2,:))-1 max(P(2,:))+1]);        
h = gce();
h.children.thickness = 3;

plot(0,0,'o');
ha = gce();

sleep(delay);

iter = %t;
itercnt = 0;

while iter == %t

    no_err = 0
    for cnt = 1:size(P,2)

        // Perceptron Learning
        e = T(:,cnt) - ann_hardlim_activ(w*P(:,cnt)+b);
        w = (w + e*P(:,cnt)');
        b = b + e;
        
        // Checking for all Neuron Error 
        if sum(e) == 0 then
            no_err = no_err + 1;
        end
        if  no_err == size(P,2) then
            iter = %f;
        end

        // Animation 
        ha.children.data = [P(1,cnt),P(2,cnt)];
        ha.children.mark_size = 10;
        ha.children.mark_style = 0;
        sleep(delay);    
        y = -w(1)/w(2).*x - b./w(2);
        h.children.data = [x' y'];
        sleep(delay);    

    end
    itercnt = itercnt + 1;
    disp('Epoch: ' + string(itercnt));
end

endfunction