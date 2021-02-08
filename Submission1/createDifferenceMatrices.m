function D = createDifferenceMatrices(n, m, nc)
% Function to create the difference matrix D that contains the stacked
% difference matrices in x and y direction, i.e. D = [D_x ; D_y]
%
% The input dimension of D is n*m*c since we multiply it by the stacked 
% image. The output dimensio of D_x is nc*(n*m - n) since for each channel
% we compute the differences in x direction for all pixels except for the
% last column (virtual extension by the same value => Difference is 0)
% Similarly, the output dimension of D_y is nc*(n*m - m) since now we do
% not have differences for the last row.
Bin_Dx = repmat( [1, -1],n*m*nc,1);
sparse_Dx = spdiags(Bin_Dx,[0,n],n*m*nc,n*m*nc);
sparse_Dx(n*m*nc-n+1:n*m*nc,:) = [];
sparse_Dx((n*(2*m-1)+1):2*n*m,:) = [];
sparse_Dx((n*(m-1)+1):n*m,:) = [];

Bin_Dy = repmat([1,-1],n*m*nc,1);
sparse_Dy = spdiags(Bin_Dy,[0,1],n*m*nc,n*m*nc);
sparse_Dy(n:n:m*n*nc,:) = [];

D = [sparse_Dx;sparse_Dy];

end
