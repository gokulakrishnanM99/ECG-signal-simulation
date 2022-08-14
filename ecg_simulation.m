clc;
clear all;
close all;
x=0:0.01:20;
pwa=0.25;pwd=0.09;pwt=0.16;
        qwa=0.08;qwd=0.077;qwt=0.166;
        qrsa=1.6;qrsd=0.11;
        swa=0.25;swd=0.066;swt=0.09;
        twa=0.35;twd=0.142;twt=0.2;
        uwa=0.035;uwd=0.0476;uwt=0.433;
d=input('Enter the heart rate: ');
  r=60/d;  
    l=r;

%pwave
a1=pwa;
x1=x+pwt+0.25;
b1=(2*l)/pwd;
n=100;
p1=1/l;
p2=0;
for i = 1:n
    y1=(((sin((pi/(2*b1))*(b1-(2*i))))/(b1-(2*i))+(sin((pi/(2*b1))*(b1+(2*i))))/(b1+(2*i)))*(2/pi))*cos((i*pi*x1)/l);            
    p2=p2+y1;
end
pwav1=p1+p2;
pwav=(a1*pwav1);
%q wave
x2=x+qwt-0.095;
a2=qwa;
b2=(2*l)/qwd;
n=100;
q1=(a2/(2*b2))*(2-b2);
q2=0;
for i = 1:n
    y2=(((2*b2*a2)/(i*i*pi*pi))*(1-cos((i*pi)/b2)))*cos((i*pi*x2)/l);
    q2=q2+y2;
end
qwav=-1*(q1+q2);
%qrs wave
a3=qrsa;
b3=(2*l)/qrsd;
n=100;
qrs1=(a3/(2*b3))*(2-b3);
qrs2=0;
for i = 1:n
    y3=(((2*b3*a3)/(i*i*pi*pi))*(1-cos((i*pi)/b3)))*cos((i*pi*x)/l);
    qrs2=qrs2+y3;
end
qrswav=qrs1+qrs2;
%swave
x4=x-swt;
a4=swa;
b4=(2*l)/swd;
n=100;
s1=(a4/(2*b4))*(2-b4);
s2=0;
for i = 1:n
    y4=(((2*b4*a4)/(i*i*pi*pi))*(1-cos((i*pi)/b4)))*cos((i*pi*x4)/l);
    s2=s2+y4;
end
swav=-1*(s1+s2);
%twave
l=r;
a5=twa;
x5=x-twt-0.15;
b5=(2*l)/twd;
n=100;
t1=1/l;
t2=0;
for i = 1:n
    y5=(((sin((pi/(2*b5))*(b5-(2*i))))/(b5-(2*i))+(sin((pi/(2*b5))*(b5+(2*i))))/(b5+(2*i)))*(2/pi))*cos((i*pi*x5)/l);            
    t2=t2+y5;
end
twav1=t1+t2;
twav=a5*twav1;
%uwave
a6=uwa;
x6=x-uwt-0.095;
b6=(2*l)/uwd;
n=100;
u1=1/l;
u2=0;
for i = 1:n
    y6=(((sin((pi/(2*b6))*(b6-(2*i))))/(b6-(2*i))+(sin((pi/(2*b6))*(b6+(2*i))))/(b6+(2*i)))*(2/pi))*cos((i*pi*x6)/l);            
    u2=u2+y6;
end
uwav1=u1+u2;
uwav=a6*uwav1;
ecgd=(pwav+qwav+qrswav+twav+swav+uwav)-(1-l);
figure;
plot(x/2,ecgd);         
xlabel('time(s)');
ylabel('amplitude(mv)');
 
  if d>85
 title('Tachycardia');
     disp('Tachycardia');
 elseif d<65
 title('Bradycardia');
     disp('Bradycardia');
  else
 title('Normal ecg');
     disp('Normal heart rate');
  end