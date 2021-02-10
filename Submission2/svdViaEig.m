function [U, S, V] = svdViaEig(A)
% Implementation of the SVD based on the eigenvalue decomposition
%
% Input:
%   A: Rectangular matrix with dimension m x n and m >= n
%
% Output:
%   U, S, V such that U*S*V' = A is the partial SVD of A

rank_A = rank(A);
[U_full, eigenvalue1] = eigViaQR(A*A', 1e-6);
[~, ind1] = sort(diag(eigenvalue1),'descend');
U_full = U_full(:, ind1);

[V_full, eigenvalue2] = eigViaQR(A'*A, 1e-6);
[~, ind2] = sort(diag(eigenvalue2),'descend');
V_full = V_full(:, ind2);

sigma_full = U_full'*A*V_full;

U = U_full(:,1:rank_A);
sigular_value = diag(sigma_full);
S = diag(sigular_value(1:rank_A)); 
V = V_full(:,1:rank_A);

end
