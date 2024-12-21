function result = check_matrix_properties(A)
    % Retourne 1 si la matrice est symétrique et définie positive, sinon 0
    
    % Vérifier si la matrice est carrée
    [m, n] = size(A);
    if m != n
        result = 0;
        return;
    end
    
    % Vérifier si la matrice est symétrique
    if isequal(A, A')
        % Vérifier si la matrice est définie positive
        eigvals = eig(A);
        if all(eigvals > 0)
            result = 1;
        else
            result = 0;
        end
    else
        result = 0;
    end
end
