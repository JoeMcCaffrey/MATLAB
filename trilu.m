function [ alpha, beta] = trilu( av ,bv ,cv )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

n = length(bv);

alpha = zeros(size(bv));
beta = zeros(size(cv));

alpha(1) = bv(1);
for i = 2: n
    beta(i) = av(i) / alpha(i-1); 
    alpha(i) = bv(i) - (beta(i)*cv(i-1));
end




