

n = [1:12]';

hvals = zeros(length(n),1);
err = zeros(length(n),1);



for i = 1: length(n)
	N = 2^(n(i));
	h=1/N; hvals(i) =h;
	xh = h*(0:N)';
	lam = 2*(1-cos(xh*pi))/(h^2);

	uh = (xh.^2).*((xh-1).^2).*exp(xh);
	fh = -exp(xh).*(xh.^4+6*xh.^3+xh.^2-8*xh+2)+uh;

	ftil = mydct(fh);
	vtil = ftil./(lam+1);
	
	vh = mydct(vtil);
	
	err(i) = max(abs(uh-vh));

end

format short e
disp(' ');
disp('      h        inf_error          inf_error/h^2');
disp('-----------------------------------------------');
disp([hvals err err./(hvals.^2)]);

