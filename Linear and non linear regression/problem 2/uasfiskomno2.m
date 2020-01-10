%{
Diketahui suatu data dari hasil eksperimen:
X	     2	3	      4	     5	    6	7
f(x)	0.5	0.333	0.25	0.2	0.1667	0.1429

a.Gunakan metoda regresi linier dan regresi non linier untuk menentukan persamaan fungsi f(x) yang dapat dibenuk dari data eksperimen diatas.
b.Tentukan nilai  r^2 yang terbesar dari kedua metoda tersebut.
c.Tentukan nilai x untuk fungsi f(x)=0.23 dari kedua metoda tersebut, kemudian beri kesimpulan dari hasil yang kalian peroleh.

input:
uasfiskomno2 ([1 2 3 4 5],[0.5 0.8 0.9 0.941176 0.961538])
%}

function uasfiskomno2(x,y)
%------------------------------------
%UAS_Fisika-Komputasi_Nomor-2
%------------------------------------
%Nurdiansyah-G74150061
%------------------------------------
 
%syarat awal
n=length(x);
if length(y)~=n, error('x and y must be same length');
end
x=x(:);
y=y(:);
 
 
%fungsi ini untuk mencari nilai regresi linier  
fprintf('-------------------------------------------\n') 
fprintf('Regresi linier\n')
sx=sum(x);%sigma data a
sy=sum(y);% sigma data b
sx2=sum(x.*x);
sxy=sum(x.*y);
sy2=sum(y.*y);
a(1)=(n*sxy-sx*sy)/(n*sx2-sx^2); %koefisien regresi(kemiringan)
a(2)=sy/n-a(1)*sx/n; % konstanta
rRegln=((n*sxy-sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2; %Koefisien determinasi regresi
xp=linspace(min(x), max(x),2); % variabel predictor atau variabel faktor penyebab
yp=a(1)*xp+a(2); %fungsi tebakan(Variabel Response)
fprintf('Koefisien determinasi regresi (R kuadrat) = %.5f\n',rRegln);
fprintf('persamaan y=[%.5f]+[%.5f]*x\n',a(1),a(2));
fprintf('\n') 
 
fprintf('-------------------------------------------\n') 
fprintf('Regresi fungsi eksponensial\n')
sx=sum(x); %sigma x
sy=sum(log(y));
sx2=sum(x.*x);
sxy=sum(x.*log(y));
sy2=sum(log(y).*log(y));
a1Eks=(n*sxy-sx*sy)/(n*sx2-sx^2);
a2Eks=sy/n-a1Eks*sx/n;
rEks=((n*sxy-sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2; %Koefisien determinasi regresi fungsi ekponensial
bEks=exp(a2Eks);
ypEks =bEks*exp(a1Eks*x); %fungsi tebakan(Variabel Response)
fprintf('Koefisien determinasi regresi (R kuadrat) = %.5f\n',rEks);
fprintf('persamaan y=[%.5f]*exp([%.5f]*x)\n',bEks,a1Eks);
fprintf('\n') 
 
fprintf('-------------------------------------------\n') 
fprintf('Regresi fungsi pangkat\n')
sx = sum(log10(x));
sy = sum(log10(y));
sx2 = sum(log10(x).*log10(x));
sxy = sum(log10(x).*log10(y));
sy2 = sum(log10(y).*log10(y));
a1Pangkat = (n*sxy-sx*sy)/(n*sx2-sx^2);
a2Pangkat = sy/n-a1Pangkat*sx/n;
rPangkat = ((n*sxy-sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2; %Koefisien determinasi regresi fungsi pangkat
bPangkat=10.^(a2Pangkat);
ypPangkat = bPangkat.*(x.^a1Pangkat); %fungsi tebakan(Variabel Response)
fprintf('Koefisien determinasi regresi (R kuadrat) = %.5f\n',rPangkat);
fprintf('persamaan y=[%.5f].*(x.^[%.5f])\n',bPangkat,a2Pangkat);
fprintf('\n') 
 
fprintf('-------------------------------------------\n') 
fprintf('Regresi fungsi Saturasi\n')
sx = sum(1./x); sy = sum(1./y);
sx2 = sum((1./x).*(1./x));
sxy = sum((1./x).*(1./y));
sy2 = sum((1./y).*(1./y));
a1Sat = (n*sxy-sx*sy)/(n*sx2-sx^2);
a2Sat = sy/n-a1Sat*sx/n;
rSat = ((n*sxy-sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2; %Koefisien determinasi regresi fungsi saturasi
bSat=1/a2Sat;
ypSat = bSat.*(x/(((bSat*a1Sat)+x))); %fungsi tebakan(Variabel Response)
fprintf('Koefisien determinasi regresi (R kuadrat) = %.5f\n',rSat);
fprintf('persamaan y=[%.5f].*(x/((([%.5f]*[%.5f])+x)))\n',bSat,bSat,a1Sat);
fprintf('\n') 
 
%---------------------
%Plotting Area =
subplot(4,1,1);    %membuat grafik yang ditampilkan menjadi 4
plot(x,y,'o',xp,yp);    %menampilkan grafik regresi linier
title('Grafik regresi linier ') %judul grafik
xlabel('x')                %menampilkan label pada grafik 
ylabel('y')   %menampilkan label pada grafik 
subplot(4,1,2);    %membuat grafik yang ditampilkan menjadi 4 
plot(x,y,'x',x,ypSat);     %menampilkan grafik regresi fungsi saturasi
title('Grafik regresi fungsi saturasi')    %judul grafik 
xlabel('x')                %menampilkan label pada grafik 
ylabel('y')      %menampilkan label pada grafik
subplot(4,1,3);    %membuat grafik yang ditampilkan menjadi 4
plot(x,y,'o',x,ypPangkat);     %menampilkan grafik regresi fungsi pangkat
title('Grafik regresi fungsi pangkat')    %judul grafik 
xlabel('x')                %menampilkan label pada grafik 
ylabel('y')      %menampilkan label pada grafik
subplot(4,1,4);    %membuat grafik yang ditampilkan menjadi 4
plot(x,y,'o',x,ypEks);     %menampilkan grafik regresi fungsi eksponensial
title('Grafik regresi fungsi Eksponensial')    %judul grafik 
xlabel('x')                %menampilkan label pada grafik 
ylabel('y')      %menampilkan label pada grafik
 
%---------------------
%END of program
%---------------------
