num_iters = 500;

N = [64,96,128,256,368,512,1024,1874,2048,3477,4096];

time_vec = zeros(length(N),1);
time_dst = zeros(length(N),1);

for i = 1: length(N)
    nval = N(i);
    P = createP(nval);
    v = rand(nval -1,1);
    i
    tic;
    for j = 1 : num_iters
        Pv = P*v;
    end
    time_vec(i) = toc/num_iters;
    tic;
    for j = 1 : num_iters
        dst(nval);
    end
    time_dst(i) = toc/num_iters;
end
figure;
semilogy(N, time_vec, 'bo-');
hold on;
semilogy(N, time_dst, 'r^-');
legend('vector','dst');
grid on;
title('Comparisions of vector vs dst');
xlabel('N');
ylabel('time');
hold off;
