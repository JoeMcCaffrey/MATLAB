N = [64, 96, 128, 256, 368, 512, 1024, 1874, 2048, 3477, 4096];
plot_array = ones(1,11);
plot_array2 = ones(1,11);
tic;
for i = 1:numel(N)
    ave1 = 0;
    ave2 = 0;
    % this is taking a very long time so testing with n 1 to 5
    for n = 1: 5
        
        [x, y] = slow_dst(N(i));
        ave1 = ave1 + x;
        ave2 = ave2 + y;
    end
    ave1 = ave1 / 5;
    ave2 = ave2 / 5;
    plot_array(i) = ave1;
    plot_array2(i) = ave2;
    i
    
end
total = toc;
%plot_array;

figure(1);
semilogy(plot_array);
figure(2);
semilogy(plot_array2);
figure(3);
semilogy(plot_array, plot_array2);

