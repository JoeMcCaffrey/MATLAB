function vhat = recfft(v)
%
%RECFFT - recursive radix-2 FFT.  If length(v) is
%        not divisible by 2 straightforward matrix
%        multiply is used.
v = v(:);
N = length(v);
omega = exp(-2*pi*i/N);

if rem(N,2) == 0                   % N divisible by 2
   % Recursive divide and conquer
   n = (0:N/2-1)';
   fac = omega.^n;
   y = recfft(v(1:2:N-1));     % even terms
   z = fac.*recfft(v(2:2:N));  % odd terms multiplied by prefactor 
   vhat = [y+z;y-z];
else                              % odd length sequence
   % The Fourier matrix.
   j = 0:N-1;
   k = j';
   F = omega .^ (k*j);
   vhat = F*v;
end