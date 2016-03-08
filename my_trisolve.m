function [ y ] = my_trisolve( a,b,c,f )
% TRISOLVE: [y] = tirsolve(a,b,c,f)
%  
%
% Input:
%       a - a vector denoting the center diagonal in a matrix
%       b - a vector denoting the left center diagonal 
%       c - a vector denoting the right center diagonal
%       f - the solution to Ax =b where f is b
%
% Output:
%       y - the solution to [TridiagonalMatrix]X = f
% This function will solve a tridiagonal matrix of size n 
% 

n = length(a);
y = zeros(n,1);   


for i=2 :n
    coeff = b(i)/a(i-1); 
    a(i) = a(i) - coeff*c(i-1);
    f(i) = f(i) - coeff*f(i-1);
end
y(n) = f(n)/a(n);
for j=n-1:-1:1
   y(j) = (f(j) - c(j+1) *y(j+1))/a(j);
end

