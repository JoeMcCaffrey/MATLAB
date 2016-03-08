function [P,x] = createP(N)

P = zeros(N-1,N-1);
h = 1/N;

%for j = 1:N-1
%    for k = 1:N-1
%        P(k,j) = sin(k*j*pi*h);
%    end 
%end
ind = (1:N-1)';
P = sin(ind*ind'*(pi*h));

P = sqrt(2/N)*P;
x = (0:h:1)';
