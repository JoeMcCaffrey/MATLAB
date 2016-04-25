
function y = mydct(x)
%MYDCT  Discrete cosine transform.
%
%   Y = DCT(X) returns the discrete cosine transform of X,
%
%   as defined by VCOST in VFFTPK
%  X       For I=1,...,N and J=1,...,M
%
%             X(J,I) = ( X(J,1)+(-1)**(I-1)*X(J,N)
%
%               + the sum from K=2 to K=N-1
%
%                 2*X(J,K)*COS((K-1)*(I-1)*PI/(N-1))
%                 )/SQRT(2*(N-1))
%
%   The vector Y is the same size as X and contains the
%   discrete cosine transform coefficients.
%
if min(size(x)) == 1
   x = x(:);
end
 
[n m] = size(x);

y = zeros(size(x));
yy = zeros(2*(n-1),m); 

yy(1:n-1,    :) = flipud(x(2:n,:));
yy(n:2*(n-1),:) = x(1:n-1,:);

yy = fft(yy); 

% recover real components (cosine terms) and apply normalization

fac = 1/sqrt(2*(n-1));  
y = fac*real(yy(1:n,:));
y(2:2:n,:) = -y(2:2:n,:);
