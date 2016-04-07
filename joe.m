
%  joe.m

%  -(epsilon)u'' + u = f
%   u(0)=u(1)=0 
%
%  u(x) = 2*x+1 - ...
% (sinh((1-x)/sqrt(epsilon))+3*sinh(x/sqrt(epsilon)))/sinh(1/sqrt(epsilon))  
%  f(x) = 2*x+1

a = 0;  b= 1;    % define grid enpoints
ua = 0;  ub = 0; % set BCs


nvals = 4.^(1:6)';             % grid sizes
hvals = zeros(length(nvals),1); % h = 1/n
err   = zeros(length(nvals),1); % inf norm error

e = 0.1;
sqrte  = sqrt(e);

for i = 1:length(nvals)
    
% set n, define h & create column of grid points

    n = nvals(i);       
    h = (b-a)/n; 
    hvals(i) = h;       
    xv = a:h:b; xv=xv'; 
 
% create diagonals of tridiagonal matrix

    av = (2*e+h*h)*ones(n-1,1)/(h*h);
    bv = -e*ones(n-1,1)/(h*h); bv(1)=0;
    cv = -e*ones(n-1,1)/(h*h); cv(n-1)=0;

% define rhs and adjust for BCs    
    
    fv = 2*xv(2:n)+1;  
    fv(1) = fv(1)+ua/(h*h); fv(n-1) = fv(n-1)+ub/(h*h);

% tridiagonal system solve 

    [alpha,beta]=trilu(av,bv,cv);
    v = my_trisolve(alpha,beta,cv,fv);

% set BCs, compute true solution and error    
    v = [ua;v;ub];

    u = 2*xv+1-(sinh((1-xv)/sqrte)+ ...
                3*sinh(xv/sqrte))/sinh(1/sqrte);
    err(i) = norm(u-v,'inf');
end
 
format short e
disp(' ')
disp('       h            err        err/h^2')
disp('-----------------------------------------')
disp([hvals  err  err./(hvals.^2)])
disp(' ')





