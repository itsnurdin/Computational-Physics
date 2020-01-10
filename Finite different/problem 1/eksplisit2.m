%{
Carilah solusi persamaan diferensial parsial dibawah ini:
(?^2 T)/(?x^2 )+b ?T/?x=?T/?t
Dengan syarat batas: T(0,t)=0 dan T(1,t)=0
Kondisi awal: T(x,0)=0 0?x?1
	 
a.Gunakan metode finite difference (FDM) eksplisit untuk menjabarkan solusi persamaan diatas.
b.Buatlah program FDM tersebut dengan bahasa pemrograman Matlab untuk solusi persamaan diatas dengan ketentuan: ?t?(?x^2)/2
c.Plot T terhadap x sebagai fungsi dari t dengan variasi nilai b = 4, 2, 0, -2, -4

input:
U=eksplisit2(0.05,9,1.4129E-5,20,100,25,4,6)

nb:
a= PanjangBatang; %panjang Awal batang baja
b=Takhir; %Suhu akhir
d= SuhuAwal;%suhu awal
e1=SuhuUjungkiri; %suhu di ujung kiri
e2=SuhuUjungKanan;%suhu di ujung kanan
m=PembagianWaktu; %pembagian waktu
n=PembagianTitik; %pembagian titik dari batangnya


%}


function U=eksplisit2(a,b,c,d,e1,e2,m,n)
%------------------------------------
%Nurdiansyah-G74150061
%------------------------------------

%fungsi ini untuk mencari distribusi menggunakan metode eksplisit
fprintf('-------------------------------------------\n') 
fprintf('Metode Eksplisit')
fprintf('-------------------------------------------\n')
%U=eksplisit(0.05,9,1.4129E-5,20,100,25,4,6)
h=a/(n-1); %delta x
k=b/(m-1); %delta t
r=c*k/h^2; %lamda, c= alpha
T=zeros(n,m); 
T(1,1:m)=e1; %batas kiri
T(n,1:m)=e2; %batas kanan
T(2:n-1,1)=d; %batas ditengah
for j=2:m
    for i=2:n-1
       T(i,j)=T(i,j-1)+((k/(h.^2))*(T(i+1,j-1)-2*T(i,j-1)+T(i-1,j-1)))+(r*(T(i,j)-T(i,j-1)));
        %perhitungan finite diffrence dari penurunan deret Taylor-nya
    end
end 
U=T';%transpors matriks
 
figure(1) %membuat grafik 1
surf(U)
xlabel('f')
ylabel('x')
zlabel('U')

figure(2) %membuat grafik 2
x=(0:0.01:0.05);
y1=U(2,1:n);
y2=U(3,1:n);
y3=U(4,1:n);
 
plot(x,y1,'-',x,y2,'-',x,y3,'-') % plot grafik
 
%axis(0:0.001:0.05)
xlabel('panjang(m)') %menampilkan label pada grafik
ylabel('temperature(t)')%menampilkan label pada grafik
legend('Time:3s','Time:6s','Time:9s') %pembagian garis pada grafik bergantung pada waktu
