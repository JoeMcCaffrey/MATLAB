
%  driver_fdbvp_2nd
%  -u'' = f
%   u(0)=u(1)=0 
%
%  u(x) = (x.^2-x).*exp(x)  
%  f(x) = -(x.^2+3*x).*exp(x)

a = 0;  b= 1;    % define grid enpoints
ua = 0;  ub = 0; % set BCs

nvals = 2.^(1:5)';             % grid sizes
hvals = zeros(length(nvals),1); % h = 1/n
err   = zeros(length(nvals),1); % inf norm error

for i = 1:length(nvals)
    
% set n, define h & create column of grid points

    n = nvals(i);       
    h = (b-a)/n; 
    hvals(i) = h;       
    xv = a:h:b; xv=xv'; 
 
% create diagonals of tridiagonal matrix

    av = 2*ones(n-1,1)/(h*h);
    bv = -ones(n-1,1)/(h*h); bv(1)=0;
    cv = -ones(n-1,1)/(h*h); cv(n-1)=0;

% define rhs and adjust for BCs    
    
    fv = -(xv(2:n).^2+3*xv(2:n)).*exp(xv(2:n));
    fv(1) = fv(1)+ua/(h*h); fv(n-1) = fv(n-1)+ub/(h*h);

% tridiagonal system solve 

    [alpha,beta]=trilu(av,bv,cv);
    %v = trilu_solve(alpha,beta,cv,fv); 
    v = my_trisolve(alpha,beta,cv,fv);
    
    disp(alpha);
    
% set BCs, compute true solution and error    
    v = [ua;v;ub];
    u = (xv.^2-xv).*exp(xv);
    err(i) = norm(u-v,'inf');
end
 
format short e
disp(' ')
disp('       h            err        err/h^2')
disp('-----------------------------------------')
disp([hvals  err  err./(hvals.^2)])
disp(' ')





