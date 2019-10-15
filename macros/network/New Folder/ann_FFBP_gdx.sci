function W = ann_FFBP_gdx(P,T,N,af,lr,lr_inc,lr_dec,Mr,itermax,mse_min,gd_min,mse_diff_max)
// ANN FeedForward Backpropagation Gradient Decent with Adaptive Learning Rate and Momentum training function.
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
//     W = ann_FFBP_gdx(P,T,N)
//     W = ann_FFBP_gdx(P,T,N,af,lr,lr_inc,lr_dec,Mr,itermax,mse_min,gd_min,mse_diff_max)
//
// Parameters
//     P : Training input
//     T : Training target
//     N : Number of Neurons in each layer, incluing Input and output layer
//     af : Activation Function from 1st hidden layer to the output layer
//     lr : Learning rate
//     Mr : Momentum    
//     lr_inc : Learning Rate Increase Rate
//     lr_dec : Learning Rate Decrease Rate
//     itermax : Maximum epoch for training
//     mse_min : Minumum Error (Performance Goal)
//     gd_min : Minimum Gradient
//     mse_diff_max : MSE changes max in percentage, default 5%
//     W : Output Weight and bias
//
// Description
//    This function perform FeedForward Backpropagation with Gradient Decent training algorithm with Adaptive Learning Rate and Momentum.
//    
// Examples
//    P = [1 2 3 4; 1 2 3 4];
//    T = [1 2 3 4];
//    W = ann_FFBP_gdx(P,T,[2 3 1]);
//    y = ann_FFBP_run(P,W)
// 
// See also
//     ann_FFBP_gd
//     ann_FFBP_gda
//     ann_FFBP_gdm
//     ann_FFBP_lm
//     ann_FFBP_run
//
// Authors
//     Tan C.L. 

// Checking Input Arguement
rhs=argn(2);

// Error Checking
if rhs < 3; error("Expect at least 3 arguments, P, T and N");end
if rhs < 4; af = ['ann_tansig_activ','ann_purelin_activ']; end
if rhs < 5; lr = 0.01; end
if rhs < 6; lr_inc = 1.05; end
if rhs < 7; lr_dec = 0.75; end
if rhs < 8; Mr = 0.9; end
if rhs < 9; itermax = 1000; end
if rhs < 10; mse_min = 1e-5; end
if rhs < 11; gd_min =  1e-5; end
if rhs < 12; mse_diff_max =  0.01; end

mse_diff_max

if af == []; af = ['ann_tansig_activ','ann_purelin_activ']; end
if lr == []; lr = 0.01; end
if lr_inc == []; lr_inc = 1.05; end
if lr_dec == []; lr_dec = 0.75; end
if Mr == []; Mr = 0.9; end
if itermax == []; itermax = 1000; end
if mse_min == []; mse_min = 1e-5; end
if gd_min == []; gd_min =  1e-5; end
if mse_diff_max == []; mse_diff_max =  0.01; end

// Initialization
format(8);
W = ann_ffbp_init(N,[-0.01 0.01]);
itercnt = 0;
af_d = strsubst(af,'ann_','ann_d_');
mse = %inf;
gd = %inf;
tempW = ann_ffbp_init(N,[0 0]);
preW = W;


// Initialize Training Progress GUI
handles = ann_training_process();
handles.itermax.string = string(itermax);
handles.msemin.string = string(mse_min);
handles.gdmax.string = 'inf';
handles.gdmin.string = string(gd_min);
layers = size(N,2)-1; // layers here counted from 1st hidden layers to output layer
n = list(0);
a = list(0);
m = list(0);
s = list(0);

while mse > mse_min & itercnt < itermax & gd > gd_min

        // Simulate Phase
        n(1) = W(1)(:,1:$-1)*P + repmat(W(1)(:,$),1,size(T,2)); // This could be save in temp n to save memory
        a(1) = evstr(af(1)+'(n('+string(1)+'))');
        for cnt = 2:layers
            n(cnt) = W(cnt)(:,1:$-1)*a(cnt-1) + repmat(W(cnt)(:,$),1,size(T,2)); // This could be save in temp n to save memory
            a(cnt) = evstr(af(cnt)+'(n('+string(cnt)+'))');
        end
        e = T - a($);
        
        // Back Propagate
        m(layers) = evstr(af_d(layers)+'(a('+string(layers)+'))');
