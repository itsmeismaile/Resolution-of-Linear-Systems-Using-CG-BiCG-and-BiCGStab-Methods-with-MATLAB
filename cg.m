function [x,r,p,nr,N,whos_] = cg(A,b,x0,taux,itmax)
  x = x0;
  r = b - A*x;
  r0 = r;
  p = r;
  N = 1;
  nr(N) = norm(r0)
  
   while (norm(r) > taux * norm(r0)) && (N <= itmax)
   N = N + 1;       
   Ap  = A * p;
   alpha = dot(r,r)/dot(p,Ap)
   x = x + alpha * p;
   r = r - alpha * Ap;
   beta = dot(r,r)/(alpha*dot(p,Ap));
   p = r + beta * p;
   nr(N) = norm(r);
 
     
     
   endwhile
whos_ = whos;

endfunction
