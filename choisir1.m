disp('Bienvenue dans le programme de saisie de matrice creuse.');
disp('Choisissez une option pour entrer la matrice :');
disp('1 - Saisir la matrice manuellement');
disp('2 - Charger la matrice depuis un fichier .mtx');

rg_ = input('Entrez votre choix (1 ou 2) : ');
if rg_ == 1
A = input("Entrer une matrice carré : ");
[n,m] =size(A);
if (n ~= m || ~ismatrix(A))
return;
end
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
b = input("Enter b (default = zeros(n, 1)): ");
if isempty(b)
b = zeros(n, 1);
end
    
elseif rg_ == 2
fichier = input('Entrez le chemin complet vers le fichier .mtx : ', 's');
A = dlmread(fichier);
[n,m] =size(A);
if (n ~= m || ~ismatrix(A))
return;
end
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
b = input("Enter b (default = zeros(n, 1)): ");
if isempty(b)
b = zeros(n, 1);
end   

end


%A = sprandsym(n, 0.1);
%A = full(A);

%A = sprand(n, n, 0.1);
%A = full(A);