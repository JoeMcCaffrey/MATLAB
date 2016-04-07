function [time1,time2] = slow_dst(N)

% this function takes a number N and computes 
% the discrete sine transform from a
% random v in both the
% straight forward matrix multplication and 
% by the recursive dst 

% it returns the time to compute both 


P = createP(N);

realv = rand(N-1);

tic;
P * realv;
time1 =toc;
tic;
dst(realv);
time2 = toc;