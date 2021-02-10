A = [ 1 2; 3 4; 5 6];
rank_A = rank(A);
[U, SIGMA1] = eigViaQR(A*A', 1e-6);
[V, SIGMA2] = eigViaQR(A'*A, 1e-6);
sigma = U'*A*V;

U_partial = U(:,1:rank_A);
sigular_value = diag(sigma);
sigma_partial = diag(sigular_value(1:rank_A)); 
V_partial = V(:,1:rank_A);
