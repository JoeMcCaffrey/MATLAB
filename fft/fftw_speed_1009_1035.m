% FFT timings 
Nvec=1009:1035; ntrials=2500;
times=zeros(length(Nvec),1);
for i=1:length(Nvec)
    N=Nvec(i); v=rand(N,1); 
    tic; 
    for k=1:ntrials 
        w=fft(v); 
        v(1)=1; 
    end
    times(i)=toc;
end
times=times/ntrials;
figure(2)
plot(Nvec,times,'-*')
grid, xlabel('N'), ylabel('time (secs)')
title('Computational time for FFT , N=1009:1035')


