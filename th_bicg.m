function [x, r, p, nr, N] = th_bicg(A, b, x0, taux, itmax)
    x(:,1) = x0;
    r(:,1) = b - A * x(:,1); 
    rt(:,1) = r(:,1);        
    p(:,1) = r(:,1);        
    pt(:,1) = rt(:,1);       
    r0 = r(:,1);             
    N = 1;                  
    nr = norm(r(:,1));
    
    while (norm(r(:,N)) > taux * norm(r0)) && (N <= itmax)
        alpha = dot(r(:,N), rt(:,N)) / dot(pt(:,N), A * p(:,N));
        x(:,N+1) = x(:,N) + alpha * p(:,N);
        r(:,N+1) = r(:,N) - alpha * (A * p(:,N));
        rt(:,N+1) = rt(:,N) - alpha * (A' * pt(:,N));
        beta = dot(rt(:,N+1), r(:,N+1)) / dot(rt(:,N), r(:,N));
        p(:,N+1) = r(:,N+1) + beta * p(:,N);
        pt(:,N+1) = rt(:,N+1) + beta * pt(:,N);
        nr(N+1) = norm(r(:,N+1));
        N = N + 1;
    end
end
