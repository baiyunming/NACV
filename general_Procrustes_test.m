load('HandwrittenS')

shapes{1} = S1;
shapes{2} = S2;
shapes{3} = S3;
shapes{4} = S4;
shapes{5} = S5;

[M, ~, ~, transformed_shape] = generalizedProcrustes(shapes, 1e-6);

scatter(transformed_shape{1}(:,1),transformed_shape{1}(:,2));
hold on ;
scatter(transformed_shape{2}(:,1),transformed_shape{2}(:,2));
hold on;
scatter(transformed_shape{3}(:,1),transformed_shape{3}(:,2));
hold on;
scatter(transformed_shape{4}(:,1),transformed_shape{4}(:,2));
hold on;
scatter(transformed_shape{5}(:,1),transformed_shape{5}(:,2));
hold on;
scatter(M(:,1),M(:,2),'k','filled');