function [x, r, p,nr, N, whos_] = bcgstab(A, b, x0, taux, itmax)
x = x0;  
r = b - A * x;
r0 = r;
rt = r;
p = r;
N = 1;
nr(N) = norm(r0)
while (norm(r) > taux * norm(r0)) && (N <= itmax)
  N = N + 1;
  alpha = dot(rt,r)/dot(A*p,rt);
  s = r - alpha *A *p;
  w = dot(A*s,s)/dot(A*s,A*s);
  x_ = x + alpha *p + w *s;
  r_ = s - w * A * s;
  beta = ((rt' * r_)/(rt' * r))*(alpha/w);
  p_ = r_ + beta*(p - w * A *p);
  r = r_;
  x = x_;
  p = p_;
  nr(N) = norm(r);

end

whos_ = whos;

endfunction
