shapes{1} = S1;
shapes{2} = S2;
shapes{3} = S3;
shapes{4} = S4;
shapes{5} = S5;

num_shapes = length(shapes);

rotations = cell(1,num_shapes);
translations = cell(1,num_shapes);

transformed_shape =  cell(1,num_shapes);

%initialization
M_new = shapes{1} - mean(shapes{1});

c = 0 ;
while 1 
    %solve individual procrustersAlignment
    for i = 1:num_shapes
        [R, t] = procrustesAlignment(M_new, shapes{i});
        transformed_shape{i} = shapes{i} * R + t;
        rotations{i} = R;
        translations{i} = t;
    end

    M_old = M_new;
    
    %update new Model 
    M_new = zeros(size(shapes{1}));

    for i = 1:num_shapes
        M_new = M_new + transformed_shape{i};
    end
    
    M_new = M_new/num_shapes;
    
    c = c + 1;
    
    if (norm(M_new-M_old)<1e-6)
        break
    end
end

scatter(S1(:,1),S1(:,2));


