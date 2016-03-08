function [ x ] = my_trisolve2( a,b,c,f )
% TRISOLVE: [x] = tirsolve(a,b,c,f)
%  
%
% Input:
%       a - a vector denoting the center diagonal in a matrix
%       b - a vector denoting the left center diagonal 
%       c - a vector denoting the right center diagonal
%       f - the solution to Ax =b where f is b
%
% Output:
%       x - the solution to [TridiagonalMatrix]X = f
% This function will solve a tridiagonal matrix of size n 
% 

% get the length of vector a
n = length(a);

% init vector x with zeros
x = zeros(n,1);

c(1) = c(1) /a(1);
f(1) = f(1) /a(1);

for i =2 : n-1
    m = a(i) - b(i) * c(i-1);
    
    c(i) = c(i) * m;
    
    f(i) = (f(i) - c(i) * f(i-1))*m;
    
end

for j = n-1 : -1 :1
    x(j) = x(j) - c(j) * x(j+1);
end
