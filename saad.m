function A = saad (m, p, delta)
    n = m * p;
    B = -4 * diag(ones(1, p)) + (-1 + delta) * diag(ones(1, p - 1), -1) + (-1 - delta) * diag(ones(1, p - 1), 1);
    I = -1 * eye(p);
    A = zeros(n, n); 
    for i = 1:m
        A((i - 1) * p + 1:i * p, (i - 1) * p + 1:i * p) = B;
        if i != m
            A((i - 1) * p + 1:i * p, i * p + 1:(i + 1) * p) = I;
            A(i * p + 1:(i + 1) * p, (i - 1) * p + 1:i * p) = I;
        end
    end
endfunction
