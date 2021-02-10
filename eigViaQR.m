function [V, D] = eigViaQR(A, thres)
% Implementation of an Eigenvalue/Eigenvector solver for symmetric matrices
% A based on the QR Method
%
% Input:
%   A:     Symmetric matrix of which the eigenvalues/eigenvectors are to be
%          computed
%   thres: Scalar value for the convergence control. The algorithm is
%          stopped as soon as ||Av_i - lambda_i*v_i|| < thres holds for all
%          eigenvalue/eigenvector pairs
%
% Output
%   V:     Matrix storing the eigenvectors of A in the columns
%   D:     Diagonal matrix containing the eigenvalues of A on the diagonal
%          The eigenvalue D_ii corresponds to the eigenvector in the i-th 
%          column of V

[m,~] = size(A);
eigenvector_new = eye(m);
A_new = A ;

while 1
    eigenvector_old = eigenvector_new;
    [eigenvector_new, ~] = qr(A*eigenvector_old);
    
    A_old = A_new ;
    [Q, R] = qr(A_old);
    A_new = R * Q ;
    eigenvalue_new = diag(diag(A_new));

    if (max(vecnorm(A * eigenvector_new - eigenvector_new*eigenvalue_new))<thres)
        break
    end
end


V = eigenvector_new;
D = eigenvalue_new;
end