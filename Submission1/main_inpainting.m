%% Read image and mask
image = imread('corrupted.png');
load('mask.mat')

%% Call the inpainting Function
image_inpainted = inpainting(image, mask);


%% Show original and reconstructed image
figure
imshow(image)

figure
imshow(image_inpainted)
