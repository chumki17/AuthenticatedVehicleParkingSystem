
%************************************************
%************************************************
%************File name: experiment8.m************
%************************************************
%************************************************

clc;
close all;
clear all;

% Read the test image and display it
myimage = imread('grayleaf.jpg');
subplot(3,3,1);
imshow(myimage); title('Original Image');

% The command fspecial() is used to create mask
% The command imfilter() is used to apply the gaussian filter mask to the image
% Create a Gaussian low pass filter of size 3

gaussmask = fspecial('gaussian',3);
filtimg = imfilter(myimage,gaussmask); 
subplot(3,3,2);
imshow(filtimg,[]),title('Output of Gaussian filter 3 X 3');

% Generate a lowpass filter of size 7 X 7
% The command conv2 is used the apply the filter 
% This is another way of using the filter 

avgfilt = [ 1 1 1 1 1 1 1;
            1 1 1 1 1 1 1;
            1 1 1 1 1 1 1;
            1 1 1 1 1 1 1;
            1 1 1 1 1 1 1;
            1 1 1 1 1 1 1;
            1 1 1 1 1 1 1];

avgfiltmask = avgfilt/sum(avgfilt);
convimage= conv2(double(myimage),double(avgfiltmask));

subplot(3,3,3);
imshow(convimage,[]);
title('Average filter with conv2()'); 


% Add noise to an image
% Display the noisy Image

subplot(3,3,4);
myimage = imread('grayleaf.jpg');
noisyimg = imnoise(myimage,'Salt & Pepper', 0.5);
imshow(noisyimg,[]);
title('Noisy Image'); 

% generate Median filter of size 3 
% The command medianfilt2() is used to filter the image

mymed3img = medfilt2(noisyimg,[3 3]);
subplot(3,3,5);
imshow(mymed3img,[]), title('Output of 3 x 3 Median filter');

% generate Median filter of size 7 
% The command medianfilt2() is used to filter the image

mymed7img = medfilt2(noisyimg,[7 7]);
subplot(3,3,6);
imshow(mymed7img,[]), title('Output of 7 x 7 Median filter');


% Generate a high pass filter mask
% The command conv2 is used the apply the filter mask

h = [ 1 -2 -1; -1 5 -1; 1 -2 1];
hpt3 = conv2(double(myimage),double(h));  
subplot(3,3,7);
imshow(hpt3/100),title('Output of High pass filter');


% Generate a User defined mask for sharpening
% The command conv2 is used the apply the filter mask

h = [ -1 -1 -1; -1 9 -1; -1 -1 -1];
hpt3 = conv2(double(myimage),double(h));  
subplot(3,3,8);
imshow(hpt3/100),title('Sharpening - User defined mask');

% Generate a unsharp filter mask with alpha = 0.3
% The command conv2 is used the apply the filter mask

h = fspecial('unsharp',0.3); 
hpt3 = imfilter(myimage,h);  
subplot(3,3,9);
imshow(hpt3,[]),title('Output of Unsharp mask filter');
