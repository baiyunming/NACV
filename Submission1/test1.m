img = double(imread('corrupted.png'));
[n, m, nc] = size(img);

Bin_Dx = repmat( [1, -1],n*m*nc,1);


sparse_Dx = spdiags(Bin_Dx,[0,n],n*m*nc,n*m*nc);
sparse_Dx(n*m*nc-n+1:n*m*nc,:) = [];
sparse_Dx((n*(2*m-1)+1):2*n*m,:) = [];
sparse_Dx((n*(m-1)+1):n*m,:) = [];

Bin_Dy = repmat([1,-1],n*m*nc,1);
sparse_Dy = spdiags(Bin_Dy,[0,1],n*m*nc,n*m*nc);
sparse_Dy(n:n:m*n*nc,:) = [];




