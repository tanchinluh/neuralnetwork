function W = ann_FFBP_gdm(P,T,N,af,lr,Mr,itermax,mse_min,gd_min)
    // ANN FeedForward Backpropagation Gradient Decent with Momentum training function.
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
    //     W = ann_FFBP_gdm(P,T,N)
    //     W = ann_FFBP_gdm(P,T,N,af,lr,Mr,itermax,mse_min,gd_min)
    //
    // Parameters
    //     P : Training input
    //     T : Training target
    //     N : Number of Neurons in each layer, incluing Input and output layer
    //     af : Activation Function from 1st hidden layer to the output layer
    //     lr : Learning rate
    //     Mr : Momentum
    //     itermax : Maximum epoch for training
    //     mse_min : Minumum Error (Performance Goal)
    //     gd_min : Minimum Gradient
    //     W : Output Weight and bias
    //
    // Description
    //    This function perform FeedForward Backpropagation with Gradient Decent with Momentum training algorithm.
    //    
    // Examples
    //    P = [1 2 3 4; 1 2 3 4];
    //    T = [1 2 3 4];
    //    W = ann_FFBP_gdm(P,T,[2 3 1]);
    //    y = ann_FFBP_run(P,W)
    // 
    // See also
    //     ann_FFBP_gd
    //     ann_FFBP_gda
    //     ann_FFBP_gdx
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
    if rhs < 6; Mr = 0.9; end
    if rhs < 7; itermax = 1000; end
    if rhs < 8; mse_min = 1e-5; end
    if rhs < 9; gd_min =  1e-5; end

    if af == []; af = ['ann_tansig_activ','ann_purelin_activ']; end
    if lr == []; lr = 0.01; end
    if Mr == []; Mr = 0.9; end
    if itermax == []; itermax = 1000; end
    if mse_min == []; mse_min = 1e-5; end
    if gd_min == []; gd_min =  1e-5; end

    // Initialization
    format(8);
    W = ann_ffbp_init(N,[-0.01 0.01]);
    itercnt = 0;
    af_d = strsubst(af,'ann_','ann_d_');
    mse = %inf;
    gd = %inf;
    preW = W;


    layers = size(N,2)-1; // layers here counted from 1st hidden layers to output layer
    n = list(0);
    a = list(0);
    m = list(0);
    s = list(0);

    while mse > mse_min & itercnt < itermax & gd > gd_min


//        if  modulo(itercnt,round(itermax/20)) == 0
//            mprintf('Epoch %3i / %i',itercnt,itermax);
//        end

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
        s(layers) = (-2*m(layers).*e); // Change on 6/7/2011 to accommodate purelin function changes 
        for cnt = layers-1:-1:1
            m(cnt) = evstr(af_d(cnt)+'(a('+string(cnt)+'))');
            s(cnt) = m(cnt).*(W(cnt+1)(:,1:$-1)'*s(cnt+1));
        end

        // Etra Lines for Momentum
        pre2W = preW;
        preW = W;

        // Update Weights
        W(1)(:,1:$-1) = (1+Mr)*preW(1)(:,1:$-1) - Mr*pre2W(1)(:,1:$-1) - ((1-Mr)*lr*s(1)*P')./size(P,2);
        W(1)(:,$) = (1+Mr)*preW(1)(:,$) - Mr*pre2W(1)(:,$) - (1-Mr)*lr*mean(s(1),2); //b        
        for cnt = 2:layers
            W(cnt)(:,1:$-1) = (1+Mr)*preW(cnt)(:,1:$-1) - Mr*pre2W(cnt)(:,1:$-1) - ((1-Mr)*lr*s(cnt)*a(cnt-1)')./size(P,2);
            W(cnt)(:,$) = (1+Mr)*preW(cnt)(:,$) - Mr*pre2W(cnt)(:,$) - (1-Mr)*lr*mean(s(cnt),2); //b
        end

        // Stopping Criteria
        mse = mean(e.^2);
        itercnt = itercnt + 1;
        gd = mean(s(1).^2); 


        if  modulo(itercnt,round(itermax/20)) == 0
            mprintf('Epoch %3i / %i',itercnt,itermax);
            mprintf(' MSE: %f\n',mse);
        end
        mse_all(itercnt) = mse;

    end
    mprintf('\n');
    mprintf('Epoch %3i / %i',itercnt,itermax);
    mprintf(' MSE: %f\n',mse);
    plot(1:size(mse_all,1),mse_all');
    xlabel('Epoch(n)');
    ylabel('MSE');
endfunction
