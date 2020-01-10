%{
Selesaikan persamaan non linier di bawah ini menggunakan metode newton raphson!
f1(x1,x2)= x1^2+x2^2-50
f2(x1,x2)=x1-x2-21
%}

function [x,iter] = newtonm(x,f,J)
N = 100; 
epsilon = 1e-10;

maxval = 10000.0; 
xx = x; 

while (N>0)


JJ = feval(J,xx);


if abs(det(JJ))<epsilon

error('newtonm - Jacobian is singular - try new x0');
abort;

end;
xn = xx - inv(JJ)*feval(f,xx);

if abs(feval(f,xn))<epsilon


x=xn;

iter = 100-N;
return;

end;
if abs(feval(f,xx))>maxval

iter = 100-N;
disp(['iterations = ',num2str(iter)]);
error('Solution diverges');



abort;
end;
N = N - 1;
xx = xn;
end;
error('No convergence after 100 iterations.');

abort;

%mencari nilai fungsi x dan iterasi dari aturan fungsi newton
%Nilai maksimun iterasi
%Nilai toleransi yang digunakan untuk membandingkan nilai hasil f(x)
%Nilai maksimal darifungsi f(x)
%Mendeklarasikan fungsi tebakan xx dari nilai x yang akan kita input
%Pengkondisian jika nilai iterasi (N) lebih besar dari 0 akan melakukan proses pencarian nilai JJ
%Deklarasi nilai JJ menggunakan nilai turunan jacobian dan nilai tebakan
%Pengkondisian jika niali absolut dari determinan JJ lebih kecil dari epsion akan error
%Pesan yang akan tampil pada layar jika terjadi error
%fungsi akan dihentikan akibat dari terjadinhya error
%Fungsi selesai
%Mencari Nilai turunan newton-raphson jacobian 
%Pengkondisian jika nilai absolut 
dari nilai (f,xn) lebih kecil dari nilai toleransi
%Deklarasi nilai x dari fungsi newton-raphson
%Perhitungan nilai iterasi 
%Instruksi untuk melakukan Proses Looping 
%Instruksi untuk menghentikan proses
%Pengkondisian jika nilai absolut dari feval(f,xx) lebih besar dari dari nilai maksimum
%Perhitungan nilai iterasi 
%Instruksi untuk menampilkan nilai iterasi
%Menampilkan pesan “solution Diverges” akibat dari nilai feval (f,xx) yang lebih dari nilai maksimum yang ditentukkan
%Instruksi untuk menghentikan proses 
%Fungsi selesai
%Rumus untuk nilai Iterasi 
%Instruksi nilai xn dari nilai xx
%Proses dihentikan
%Operasi error dan akan menampilkan pesan “No Convergence after 100 iterations” 
%Operasi di hentikan
