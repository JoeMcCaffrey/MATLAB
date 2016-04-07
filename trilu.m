function [ alpha, beta] = trilu( av ,bv ,cv )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

n = length(bv);

alpha = zeros(n,1);
beta = zeros(n,1);

alpha(1) = av(1);
for i = 2: n
    beta(i) = bv(i) / alpha(i-1); 
    alpha(i) = av(i) - beta(i)*cv(i-1);
end




