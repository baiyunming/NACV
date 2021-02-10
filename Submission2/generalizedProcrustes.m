function [M, rotations, translations] = generalizedProcrustes(shapes, epsProcrustes)
% Implementation of the Procrustes average of the shapes contained in the
% cell array shapes. The result minimizes the cost function
%
%       sum_l || M - (Z_l * R_l + t_l) ||_F^2
%
% Input:
%   shapes:         Cell array containing matrices with the shapes, i.e. 
%                   shapes{i} returns a matrix of dimension n x d 
%                   representing n points in d-dimensional space. The 
%                   shapes all have the same number n of points. The shapes 
%                   are not necessarily mean-corrected and the number of
%                   the shapes is not fixed
%   epsProcrustes:  Scalar value for the breaking condition. As soon as the
%                   norm of the update of M is smaller than epsProcrustes
%                   the iteration is stopped.
%
% Output: 
%   M:              Average shape resulting from the optimization
%   rotations:      Cell array containing the optimal rotation matrices.
%                   I.e. rotations{i} returns the rotation matrix to
%                   transform the i-th shape optimally close to the average
%                   shape M
%   translations:   Cell array similar to rotations, but now containing the
%                   optimal translations for the shapes

num_shapes = length(shapes);

rotations = cell(1,num_shapes);
translations = cell(1,num_shapes);
transformed_shape =  cell(1,num_shapes);

%initialization
M = shapes{1} - mean(shapes{1});

while 1 
    %solve individual procrustersAlignment
    for i = 1:num_shapes
        [R, t] = procrustesAlignment(M, shapes{i});
        transformed_shape{i} = shapes{i} * R + t;
        rotations{i} = R;
        translations{i} = t;
    end

    M_old = M;
    
    %update new Model 
    M = zeros(size(shapes{1}));

    for i = 1:num_shapes
        M = M + transformed_shape{i};
    end
    
    M = M/num_shapes;
    
    if (norm(M-M_old)<epsProcrustes)
        break
    end
end

end
