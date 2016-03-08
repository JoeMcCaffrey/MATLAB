for i=1:12
	p=i;
	n = 2^p;
	h = 1/n;
	x = h*(0:n)';

	u_h = (x.^2-x).*exp(x);  
	f_h = -(x.^2+3*x).*exp(x);                   
 
	a = 4*ones(n-1,1)/(h^2);   
	b = -ones(n-1,1)/(h^2);   
	c = -ones(n-1,1)/(h^2);  
 
	ftil = f_h(2:n);        
 
	v_h = my_trisolve(a,b,c,ftil); 
	v_h = [0;v_h;0];            
 
	w=u_h-v_h;
	InfNorm=norm(w,inf);
	InfNormOverHSquared=InfNorm/h^2;
	table(h,InfNorm,InfNormOverHSquared)
end