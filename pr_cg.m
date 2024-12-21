function [x, r, p,nr, N, whos_] = pr_cg(A, b, x0, taux, itmax)
    
    x  = x0;
    r = b - A * x;
    r0 = r;
    L = ichol(sparse(A));
    M = L * L';
    z = M\r;
    p = z;
    N = 1;
    nr(N) = norm(r0)
  while (norm(r) > taux * norm(r0)) && (N <= itmax)
    
    N = N + 1;
    alpha = dot(z,r)/(p' * A * p);
    x = x + alpha * p;
    r = r - alpha * A * p;
    z = M\r;
    beta = (r' * z)/(alpha * p' * A * p);
    p = z +  beta * p;
    nr(N) = norm(r);
  endwhile
whos_ = whos;

end