//        s(layers) = (-2*m(layers).*e); // Change on 6/7/2011 to accommodate purelin function changes 
        s(layers) = -e;
        
        for cnt = layers-1:-1:1
//            m(cnt) = evstr(af_d(cnt)+'(a('+string(cnt)+'))');
            m(cnt) = evstr(af_d(cnt)+'(n('+string(cnt)+'))');
            s(cnt) = m(cnt).*(W(cnt+1)(:,1:$-1)'*s(cnt+1));
        end

        // Saving Previous Weight
        pre2W = preW;
        preW = W;
        
        // Temporary Update 
        
        tempW(1)(:,1:$-1) = (1+Mr)*preW(1)(:,1:$-1) - Mr*pre2W(1)(:,1:$-1) - ((1-Mr)*lr*s(1)*P')./size(P,2);
        tempW(1)(:,$) = (1+Mr)*preW(1)(:,$) - Mr*pre2W(1)(:,$) - (1-Mr)*lr*mean(s(1),2); //b
        
        for cnt = 2:layers
            tempW(cnt)(:,1:$-1) = (1+Mr)*preW(cnt)(:,1:$-1) - Mr*pre2W(cnt)(:,1:$-1) - ((1-Mr)*lr*s(cnt)*a(cnt-1)')./size(P,2);
            tempW(cnt)(:,$) = (1+Mr)*preW(cnt)(:,$) - Mr*pre2W(cnt)(:,$) - (1-Mr)*lr*mean(s(cnt),2); //b
        end    
        // Simulate Phase 2 to check MSE
        n(1) = W(1)(:,1:$-1)*P + repmat(W(1)(:,$),1,size(T,2)); // This could be save in temp n to save memory
        a(1) = evstr(af(1)+'(n('+string(1)+'))');
        for cnt = 2:layers
            n(cnt) = W(cnt)(:,1:$-1)*a(cnt-1) + repmat(W(cnt)(:,$),1,size(T,2)); // This could be save in temp n to save memory
            a(cnt) = evstr(af(cnt)+'(n('+string(cnt)+'))');
        end
        e2 = T - a($);
    
        mse = mean(e.^2);
        mse2 = mean(e2.^2);
            
        // Update Weights
        mse_diff = (mse2 - mse)/mse;
    
        if  mse_diff <= 0
            W = tempW;
            lr = lr*lr_inc;      
            if lr>1
                lr = 1
            end
        elseif mse_diff > 0 | mse_diff < mse_diff_max
            W = tempW;
        elseif mse_diff >= mse_diff_max then
            lr = lr*lr_dec;
            if lr<0.005
                lr = 0.005
            end
        
        end
                    
       // Stopping Criteria
        mse = mean(e.^2);
        itercnt = itercnt + 1;
        gd = mean(s(1).^2); 
           
       // Display Training Progress GUI
       if  itercnt == 1 then
           mse_max = mse;
           handles.msemax.string = string(mse_max);
           gd_max = gd;
           handles.gdmax.string = string(gd_max);           
           mse_span = log(mse) - log(mse_min);
           iter_span = itermax;
           gd_span =  log(gd) - log(gd_min);
       end

        // Scilab 5.4 below
        // handles.iter.max = round((1-itercnt/iter_span)*100);
        // handles.mse.max = round(((log(mse) - log(mse_min))/mse_span)*100);
        // handles.gd.max = round(((log(gd) - log(gd_min))/gd_span)*100);
        
        // Scilab 5.5 above
        handles.iter.value = round((itercnt/iter_span)*100);
        handles.mse.value = -(log(mse)-log(mse_max))/mse_span * 100;// round(((log(mse) - log(mse_min))/mse_span)*100);
        handles.gd.value = -(log(gd)-log(gd_max))/gd_span * 100; //round(((log(gd) - log(gd_min))/gd_span)*100);


        handles.itercurrent.string = string(itercnt);
        handles.msecurrent.string = string(mse);     
        handles.gdcurrent.string = string(gd);           
        
end
endfunction
