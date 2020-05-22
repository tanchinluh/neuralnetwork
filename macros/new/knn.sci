// Macro for K Nearest neighbours classification -- Scilab 

// Subroutine to get distance between two points
function dist = getDistance(x1, x2)

//    if length(x1)==length(x2) then
//        err = x1 - x2;
//    else
        err = x1 - repmat(x2,1,size(x1,2));
//    end

    //dist = sqrt(sum(err.^2,1));
    dist = sqrt(sum(err.^2,1));
endfunction

function f = stats_mode(i)

    m = tabul(i);                          
    [occ , p] = max(m(:,2));
    f = m(p);                  
    //results = [m(1,p) string(occ)] 

endfunction

// Function to return flags for category of each data point
function [pred,dd] = knn(x, y, xtest, k)
    pred = zeros(1,size(xtest,2));
  //   pause
    for cnt = 1:size(xtest,2)
  //      disp(cnt);
        dist = getDistance(x, xtest(:,cnt));
        dd(:,cnt) = dist;
        [V,i] = gsort(dist,'g','i');    
        f = stats_mode(y(i(1:k)));
        //pred(cnt) = y(f);
        pred(cnt) = f;
    end
   // disp(dist);

endfunction

