%Deklarasi untuk mencari nilai J (Jacobian) dan nilai X dari fungsi J(x)
%Nilai turunan jacobian dari fungsi f(x1) terhadap masing” elemen fungsi f(x1)yang ditampilkan dalam bentuk colom
%Nilai turunan jacobian dar fungsi f(x2)terhadap masing” elemen fungsi f(x2)yang ditampilkan dalam bentuk colom
%nilai turunan jacobian yang ditampilkan  secara matrik dengan menampilkan nilai fungsi f(x) perbaris

function [J,x] = J(x)
J(1,1) = 2*x(1); J(1,2) = 2*x(2);
J(2,1) = x(2); J(2,2) = x(1);
J = [J(1,1) J(1,2);J(2,1) J(2,2)];
