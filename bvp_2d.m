
disp('              h               ||u_h - v_h ||(inf)        ||u_h - v_h ||(inf)/h^2     ');
disp('-------------------------------------------------------------------------------------');


for p = 1 : 12 
    n= 2^p;
    h= 1/n;
    x = h*(0:n)';

    u_h = (x.^(2)-x).*exp(x); % true solution given

    f_h = -(x.^(2)+3*x).*exp(x);

    a = 2*ones(n-1,1)/(h^2);   % create a, b & c of the tridiagonal -D^2 
    b = -ones(n-1,1)/(h^2);   
    c = -ones(n-1,1)/(h^2); 
 
 
    ftil = f_h(2:n); 
 
    v_h = my_trisolve(a,b,c,ftil);  %  solve 
    v_h = [0;v_h;0];             %  set BCs u(0)=u(1)=0
 
    format long e
    
    l = norm((u_h- v_h),inf);
    j = norm((u_h -v_h),inf)/h^2;
    
    X = [h,l,j];
    disp(X);
end

 