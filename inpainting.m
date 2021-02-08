function image_inpainted = inpainting(image, mask)
% Function that implements the complete inpainting procedure. Input is the
% corrupted image as uint8 matrix as well as the logical mask. Output is
% the inpainted image, again as uint8 matrix of the same shape as the input
% image.
%
% Use your functions getDecomposition and createDifferenceMatrices to
% construct the linear system of equations.
img = double(image);
[n ,m, nc] = size(img);
D = createDifferenceMatrices(n, m, nc);
[X, Y] = getDecomposition(mask, nc);

A = D*X;
b = -D*Y*img(:);
result = A\b;

image_inpainted = X * result + Y * img(:);
image_inpainted = uint8(reshape(image_inpainted,n,m,nc));

end