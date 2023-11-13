% Read BMP file
A = imread('image.bmp');

% Convert to grayscale
A = rgb2gray(A);

% Resize to fit filter dimensions
A = imresize(A, [3 3]);

% Convert to 9-bit integer values
A = uint16(A);
A = bitshift(A, -7);

% Write output file
fid = fopen('img.bin', 'wb');
fwrite(fid, A, 'uint16');
fclose(fid);

% Read binary file
fid = fopen('denoised.bin','rb');
data = fread(fid,'uint8');
fclose(fid);

% Extract image dimensions
width = 640;
height = 480;

% Reshape data into image matrix
img = reshape(data, [width, height])';

% Convert grayscale image to RGB
rgb_img = cat(3, img, img, img);

% Write image to file
imwrite(rgb_img, 'denoised.bmp');

