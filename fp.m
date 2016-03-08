% graphsetup

N = (1:25)';
h = 2.^(-N);

%yp = (exp(1+h) - exp(1))./h;
yp = (exp(1+h) - exp(1-h))./(2.*h);
err = abs(yp - exp(1));

figure(1)
loglog(h,err,'*'), grid
xlabel('\fontsize{14} h'),ylabel('\fontsize{14} error')
title('\fontsize{16} Joseph McCaffrey')

format short e
disp(' ')
disp('        h          err          err/h ')
disp('   -------------------------------------')
disp([h err err./h])
disp(' ')