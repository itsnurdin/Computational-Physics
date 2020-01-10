%{
Selesaikan persamaan non linier di bawah ini menggunakan metode newton raphson dan secant!
f1(x1,x2)= x1^2+x2^2-50
f2(x1,x2)=x1-x2-21

input:
x=[8;9]
dx=0.0001
[x,iter] = secantm(x,dx,@f)

%}
[x,iter]=secantm(x,dx,f)
N = 100; 
epsilon = 1.0e-10; 
maxval = 10000.0; 
if abs(dx)<epsilon
error('dx = 0, use different values');
abort;
end;
xm = x; 
[m] = size(x);

while (N>0)
for j = 1:m % Estimating
    xx = xm; % Jacobian by
    xx(j) = xm(j) + dx; % finite
    fxx = feval(f,xx)
    fxm = feval(f,xm);
    JJ(:,j) = (fxx-fxm)/dx; 
end; 
   if abs(det(JJ))<epsilon
      error('newtonm - Jacobian is singular - try new x0,dx');
      abort;
   end;
xmp1 = xm - inv(JJ)*fxm;
   fmp1 = feval(f,xmp1);
   if abs(fmp1)<epsilon
   x=xmp1;
   iter = 100-N;
   disp(['iterations: ', num2str(100-N)]);
   return;
   end;
if abs(fmp1)>maxval
    iter = 100-N;
    disp(['iterations: ', num2str(100-N)]);
    error('Solution diverges');
    break;
end;
   N = N - 1;
   xm = xmp1;
end;
 error('No convergence');
return;
