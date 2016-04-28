function y = dst(x)
%DST Discrete sine transform 
% Y = DST(X) returns the discrete Sine transform of X. The ouput
%     matches that of VSINT from VFFTPACK.  It is also the same 
%     as FFTW's DST-I except that DST-I is not normalized, i.e.,
%     to obtain the output identical to DST-I each entry must be
%     multiplied by SQRT(2*(N+1)) where N is the sequence length.
%
% The vector Y is a column the same size as X and contains the
% discrete sine transform coefficients.
%
% If X is a matrix, the DST operation is applied to each column.
% This transform is normalized to be it's own inverse, and 
% defined by
%
%   for I=1,...,N and J=1,...,M
%
%       Y(I,J) = the sum from k=1 to k=N
%
%                2*X(K,J)*SIN(K*I*PI/(N+1))/SQRT(2*(N+1))
%

if min(size(x)) == 1
   x = x(:);
end
 
[n m] = size(x);

yy = zeros(2*(n+1),m); 
yy(2:n+1,:) = x; 
yy(n+3:2*(n+1),:) = -flipud(x);
yy = fft(yy); 

% recover real components of sine terms and apply normalization

y = sqrt(2/(n+1))*real(0.5*i*yy(2:n+1,:));
 



