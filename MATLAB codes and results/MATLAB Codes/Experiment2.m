
%************************************************
%************************************************
%************File name: experiment2.m************
%************************************************
%************************************************

clc
close all

% Read the colour image and resize it to 256 x 256
myimage = imread('zoo1.jpg');
mycolourimage = imresize(myimage,[256,256],'nearest');

%Display the Colour Image
subplot(2, 4, 1);
subimage(mycolourimage), title('Original colour image');
axis off; axis equal;

% Extract the Red band from the colour image
 
myredimage = mycolourimage(:, :, 1);
subplot(2, 4, 2);
subimage(myredimage); title('Red channel');
axis off; axis equal;

% Display the histogram of the Red channel

subplot(2, 4, 3);
imhist(myredimage); title('Red channel');
axis off; 

%Convert the colour image to Grey level image
 
mygrayimage = rgb2gray(mycolourimage);
subplot(2, 4, 4);
subimage(uint8(mygrayimage)), title('Grey image-8 bits');
axis off; axis equal;

% Resolution demo
% let us convert mygrayimage to 8-bit image for resolution demo
% Reduce the resolution to 8 X 8

myreducedimg = uint8(mygrayimage);
myreducedresolutionimg = imresize(imresize(myreducedimg,1/16),16);
subplot(2, 4,5);
subimage(myreducedresolutionimg), title('resolution now 16 x 16');
axis off; axis equal;

% Quantization demo
% let us convert mygrayimage to 8-bit image for resolution demo
% Reduce the resolution to 8 X 8

subplot(2,4,6);
subimage(grayslice(myreducedimg,2),gray(2));
title('Quantized image with 4 bits');
axis off; axis equal;

% generate a syntheic Image
% Matlab command phantom is used to generate a 64 x 64 image
subplot(2, 4, 7);
p = phantom('Modified Shepp-Logan',64);
subimage(p), title('Synthetic image'); 
axis off; axis equal;

%Display the grey level image using Pesudocolour using colormap(Jet(256)).
% This is the default colour map used to display the pesudocolour image

subplot(2, 4, 8);
subimage(mygrayimage,colormap(jet(256))), title('Pseudocolour image'); 
axis off; axis equal;
