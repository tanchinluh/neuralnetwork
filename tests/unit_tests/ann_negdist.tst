// ann_negdist unitary test

// <-- JAVA NOT MANDATORY -->

w = [1 2 3;4 5 6];
x = [1 2; 3 4; 5 6];
d = ann_negdist(w, x);

D_REF = [ -2.236068,  -3.7416574; ..  
          -3.7416574, -2.236068];
          
assert_checkalmostequal(d, D_REF);             