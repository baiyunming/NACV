function [R, t] = procrustesAlignment(Y, Z)
% Implementation of the Procrustes alignment of the point clouds Y and Z.
% The transformation parameters R and t minimize the cost function
%
%       || Y - (ZR + t) ||_F^2
%
% Input
%   Y, Z:   Matrices of dimension n x d representing n points in
%           d-dimensional space
%
%   R:      Orthogonal matrix representing a rotation + reflection 
%   t:      Translation vector   

Y_subtract_mean = Y - mean(Y);
Z_subtract_mean = Z - mean(Z);

[U, ~ ,V] = svd(Z_subtract_mean' * Y_subtract_mean);
R = U * V';
t = mean(Y) - mean(Z)* R;

end