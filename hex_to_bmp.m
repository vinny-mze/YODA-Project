% Read binary data from output file
fileID = fopen('denoised.bin','r');
data = fread(fileID, [1, Inf], 'uint8');
fclose(fileID);

% Convert binary data to image matrix
width = 128; % set the image width to 128
height = 128; % set the image height to 128
img = reshape(data, [width, height])';

% Scale image values to range [0, 255]
img = (img - min(img(:))) * 255 / (max(img(:)) - min(img(:)));

% Convert image to uint8 data type
img = uint8(img);

% Save image to BMP file
imwrite(img, 'denoised.bmp');

