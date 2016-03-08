function [root,vals,iternum,ierr] = my_bisect(f,a,b,tol,itermax)
%
% MY_BISECT:  [root,vals,iternums,ierr] = my_bisect(f,a,b,tol,itermax)
%
%            f - a function of x as a string, e.g., f='x^2-3'
%            a - one endpoint of the initial interval 
%            b - the other endpoint of the initial interval
%          tol - stopping critera; when abs(b_cur-x_cur) < tol
%                the routine terminates (or when itermax is reached)
%      itermax - maximum number of iterations
%
% Output: root    - approximate root of f
%         vals    - a history of the iterations
%         iternum - number of iterations
%         ierr    - error flag:  0 - no error
%                                1 - f(a)*f(b) >= 0
%                                2 - itermax reached
format long e
ierr = 0;
a_cur = a; b_cur = b;
x = a_cur; fa = eval(f);
x = b_cur; fb = eval(f);

if (fa*fb >= 0)
   root = []; vals = []; iternum = []; ierr = 1;
   disp(' ')
   disp('Error:  f(a)*f(b) >= 0 ')
   disp(' ')
   return
end


x_cur = (a_cur+b_cur)/2;
iternum = 0; 
while ( ( abs(b_cur-x_cur) > tol) && (iternum <= itermax))
      iternum = iternum +1;
      x = x_cur; fx = eval(f);
      vals(iternum,1) = x_cur;  vals(iternum,2) = fx;
      if (fa*fx >= 0)
         a_cur = x_cur;
         fa = fx;
      else
         b_cur = x_cur;
         fb = fx;
      end 
      x_cur = (a_cur+b_cur)/2;
end
iternum = iternum+1;
x = x_cur; fx = eval(f);
vals(iternum,1) = x_cur;  vals(iternum,2) = fx;

disp(' ')
disp('            x_n                       f(x_n) ')
disp('    ------------------------------------------------ ')
disp(vals)
disp(' ')

root = x_cur;
if (iternum > itermax)
   ierr = 2;
end          
         