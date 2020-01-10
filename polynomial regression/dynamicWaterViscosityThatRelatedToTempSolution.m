%{
Dynamic viscosity of water ?(10.3 N.s/m2) is related to temperature T(?C) in the following manner:

T	?
0	1.787
5	1.519
10	1.307
20	1.002
30	0.7975
40	0.6529

a)	Plot this data.
b)	Use linear interpolation to predict ? at T = 7.5 °C.
c)	Use polynomial regression to fit a parabola to the data in order to make the same  prediction.
%}

clear;
clc;
x=[0 5 10 20 30 40];
yi=[1.787 1.519 1.307 1.002 0.7975 0.6529];
m=2 ;
n=6;
sumx=sum(x);
sumy=sum(yi);
sumx2=sum(x.^2);
sumx3=sum(x.^3);
sumx4=sum(x.^4);
sumxy=sum(x.*yi);
sumx2y=sum((x.^2).*yi);
N=[n sumx sumx2; sumx sumx2 sumx3; sumx2 sumx3 sumx4]
r=[sumy sumxy sumx2y]'
a=N\r
a0=a(1,1);
a1=a(2,1);
a2=a(3,1);
y1=a0+a1*x+a2*(x.^2);
y2=y1;
plot(x,y1,x,y2,'r.')
s=(yi-a0-a1*x-a2*(x.^2)).^2;
sr=sum(s);
syx=sqrt(sr/(n-(m+1)))
yrata=mean(yi);
sb=(yi-yrata).^2;
st=sum(sb);
r2=(st-sr)/st
r=sqrt(r2)
