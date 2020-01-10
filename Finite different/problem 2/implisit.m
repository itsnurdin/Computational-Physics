function U = implisit(apanjang,waktu,alpha,suhuawal,suhukiri,suhukanan,t,l,z)
U=zeros(t,l);
R=zeros(l,l);
h=apanjang/(l-1);   %delta x
k=waktu/(t-1);      %delta t
r=alpha*k/(h^2);    %lamda
beta=z*k;           %z adalah nilai k pada soal
 
R(1,1)=1;
R(l,l)=1;
T(2:l-1,1)=suhuawal;
T(1,1)=suhukiri;
T(l,1)=suhukanan;
v=T';
U(1,1:l)=v;
 
for j=2:t
    for i=2:l-1
        R(i,i-1)=-1*r;
        R(i,i)=2*r+beta+1;
        R(i,i+1)=-1*r;
    end
    T=R\T;
    v=T';
    
    U(j,1:l)=v;
end
