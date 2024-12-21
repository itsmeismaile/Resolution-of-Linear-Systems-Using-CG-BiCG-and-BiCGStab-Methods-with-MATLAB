function [x, r, p,nr, N, whos_] = bicg(A, b, x0, taux, itmax)

    x = x0;
    r = b - A * x; 
    rt = r;        
    p = r;        
    pt = rt;       
    r0 = r;             
    N = 1;
    nr(N) = norm(r0)    
    
    while (norm(r) > taux * norm(r0)) && (N <= itmax)
        N = N + 1;
        Ap = A * p;
        alpha = dot(r, rt) / dot(pt, Ap);
        x = x + alpha * p;
        r = r - alpha * (Ap);
        rt = rt - alpha * (A' * pt);
        beta = dot(rt, r) / (alpha * dot(pt, Ap));
        p = r + beta * p;
        pt = rt + beta * pt;
        nr(N) = norm(r);
       
    end
whos_ = whos;

end
