
 p = 6;
 n = 2^p;
 h = 1/n;
 x = h*(0:n)';

 u_h = exp(x) + (1-exp(1))*x - 1;  % true solution u(0)=u(1)=0
 f_h = -exp(x);                    % -u'' = f
 
 a = 2*ones(n-1,1)/(h^2);   % create a, b & c of the tridiagonal -D^2 
 b = -ones(n-1,1)/(h^2);   
 c = -ones(n-1,1)/(h^2);  
 
 ftil = f_h(2:n);         % rhs is f evaluated at the n-1 interior pts
 
 v_h = tridiag(a,b,c,ftil);  %  solve 
 v_h = [0;v_h;0];             %  set BCs u(0)=u(1)=0
 
 plot(x,v_h-u_h,'r*')
 
 format long e
 max(abs(v_h-u_h))
 
 