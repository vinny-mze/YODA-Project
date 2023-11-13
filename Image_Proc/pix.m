% Read the image
img = imread('imag.jpeg');

% Convert to grayscale
gray_img = rgb2gray(img);
figure,imshow(gray_img)
% Add salt and pepper noise
%noise_img = imnoise(gray_img, 'salt & pepper', 0.1);
figure,imshow(noise_img)

% Convert to 3x3 pixel format in hexadecimal
bin_img = dec2bin(imresize(noise_img, [5 5]), 2);
%bin_img = dec2bin(imresize(gray_img, [3 3]), 2);

% Save as a text file
dlmwrite('img.txt', bin_img, 'delimiter', '');
