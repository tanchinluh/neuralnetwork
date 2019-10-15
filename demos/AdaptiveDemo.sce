
function adaptive_demo()

// Load Sound File and play origial voice with noise
load(ann_getToolboxPath() + "/demos/NN2_exer4.dat");
sound(voice_with_noise,8000);
sound(original_noise,8000);

// Simple Low Pass filter to filter the noise
lisys = iir (6, 'lp' , 'butt', [.3 0], [0 0]);
outsig = flts (voice_with_noise, lisys);
sound(outsig,8000);

// Adaptive Filter for noise filtering
P = original_noise;
T = voice_with_noise;
[w,b,y,ee] = ann_ADALINE_predict(P,T,0.05,1,2);
sound(ee,Fs);

endfunction


adaptive_demo()
clear adaptive_demo;