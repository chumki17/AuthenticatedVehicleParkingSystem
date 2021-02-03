
%************************************************
%************************************************
%************File name: experiment6.m************
%************************************************
%************************************************

clc 
close all

mycolourimage = imread('pot.jpg');
mygrayimage = rgb2gray(mycolourimage);
mygrayimage = imsubtract(mygrayimage,60);
subplot(2,3,1);
imshow(mygrayimage);
title('Original Image');

% Find histogram of the Image
%imhist works with only 8 bit images
% Hence convert the image to unsigned 8 bit image and plot the histogram

myimage = uint8(mygrayimage);
subplot(2,3,2);
imhist(myimage);
axis off, axis tight;
title('Histogram of the Image');

% Adjust the intensity of the Image 
subplot(2,3,3);
myadjustedimage = imadjust(myimage,stretchlim(myimage),[]);
imshow(myadjustedimage);
title('Contrast adjusted Image');

% Adjust the Gamma to 0.8 
subplot(2,3,4);
myadjustedgammaimage = imadjust(myimage,[],[],0.8);  
imshow(myadjustedgammaimage);
title('Gamma Adjusted Image to 0.8');

% Histogram equalise  
subplot(2,3,5);
[equalisedimage, T] = histeq(myimage);
imhist(equalisedimage);
axis off, axis tight;
title('Histogram of the Equalized Image');

% Histogram equalise  
subplot(2,3,6);
imshow(equalisedimage);
title('Histogram-Equalized final Image');


