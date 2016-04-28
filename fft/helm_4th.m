n = [1:12]';

hvals = zeros(length(n),1);
err = zeros(length(n),1);


for i =1:length(n)
    N = 2^(n(i));
    h = 1/N; hvals(i) = h;
    xh = h *(0:N)';
    lam = 2*(1-cos(xh(2:N)*pi))/(h^2);
    
    uh = exp(xh).*sin(pi*xh);
    f = exp(xh).*(pi^2*sin(pi*xh)-2*pi*cos(pi*xh));
    
    fh = f(2:N);
    
    fdot = zeros(size(fh));
    
    fdot(1) = f(1); fdot(end) = f(N+1);
    
    t1 = (h*h)/12;
    
    vh = (1-t1 * lam).* dst(fh) + dst(fdot)/12;
    
    vh = vh ./(lam-t1 * lam+1);
    
    vh = dst(vh);
    
    vh = [0;vh;0];
    
   err(i) = max(abs(uh-vh));
    if (i < 5)
        subplot(2,2,i)
        plot(xh,uh,xh,vh,'*')
        legend('uh','vh','location','northwest')
    
        title([' N: ',num2str(N)]);
    end
end

format short e
disp(' ')
disp('      h         inf_error   inf_error/h^4')
disp('-----------------------------------------')
disp([hvals err err./(hvals.^4)])
    
    
    