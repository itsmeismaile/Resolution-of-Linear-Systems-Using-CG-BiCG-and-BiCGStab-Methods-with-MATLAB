disp('Do you want to verify properties for CG OR BiCG?');
disp('1 - CG');
disp('2 - BiCG');
rt = input('Enter the option: ');

if rt == 1
    disp('Do you want to generate a symmetric positive defined Matrix for you?');
    disp('1 - Yes, generate it');
    disp('2 - I will generate it by myself');
    c_ = input('Enter the option: ');
    if c_ == 1
        % Génération d'une matrice symétrique définie positive
        n = input('Enter the size of the matrix: ');
        A = rand(n, n);
        A = A' * A; % Symétrique
        A = A + n * eye(n); % Définit positive
        b = rand(n, 1); % Vecteur de droite
        x0 = zeros(n, 1); % Solution initiale
        taux = 1e-6; % Tolérance
        itmax = 100; % Nombre maximum d'itérations
    elseif c_ == 2
        % Entrée manuelle
        A = input('Enter your matrix A: ');
        b = input('Enter your vector b: ');
        x0 = input('Enter your initial guess x0: ');
        taux = input('Enter your tolerance: ');
        itmax = input('Enter maximum iterations: ');
    end

    disp('What property do you want to verify?');
    disp('- 3: Residual orthogonality (Property 3)');
    disp('- 4: A-conjugacy of directions (Property 4)');
    disp('- 5: Error norms decrease (Property 5)');
    disp('- 6: Error norm bounds (Property 6)');
    disp('- 7: Residual-error relationship (Property 7)');
    c_p = input('Enter an option and the result will appear in the console: ');

    % Résolution par Conjugate Gradient
    [x, r, p, nr, N] = th_cg(A, b, x0, taux, itmax);

    if c_p == 3
        % Propriété 3 : Orthogonalité des résidus
        prop_3 = zeros(N, N); % Pré-allocation
        for i = 1:N
            for j = i+1:N
                prop_3(i, j) = r(:, i)' * r(:, j);
            end
        end
        disp('Property 3:');
        disp(prop_3);
    end

    if c_p == 4
        % Propriété 4 : A-conjugaison des directions
        prop_4 = zeros(N, N); % Pré-allocation
        for i = 1:N
            for j = i+1:N
                prop_4(i, j) = p(:, i)' * A * p(:, j);
            end
        end
        disp('Property 4:');
        disp(prop_4);
    end

    if c_p == 5
        % Propriété 5 : Normes d'erreur décroissantes
        prop_5 = zeros(1, N); % Pré-allocation
        for i = 2:N
            e_k = (x(:, i) - A\b);
            e_k_moins_1 = (x(:, i-1) - A\b);
            prop_5(i) = sqrt(e_k' * A * e_k) - sqrt(e_k_moins_1' * A * e_k_moins_1);
        end
        disp('Property 5:');
        disp(prop_5);
    end

    if c_p == 6
        % Propriété 6 : Bornes sur les normes d'erreur
        prop_6 = zeros(1, N); % Pré-allocation
        e_0 = (x0 - A\b);
        for i = 1:N
            e_k = (x(:, i) - A\b);
            expr = (((sqrt(norm(A) * norm(inv(A))) - 1) / (sqrt(norm(A) * norm(inv(A))) + 1)))^i;
            prop_6(i) = sqrt(e_k' * A * e_k) - 2 * expr * sqrt(e_0' * A * e_0);
        end
        disp('Property 6:');
        disp(prop_6);
    end

    if c_p == 7
        % Propriété 7 : Relation entre résidu et erreur
        prop_7 = zeros(1, N); % Pré-allocation
        e_0 = (x0 - A\b);
        r_0 = b - A * x0;
        for i = 1:N
            e_k = (x(:, i) - A\b);
            rapport_r = (norm(r(:, i)) / norm(r_0));
            rapport_e = sqrt(e_k' * A * e_k) / sqrt(e_0' * A * e_0);
            prop_7(i) = rapport_r - sqrt(norm(A) * norm(inv(A))) * rapport_e;
        end
        disp('Property 7:');
        disp(prop_7);
    end

elseif rt == 2
    disp('Do you want to generate a square Matrix for you?');
    disp('1 - Yes, generate it');
    disp('2 - I will generate it by myself');
    c_ = input('Enter an option: ');
    if c_ == 1
        % Génération d'une matrice aléatoire
        n = input('Enter the size of the matrix: ');
        A = rand(n, n);
        b = rand(n, 1);
        x0 = zeros(n, 1);
        taux = 1e-6;
        itmax = 100;
    elseif c_ == 2
        % Entrée manuelle
        A = input('Enter your matrix A: ');
        b = input('Enter your vector b: ');
        x0 = input('Enter your initial guess x0: ');
        taux = input('Enter your tolerance: ');
        itmax = input('Enter maximum iterations: ');
    end

    disp('What property do you want to verify?');
    disp('- 1: Residual orthogonality (Property 8.1)');
    disp('- 2: A-conjugacy of directions (Property 8.2)');
    c_p = input('Enter an option and the result will appear in the console: ');

    % Résolution par Bi-Conjugate Gradient
    [x, r, p, nr, N] = th_bicg(A, b, x0, taux, itmax);

    if c_p == 1
        % Propriété 8.1 : Orthogonalité des résidus
        prop_8_1 = zeros(N, N);
        for i = 1:N
            for j = i+1:N
                prop_8_1(i, j) = r(:, i)' * r(:, j);
            end
        end
        disp('Property 8.1:');
        disp(prop_8_1);
    end

    if c_p == 2
        % Propriété 8.2 : A-conjugaison des directions
        prop_8_2 = zeros(N, N);
        for i = 1:N
            for j = i+1:N
                prop_8_2(i, j) = p(:, i)' * A * p(:, j);
            end
        end
        disp('Property 8.2:');
        disp(prop_8_2);
    end
end
