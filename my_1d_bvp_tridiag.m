function [ eigen ] = my_1d_bvp_tridiag(N)


h = 1/N ;

main = ones(1,4^N) * 2 ;

one = ones(1,4^N);

f = poiss1d_2P(4^N);
disp('true solution');
disp(f);
main = main * 1/(h^2);
one = one * 1/(h^2);
one = one * -1;
eigen = my_trisolve(main, one,one,f);

disp('solution');
disp(eigen);




