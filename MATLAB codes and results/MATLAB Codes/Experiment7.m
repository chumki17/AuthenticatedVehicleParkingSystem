
%************************************************
%************************************************
%************File name: experiment7.m************
%************************************************
%************************************************

clc
close all

% Read the test Image
mygrayimg = imread('grayleaf.jpg');
mygrayimg = imresize(mygrayimg,[256 256],'bilinear');
subplot(2,3,1); 
imshow(mygrayimg); 
title('Original Image');

% Add Salt and pepper noise with noise density 0.02
salt = imnoise(mygrayimg,'salt & pepper',0.02);
subplot(2,3,2);
imshow(salt);
title('Salt & Pepper Image');

% Add Gaussian noise with mean 0 and variance 0.01 
gau = imnoise(mygrayimg, 'gaussian', 0, 0.01);
subplot(2,3,3);
imshow(gau);
title('Gaussian Image- mean 0 and variance 0.01');

% Generate Gaussian noise with mean 6 and variance 225  
mynoise = 6 + sqrt(225) * randn(256,256);
subplot(2,3,4);
imshow(mynoise,[]);
title('Generated gaussian noise');

% Original Image and generated Gaussian   

subplot(2,3,5);
mynoiseimg = double(mygrayimg) + mynoise;
imshow(mynoiseimg,[]);
title('Gaussian image(mean 6 & Var 225');

% Original Image plus sinusoidal noise    

subplot(2,3,6);
[x y] = meshgrid(1:256,1:256);
mysinusoidalnoise = 15 * sin(2*pi/14*x+2*pi/14*y);
mynoiseimg1 = double(mygrayimg) + mysinusoidalnoise;
imshow(mynoiseimg1,[]);
title('Generated Sinusoidal noise');
