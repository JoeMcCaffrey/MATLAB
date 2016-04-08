h_column = zeros(15:1);
c_vec = zeros(15:1);
c2_vec = zeros(15:1);



for j =1 :15
    h_column(j) =1/(2^j);
    
    [c,r] = BVP1d_dst(2^j);
  
    u = sin(pi*r).*exp(r); % exact solution
    c_vec(j) = norm((u-c),inf);
    c2_vec(j) = norm((u-c),inf)./(h_column(j).^2);
end

format short e
disp(' ')
disp('       h            err        err/h^2')
disp('-----------------------------------------')


h2 =c_vec./(h_column.^2);
h2 = h2';
c2_vec = c2_vec';
h_column = h_column';
c_vec = c_vec';

printvec = [ h_column c_vec c2_vec];

disp(printvec);

disp(' ')
