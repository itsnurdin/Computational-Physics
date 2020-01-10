%mencari nilai f dari fungsi f(x)
%Deklarasi untuk fungsi yang pertama
%Deklarasi untuk fungsi yang kedua
%nilai f dari fungsi f(x) yang ditampilkan dalam bentuk matrix

function [f] = f(x)
f(1)= x(1)^2 + x(2)^2 - 50;
f(2) = x(1)*x(2) -25;
f = [f(1); f(2)];
