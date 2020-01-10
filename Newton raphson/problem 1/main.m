ho=3; % nilai tebakan 
n=100; %jumlah iterasi
err=1e-5; 
%Metode Newton Rapson
for i=1:n
    fh=-pi*ho^3+3*pi*ho^2-1.5; %fungsi awal
    dfh=-3*pi*ho^2+6*pi*ho; %fungsi turunan kedua
    h=ho-fh/dfh; %rumus Newton Repson
    if abs(h-ho)<err
        nilaih = h
        padaiterasi = i
        break
    end
   
    ho=h;
end
