function [x, r, p, nr, N] = th_cg(A, b, x0, taux, itmax)
    
    x(:,1) = x0;
    r0 = b - A * x0;
    r(:,1) = r0;
    p(:,1) = r(:,1);
    N = 1; 
    nr = [];

    while (norm(r(:,N)) > taux * norm(r0)) && (N <= itmax)
        nr(N) = norm(r(:,N)); 
        alpha = dot(r(:,N), r(:,N)) / (p(:,N)' * A * p(:,N));
        x(:,N+1) = x(:,N) + alpha * p(:,N);
        r(:,N+1) = r(:,N) - alpha * (A * p(:,N));
        beta = dot(r(:,N+1), r(:,N+1)) / dot(r(:,N), r(:,N));
        p(:,N+1) = r(:,N+1) + beta * p(:,N);
        N = N + 1;
    end
end
