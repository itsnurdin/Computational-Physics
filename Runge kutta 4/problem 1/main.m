%{
Diketahui suatu persamaan yang menyatakan posisi penerjun payung yang jatuh dari pesawat dengan c 12,5 kg/s, 
massa penerjun 70 kg, 
gravitasi 9,81 m/s dan y(0) 5000 m.

input in command window : [t,x]=main(@fx,@fv,0,0,0,10,5)
%}

function [t,x]=main(fx,fv,tawal,vawal,xawal,takhir,p)
 
h=(takhir-tawal)/p;
 
t=zeros(p+1,1); v=zeros(p+1,1); x=zeros(p+1,1);
t(1)=tawal; v(1)=vawal; x(1)=xawal;
 
for s=1:p;
    t(s+1)=t(s)+h;
    k1v=h*fv(t(s),v(s),x(s));
    k1x=h*fx(t(s),v(s),x(s));
    k2v=h*fv(t(s)+h/2,v(s)+k1v/2,x(s)+k1x/2);
    k2x=h*fx(t(s)+h/2,v(s)+k1v/2,x(s)+k1x/2);
    k3v=h*fv(t(s)+h/2,v(s)+k2v/2,x(s)+k2x/2);
    k3x=h*fx(t(s)+h/2,v(s)+k2v/2,x(s)+k2x/2);
    k4v=h*fv(t(s)+h,v(s)+k3v,x(s)+k3x);
    k4x=h*fx(t(s)+h,v(s)+k3v,x(s)+k3x);
    v(s+1)=v(s)+(k1v+2*k2v+2*k3v+k4v)/6
    x(s+1)=x(s)-(k1x+2*k2x+2*k3x+k4x)/6
end
 
subplot(2,1,1);
plot(t,x);
subplot(2,1,2);
plot(t,v);
