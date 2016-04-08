

x = 0:0.01:1; 
x=x';
u = exp(x) .* sin(pi*x);

for i = 1:4
    [vv,xx] = BVP1d_dst(2^i);
    subplot(2,2,i),plot(x,u,xx,vv, '*'), grid 
    legend('u','v',2);
end

