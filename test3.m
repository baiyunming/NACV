D = [sparse_Dx;sparse_Dy];
A = D*sparse_X;

b = -D*sparse_Y*img(:);
result = A\b;

recon_img = sparse_X * result + sparse_Y * img(:);
recon_img = uint8(reshape(recon_img,n,m,nc));
imshow(recon_img);