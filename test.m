% Génération d'une matrice creuse de taille n x n
n = 5000;  % Taille de la matrice
A_full = rand(n, n);  % Matrice pleine aléatoire
A_sparse = sparse(A_full);  % Conversion en matrice creuse

% Vecteur b
b = rand(n, 1);

% Solution x
x_exact = A_full \ b;  % Solution exacte pour la matrice pleine (utilisée pour comparaison)

% Résolution avec la méthode Conjugate Gradient sur la version pleine

tic;
x_sparse = pcg(A_sparse, b, 1e-6, 1000);  % pcg pour Conjugate Gradient avec matrice creuse
time_sparse = toc  % Temps pour la version creuse

tic;
x_sparse = pcg(A_full, b, 1e-6, 1000);  % pcg pour Conjugate Gradient avec matrice creuse
time_full = toc  % Temps pour la version creuse
