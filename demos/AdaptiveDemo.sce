
function adaptive_demo()

// Load Sound File and play origial voice with noise
load(ann_getToolboxPath() + "/demos/dataset/NN2_exer4.sod");
msg = 'Adaptive Filter Demo, press any key to listen the voice with noise';
msgtitle = 'Adaptive Filter with ADALINE';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
playsnd(voice_with_noise,Fs);
scf(101);plot(voice_with_noise);title("Voice With Noise")
sleep(1000)

msg = 'Press any key to listen to the original noise source';
msgtitle = 'Adaptive Filter with ADALINE';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
playsnd(original_noise,Fs);
scf(102);plot(original_noise);title("Original Noise")
sleep(1000)

// Adaptive Filter for noise filtering
P = original_noise;
T = voice_with_noise;
[w,b,y,ee] = ann_ADALINE_predict(P,T,0.05,1,2);

msg = 'Press any key to listen to the recovered voice';
msgtitle = 'Adaptive Filter with ADALINE';
btn = messagebox(msg, msgtitle, "info", "OK", "modal")
playsnd(ee,Fs);
scf(103);plot(ee);;title("Recovered Voice")
sleep(1000)

msg = 'End of demo, click exit to close all figures';
msgtitle = 'Adaptive Filter with ADALINE';
btn = messagebox(msg, msgtitle, "info", "exit", "modal")
xdel(101:103)
endfunction


adaptive_demo()
clear adaptive_demo;
