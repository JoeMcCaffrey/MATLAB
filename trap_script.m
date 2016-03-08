

disp(' ');
disp('   N            h           approx           err           err/h^2');
disp('--------------------------------------------------------------------------');


params = [ 2 4 8 16 32 64];

for n = 1 : 6
    my_trap(@(x)cos(x)+1,0,2*pi,params(n));
end