disp('Choose a list of methods to compare:');
disp('1 - CG');
disp('2 - BiCG');
disp('3 - BiCG_STAB');
disp('4 - CG_PREC');

rp = input('Enter your choices as a list (e.g., [1, 2, 4]): ');

if isvector(rp) && all(ismember(rp, [1, 2, 3, 4]))
    if any(ismember([1, 4], rp))
        if rg == 1
            figure('Name', 'Notification', 'Position', [100, 100, 800, 100]);
            uicontrol('Style', 'text', ...
                      'String', 'You chose CG or CG_PREC, so we will generate a positive definite matrix.', ...
                      'Position', [10, 40, 700, 40], ...
                      'FontSize', 10, ...
                      'HorizontalAlignment', 'center'); 
            A = gallery('lehmer', n);
        elseif rg == 2
            if check_matrix_properties(A) == 1
                A = A;  
            else
                disp("We cannot apply CG or CG_PREC to a non-symmetric positive definite matrix.");
                return;
            end
        end
    else
        if rg == 2
            figure('Name', 'Notification', 'Position', [100, 100, 800, 100]);
            uicontrol('Style', 'text', ...
                      'String', 'You chose BiCG or BiCG_STAB, so we will generate a general square matrix.', ...
                      'Position', [10, 40, 700, 40], ...
                      'FontSize', 10, ...
                      'HorizontalAlignment', 'center');

            A = rand(n, n);
        else
            A = A;
        end
    end

    figure;
    hold on;
    colors = {'k', 'r', 'g', 'b'}; % Couleurs pour les méthodes
    methods = {'CG', 'BiCG', 'BiCG_STAB', 'CG_PREC'}; % Noms des méthodes
    times = zeros(1, length(rp)); % Stocker les temps d'exécution
    memory_usage = zeros(1, length(rp)); % Stocker la mémoire utilisée
    norm_results = zeros(1, length(rp)); % Stocker les normes x - x*

    for i = 1:length(rp)
        tic; % Début du chronométrage
        if rp(i) == 1
            [x, r, p, nr, N, whos_] = cg(A, b, x0, taux, itmax);
            plot(1:N, nr, colors{rp(i)}, 'DisplayName', methods{rp(i)});
        elseif rp(i) == 2
            [x, r, p, nr, N, whos_] = bicg(A, b, x0, taux, itmax);
            plot(1:N, nr, colors{rp(i)}, 'DisplayName', methods{rp(i)});
        elseif rp(i) == 3
            [x, r, p, nr, N, whos_] = bcgstab(A, b, x0, taux, itmax);
            plot(1:N, nr, colors{rp(i)}, 'DisplayName', methods{rp(i)});
        elseif rp(i) == 4
            [x, r, p, nr, N, whos_] = pr_cg(A, b, x0, taux, itmax);
            plot(1:N, nr, colors{rp(i)}, 'DisplayName', methods{rp(i)});
        end
        times(i) = toc; % Fin du chronométrage

        % Calcul de la mémoire utilisée pour la méthode
        memory_usage(i) = sum([whos_.bytes]) / 1e6; % Convertir en Mo
        
        % Calcul de la norme entre x et x*
        x_star = A\b; % Solution exacte
        norm_results(i) = norm(x - x_star);
    end

    legend show;
    xlabel('Iteration');
    ylabel('Residual Norm');
    title('Comparison of Gradient Descent Methods');
    grid on;

    % Ajout d'un graphe pour les temps d'exécution
    figure;
    bar(1:length(rp), times);
    set(gca, 'XTickLabel', methods(rp));
    xlabel('Methods');
    ylabel('Execution Time (s)');
    title('Execution Time of Gradient Descent Methods');

    % Ajout d'un graphe pour la consommation mémoire
    figure;
    bar(1:length(rp), memory_usage);
    set(gca, 'XTickLabel', methods(rp));
    xlabel('Methods');
    ylabel('Memory Usage (MB)');
    title('Memory Usage of Gradient Descent Methods');
   
    % Création d'une nouvelle figure pour la norme
    figure('Name', 'Norm Comparison', 'Position', [200, 200, 200, 200]);
    uitable('Data', [methods(rp)' ], ...
            'ColumnName', {'Norm x-x*'}, ...
            'Position', [50, 50, 200, 100], ...
            'RowName', fix(norm_results(:) * 1000) / 1000);
else
    error('Invalid input! Please enter a list of numbers from [1, 2, 3, 4].');
end