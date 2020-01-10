%{
3.	Diketahui suatu persamaan yang menentukan besar distribusi temperatur pada batang logam dengan 0?r?1. 
Dengan S = 1, 10, dan 20 K/m2 . maka buatlah plotnya jari- jari terhadap temperatur.
%}

R0 = 0; 
R1 = 1;
T0 = 1;
b0 = 0;
s = 1;
n = 1000;
h= (R1-R0)/n;
Z1 = zeros(n+1,1);
T1 = zeros(n+1,1);
b2 = zeros(n+1,1);
b1 =zeros(n+1,1)
T2= zeros(n+1,1);
Z2=zeros(n+1,1);
Z3=zeros(n+1,1);
T3=zeros(n+1,1);
b3=zeros(n+1,1)
Z(1)=R0 ; T(1)=T0 ; b(1) = b0;
for i=1:n
    Z1(i+1) = Z1(i)+h;
    dQdri = (-1/0.3*b1(i))-s;
    Q1(i+1)= b1(i)+h*dQdri;
    dQdr = (-1/0.3*Q1(i+1))-s;
    b1(i+1)= b1(i)+h/2*(dQdri+dQdr);
    dTdt = b1(i);
    T1(i+1)= T1(i)+h*dTdt;
     
end
m = 10;
for i=1:n
    Z2(i+1) = Z2(i)+h;
    dQdri = (-1/0.3*b2(i))-m;
    Q1(i+1)= b2(i)+h*dQdri;
    dQdr = (-1/0.3*Q1(i+1))-m;
    b2(i+1)= b2(i)+h/2*(dQdri+dQdr);
    dTdt = b2(i);
    T2(i+1)= T2(i)+h*dTdt;
     
end
g = 20;
for i=1:n
    Z3(i+1) = Z3(i)+h;
    dQdri = (-1/0.3*b3(i))-g;
    Q1(i+1)= b3(i)+h*dQdri;
    dQdr = (-1/0.3*Q1(i+1))-g;
    b3(i+1)= b3(i)+h/2*(dQdri+dQdr);
    dTdt = b3(i);
    T3(i+1)= T3(i)+h*dTdt;
     
end
 
[Z1 b1 T1 Z2 b2 T2 Z2 b3 T3]
 
 
plot  (Z1,T1)
hold on
plot  (Z2,T2)
hold on
plot  (Z3,T3)
hold on
xlabel('Waktu')
ylabel('Jari-Jari')
