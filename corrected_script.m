disp(' ');
disp('   N            h           approx           err           err/h^4');
disp('--------------------------------------------------------------------------');

params = [ 2 4 8 16 32 64];

for n = 1 : 6
    corrected_trap(@(x)x.*exp(-x.^2),0,1,params(n),1,-1/exp(1));
end

