A = [1 2 3; 2 1 4; 3 4 1];
eigenvector_new = eye(3);
A_new = A ;

while 1
    eigenvector_old = eigenvector_new;
    [eigenvector_new, ~] = qr(A*eigenvector_old);
    
    A_old = A_new ;
    [Q, R] = qr(A_old);
    A_new = R * Q ;
    eigenvalue_new = diag(diag(A_new));

    if (max(vecnorm(A * eigenvector_new - eigenvector_new*eigenvalue_new))<1e-6)
        break
    end
end

