function [X, Y] = getDecomposition(mask, nc)
% Input to this function is 'mask', a n x m logical matrix that stores
% 'false' for uncorrupted pixels and 'true' for corrupted pixels. The
% scalar value nc defines how many color channels the image has
%
% The return values X and Y are sparse matrices such that we can decompose
% the image into
%
%   u = X*u_tilde + Y*f
%
% Where u_tilde are only the corrupted pixels and f is the complete image
% (i.e. Y extracts the uncorrupted pixels from f). f and u are column
% vectors obtained by stacking columns on each other and then stacking
% color channels on each other.
[n ,m] = size(mask);

k1 = find(mask);
k2 = k1 + n*m; 
k3 = k1 + 2*n*m;

k_nonzero = [k1;k2;k3];

xxx = [1:numel(k_nonzero)]';

X = sparse(k_nonzero,xxx,ones(numel(k_nonzero),1),n*m*nc,numel(k_nonzero));

Y = speye(n*m*nc);
Y(k_nonzero,k_nonzero)=0;

end
