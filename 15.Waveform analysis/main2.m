[y,Fs] = audioread("E:\free_lancing_projects\15.Waveform analysis\4000 Hz.wav");
t = linspace(0,2,2*Fs);
[yupper,ylower] = envelope(y);
ydB = db(yupper);

[OS,OSLEV,OSINST] = overshoot(ydB,t);
D = OSLEV(1);
AH = D - 60;
CE = D - 1;
BG = D - 20;
AHIntersections=find(abs(ydB-AH)<=(0.009))/44100;
CEIntersections=find(abs(ydB-CE)<=(0.009))/44100;
BGIntersections=find(abs(ydB-BG)<=(0.09))/44100;

plot(t,ydB);hold on;

plot(CEIntersections(1),CE,'ro');hold on;
text(CEIntersections(1),CE,'C');
plot(CEIntersections(end),CE,'ro');hold on;
text(CEIntersections(end),CE,'E')

plot(AHIntersections(1),AH,'ro');hold on;
text(AHIntersections(1),AH,'A');
plot(AHIntersections(end),AH,'ro');hold on;
text(AHIntersections(end),AH,'H')

plot(BGIntersections(1),BG,'ro');hold on;
text(BGIntersections(1),BG,'B');
plot(BGIntersections(end),BG,'ro');hold on;
text(BGIntersections(end),BG,'G')
text(OSINST(1),D,'D');

xlabel('time(s)');
ylabel('dB');
AC_time = CEIntersections(1) - AHIntersections(1)
BC_time = CEIntersections(1) - BGIntersections(1)
DH_time = AHIntersections(end) - OSINST(1)
EG_time = BGIntersections(end) - CEIntersections(end)
OSINST(1)