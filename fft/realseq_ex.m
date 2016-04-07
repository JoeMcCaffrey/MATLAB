% example of fft of a real sequence

N   = 8;
h   = 2*pi/N;

xh = (0:N-1)'*h;
fh = 2+cos(2*xh)-sin(3*xh);

x = 0:(2*pi/96):2*pi;
f = 2+cos(2*x)-sin(3*x);

figure(1)
plot(x,f,'ks',xh,fh,'r*')

fhat = fft(fh)

