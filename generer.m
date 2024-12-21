n = input("Enter the dimension of the matrix: ");
        itmax = input("Enter the maximum number of iterations (default = 50): ");
        if isempty(itmax)
            itmax = 50;
        end
        taux = input("Enter the tolerance value (default = 1e-14): ");
        if isempty(taux)
            taux = 1e-14;
        end
        x0 = input("Enter the initial guess for x0 (default = zeros(n, 1)): ");
        if isempty(x0)
            x0 = zeros(n, 1);
        end
        b = rand(n, 1);
        if isempty(b)
            b = zeros(n, 1);
        end