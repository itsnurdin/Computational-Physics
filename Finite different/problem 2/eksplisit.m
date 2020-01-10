%{
Sebatang baja  mempunyai panjang 0.05 m, ujung kiri diberu suhu 150? dan sebelah kanan diketahui bersuhu 30?. Hitunglah distribusi suhu selama 9 detik . apabila diketahui suhu awal baja itu 30? dengan menggunakan metode implicit dan eksplisit. Gunakan nilai ?x 0.01 m dan ?t 3s. bandingkan dalam bentuk tabel nilai nilai di tiap tiap titik yang kalian hitung. Persamaan transfer panas diketahui :
?T/?t=? (?^2 T)/(?x^2 )-kT
?=1.4129 x ?10?^(-5) m^2s
k= 5 x ?10?^(-1) s^(-1)

input:
U = eksplisit(0.05,9,1.4129*10^(-5),30,150,30,4,6)
%}

function U = eksplisit(a,b,c,d,e1,e2,m,n)
%a=panjang batang baja
%b=t akhir
%c=alpha(1,4129x10^-5)
%d=suhu awal
%e1=suhu di ujung kiri
%e2=suhu di ujung kanan
%m=pembagian waktu
%n=pembagian titik dari batangnya
%k=nilai k pada soal

h=a/(n-1);      %delta x
z=b/(m-1);      %delta t
r=c*z/h^2;      %lamda
T=zeros(n,m);   
 
T(1,1:m)=e1;
T(n,1:m)=e2;
T(2:n-1, 1)=d;
 
for j = 2:m
    for i=2: n-1
        T(i,j)= T(i, j-1) +r*(T(i+1, j-1)-2*T(i, j-1) + T(i-1, j-1))-k*z*T(i, j-1);
    end
end
U=T';
