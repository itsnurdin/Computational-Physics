%{
Diketahui 2 persamaan tinggi tangki berbentuk silinder dengan jari – jari 1 m dan volume 0.75 m3 . Tentukan persamaan tinggi tangki yang stabil dengan melihat nilai tebakannya.
Jawab:
Pertama memasukkan nilai V dan r yang telah diketahui ke persamaan awal hingga menjadi fungsi f (h) dan turunkan f (h)
Persamaan pertama:
h^2  = (h^3+(3*0,75/?))/3 
3h^2 = h^3 + 2,25/ ?
h^3 - 3h^2+ 2,25/ ?=0
Persamaan kedua:
h^3  =3(h^2 -  0,75/?) 
h^3 - 3h^2+ 2,25/ ?=0
f (h) = h^3 - 3h^2+ 2,25/ ? (Ternyata persamaan satu dan dua sama)
f ’ (h) = 3h^2 – 6h
%}
ho=3; % nilai tebakan 
n=100; %jumlah iterasi
err=1e-5; 
%Metode Newton Rapson
for i=1:n
    fh=ho^3-3*ho^2+2.25/pi; %fungsi awal
    dfh=3*ho^2-6*ho; %fungsi turunan kedua
    h=ho-fh/dfh; %rumus Newton Repson
    if abs(h-ho)<err
        nilaih = h
        padaiterasi = i
        break
    end
end 
    ho=h;
    for i=1:n
    fh=ho^3-3*ho^2+(2.25/pi); %fungsi awal
    dfh=3*ho^2-6*ho; %fungsi turunan kedua
    h=ho-fh/dfh; %rumus Newton Repson
    if abs(h-ho)<err
        nilaih = h
        padaiterasi = i
        break
    end
    ho=h;
end
