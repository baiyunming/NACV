load('mask.mat');

n = 360;
m = 640;
nc =3;

k1 = find(mask);
k2 = k1 + n*m; 
k3 = k1 + 2*n*m;

k_nonzero = [k1;k2;k3];

xxx = [1:numel(k_nonzero)]';

sparse_X = sparse(k_nonzero,xxx,ones(numel(k_nonzero),1),n*m*nc,numel(k_nonzero));

sparse_Y = speye(n*m*nc);
sparse_Y(k_nonzero,k_nonzero)=0;
