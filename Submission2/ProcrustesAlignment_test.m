Y_subtract_mean = Y - mean(Y);
Z_subtract_mean = Z - mean(Z);

[U, S ,V] = svd(Z_subtract_mean' * Y_subtract_mean);
rotation = U * V';
translation = mean(Y) - mean(Z)* rotation;

transformed_Z = Z * rotation + translation;
