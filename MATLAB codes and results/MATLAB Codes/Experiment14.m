
%************************************************
%************************************************
%************File name: experiment14.m***********
%************************************************
%************************************************

clc
close all
clear all

% Read the Original Image and display it

mycolourimg = imread('sticks1.jpg');
mycolourimg = imresize(mycolourimg,[800,800]);
subplot(3, 2, 1);
imshow(mycolourimg); 
title('Original Colour Image');

% Extract Red. green and Blue component 

myredimg = mycolourimg(:,:,1);
mygreenimg = mycolourimg(:,:,2);
myblueimg = mycolourimg(:,:,3);

% Display colour bands
% Display Red band
subplot(3,2,2);
imshow(myredimg);
title('Red Band');

% Display Green band
subplot(3,2,3);
imshow(mygreenimg);
title('Green Band');

% Display Blue band
subplot(3,2,4);
imshow(myredimg);
title('Blue Band');

% Convert RGB to HSV
myhsvimg = rgb2hsv(mycolourimg);
subplot(3,2,5);
imshow(myhsvimg);
title('HSV Image');

% Extract the band of HSV image
% Apply Logarithmic transform 

subplot(3,2,6);

V = myhsvimg(:,:,3); 
OutV = 2 * log(1+V);
myhsvimg(:,:,3) = OutV;
modimg = hsv2rgb(myhsvimg);
imshow(modimg);
title('Linear transformed image');



