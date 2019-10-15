function W = ann_FFBP_lm(P,T,N,af,mu,mumax,theta,itermax,mse_min,gd_min)
    // ANN FeedForward Backpropagation Levenberg–Marquardt algorithm training function
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
    //     W = ann_FFBP_lm(P,T,N)
    //     W = ann_FFBP_lm(P,T,N,af,mu,mumax,theta,itermax,mse_min,gd_min)
    //
    // Parameters
    //     P : Training input
    //     T : Training target
    //     N : Number of Neurons in each layer, incluing Input and output layer
    //     af : Activation Function from 1st hidden layer to the output layer
    //     mu : lm mu value
    //     mumax : Maximum allowed mu value
    //     theta : mu mutiplier
    //     itermax : Maximum iteration
    //     mse_min : Minumum Error (Performance Goal)
    //     gd_min : Minimum Gradient
    //     W : Output Weight and bias
    //
    // Description
    //    This function perform FeedForward Backpropagation with Levenberg–Marquardt algorithm training function.
    //    
    // Examples
    //    P = [1 2 3 4; 1 2 3 4];
    //    T = [1 2 3 4];
    //    W = ann_FFBP_lm(P,T,[2 3 1]);
    //    y = ann_FFBP_run(P,W)
    // 
    // See also
    //     ann_FFBP_gd
    //     ann_FFBP_gda
    //     ann_FFBP_gdm
    //     ann_FFBP_gdx
    //     ann_FFBP_run
    //
    // Authors
    //     Tan C.L. 

    // Checking Input Arguement
    rhs=argn(2);

    // Error Checking
    if rhs < 3; error("Expect at least 3 arguments, P, T and N");end
    if rhs < 4; af = ['ann_tansig_activ','ann_purelin_activ']; end
    if rhs < 5; mu = 0.001; end
    if rhs < 6; mumax = 100000000; end
    if rhs < 7; theta = 10; end        
    if rhs < 8; itermax = 1000; end
    if rhs < 9; mse_min = 1e-5; end
    if rhs < 10; gd_min =  1e-5; end

    if af == []; af = ['ann_tansig_activ','ann_purelin_activ']; end
    if mu == []; mu = 0.001; end
    if mumax == []; mumax = 100000000; end
    if theta == []; theta = 10; end    
    if itermax == []; itermax = 1000; end
    if mse_min == []; mse_min = 1e-5; end
    if gd_min == []; gd_min =  1e-5; end


    // Initialization
    format(8);warning('off');
    W = ann_ffbp_init(N,[-1 1]);
    itercnt = 0;
    af_d = strsubst(af,'ann_','ann_d_');
    mse = %inf;
    gd = %inf;
    A = ann_ffbp_init(N,[0 0]);
    tempW = A;
    train_N = size(P,2);


    layers = size(N,2)-1; // layers here counted from 1st hidden layers to output layer
    n = list(0);
    a = list(0);
    m = list(0);
    s = list(0);
    while mse > mse_min & itercnt < itermax & mu <= mumax & gd > gd_min
