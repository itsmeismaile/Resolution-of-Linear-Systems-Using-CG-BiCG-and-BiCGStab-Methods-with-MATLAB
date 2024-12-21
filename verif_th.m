clc;close all;clear all;
n = 10; 
A = rand(n, n);
A = A' * A; % Symétrique
A = A + n * eye(n); % Rendre définie positive
b = rand(n, 1); 
x0 = zeros(n, 1);
taux = 1e-6; 
itmax = n;
[x, r, p, nr, N] = th_cg(A, b, x0, taux, itmax);

prop_3 = [];
prop_4 = [];
for i = 1:N
  for j = i+1 : N
   prop_3(i) = r(:,i)' * r(:,j);
   prop_4(i) = p(:,i)'* A * p(:,j);
  end
end

prop_5 = [];
for i = 2:N
  e_k = (x(:,i) - A\b);
  e_k_moins_1 = (x(:,i-1) - A\b);
  prop_5(:,i) =  sqrt(e_k' * A * e_k) - sqrt(e_k_moins_1' * A * e_k_moins_1);
end

prop_6 = [];
for i = 1:N
  e_k  = (x(:,i) - A\b);
  e_0  = (x0 - A\b);
  expr = (((sqrt(norm(A)*norm(inv(A)))-1)/(sqrt(norm(A)*norm(inv(A)))+1)))^i;
  prop_6(:,i) = sqrt(e_k' * A * e_k) - 2 * expr * sqrt(e_0' * A * e_0);
end


prop_7 = [];
for i = 1:N
  e_k  = (x(:,i) - A\b);
  e_0  = (x0 - A\b);
  r_0 = b - A * x0;
  rapport_r = (norm(r(:,i))/norm(r_0));
  rapport_e =  sqrt(e_k' * A * e_k) / sqrt(e_0' * A * e_0);
  prop_7(:,i) = rapport_r - sqrt(norm(A) * norm(inv(A))) * rapport_e;
end



n = 10; 
A = rand(n, n);
A = A' * A; % Symétrique
A = A + n * eye(n); % Rendre définie positive
b = rand(n, 1); 
x0 = zeros(n, 1);
taux = 1e-6; 
itmax = n;

[x, r, p,nr, N] = th_bicg(A, b, x0, taux, itmax);

prop_8_1 = [];
prop_8_2 = [];

for i = 1:N
  for j = i+1 : N
   prop_8_1(i) = r(:,i)' * r(:,j);
   prop_8_2(i) = p(:,i)'* A * p(:,j);
  end
end