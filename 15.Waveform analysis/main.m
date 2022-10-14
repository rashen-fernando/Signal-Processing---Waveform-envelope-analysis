[y,Fs] = audioread("E:\free_lancing_projects\15.Waveform analysis\4000 Hz.wav");
t = linspace(0,2,2*Fs);
[yupper,ylower] = envelope(y);
ydB = db(y);
[R,rlt,rut,rll,rul] =risetime(db(yupper),t);
%riseTime = ut - lt; 
[OS,OSLEV,OSINST] = overshoot(db(yupper),t);
[f,flt,fut,fll,ful] = falltime(db(yupper),t);
risetime(db(yupper),t);hold on;
overshoot(db(yupper),t);hold on;
falltime(db(yupper),t);