//        if  modulo(itercnt,round(itermax/20)) == 0
//            mprintf('Epoch %3i / %i',itercnt,itermax);
//        end
        mucnt = 0;
        // Simulate Phase
        n(1) = W(1)(:,1:$-1)*P + repmat(W(1)(:,$),1,size(P,2)); // This could be save in temp n to save memory
        a(1) = evstr(af(1)+'(n('+string(1)+'))');
        for cnt = 2:layers
            n(cnt) = W(cnt)(:,1:$-1)*a(cnt-1) + repmat(W(cnt)(:,$),1,size(P,2)); // This could be save in temp n to save memory
            a(cnt) = evstr(af(cnt)+'(n('+string(cnt)+'))');
        end
        e = T - a($);

        //Create Net Object 
        // Currently this version of ann_FFBP_lm is using a function adopted from Octave to calculte Jacobian function
        // ToDO: Change the structure to be in Scilab Format
        // ToDo: Write whole Jac Function in Scilab
        // 26-July-2011 Currently Using functions from Hagan Book
        // ToDo: Modified for general functions
        // 3-Oct-2011 : Consider the trick on the back propogation

        // The last layer is given by following equation for linear and tansig
        //  [na,ma]=size(a); d = -kron(ones(1,ma),eye(na));
        //  [na,ma]=size(a); d = -kron(ones(1,ma),eye(na)).*kron((ones-(a.*a)),ones(1,na));
        [r,c] = size(a(layers));


        m(layers) = evstr(af_d(layers)+'(a('+string(layers)+'))'); 
        //        s(layers) = -(m(layers).*.eye(N($),N($)));
        s(layers) = -(m(layers).*.ones(1,r)).*(ones(1,c).*.eye(r,r));      
        for cnt = layers-1:-1:1
            //  The hidden layer is given by following equation for linear and tansig
            // [na,ma]=size(a); d = w'*d;
            // [s1,q]=size(a); d = (ones-(a.*a)).*(w'*d);

            Wpre = W(cnt+1)(:,1:$-1);        
            a(cnt) = a(cnt).*.ones(1,N($));
            m(cnt) = evstr(af_d(cnt)+'(a('+string(cnt)+'))');
            s(cnt) = m(cnt).*(Wpre'*s(cnt+1));
        end
        //    Jj = []'
        //    
        //        jac1 = ann_calcjac(kron(P,ones(1,N(3))),s1);
        //        jac2 = ann_calcjac(a1,s2);
        //        Jj=[jac1,s1',jac2,s2'];
        //
        //        mse = (mean(e.^2))
        //        mse2 = %inf;
        //        J = Jj;
        //        J2 = (J' * J);          

        Jj = [];

        jac = ann_calcjac(kron(P,ones(1,N($))),s(1));
        Jj = [Jj jac s(1)'];
        for cnt = 2:layers
            jac = ann_calcjac(a(cnt-1),s(cnt));
            Jj=[Jj jac s(cnt)'];
        end

        mse = (mean(e.^2))
        mse2 = %inf;
        J = Jj;
        J2 = (J' * J);          
        Je = J'*e(:);
        // Calculate Jacobian Matrix
        while  mse2 >= mse & mu <= mumax //round(10e10*mse2)/10e10 >= round(10e10*mse)/10e10


            //            dx = -(J2 + (eye(J2)*mu)) \ (J'*e(:));
            //            sz1 = N(1)*N(2) + N(2);
            //            sz2 = N(2)*N(3) + N(3);
            //            dx1 = dx(1:sz1)
            //            dx2 = dx(sz1+1:sz1+sz2);
            //            A(1) = [matrix(dx1(1:$-N(2)),N(2),N(1)) dx1($-N(2)+1:$)];
            //            A(2) = [matrix(dx2(1:$-N(3)),N(3),N(2)) dx2($-N(3)+1:$)];            
            //            tempW(1) = W(1) + A(1);
            //            tempW(2) = W(2) + A(2);
            //            
            dx = -(J2 + (eye(J2)*mu)) \ (Je);
            szpre = 0;
            for cnt = 1:layers
                sz = N(cnt)*N(cnt+1) + N(cnt+1);
                dx_part = dx(szpre+1:szpre+sz)
                A(cnt) = [matrix(dx_part(1:$-N(cnt+1)),N(cnt+1),N(cnt)) dx_part($-N(cnt+1)+1:$)];
                tempW(cnt) = W(cnt) + A(cnt);
                szpre = szpre + sz;
            end
            // Simulate Phase
            y = ann_FFBP_run(P,tempW,af);
            e2 = T - y;
            mse2 = (mean(e2.^2));
            if  mse2 >= mse //round(10e10*mse2)/10e10 >= round(10e10*mse)/10e10
                mu = mu*theta;
            end

        end

        mu = mu/theta;
        if (mu < 1e-20)   
            mu = 1e-20;
            // break
        end
        W = tempW;

        // Stopping Criteria
        mse = mean(e.^2);
        itercnt = itercnt + 1;
        //gd = mean(s(cnt).^2); 
        gd = 2*sqrt(Je'*Je)/train_N;

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
