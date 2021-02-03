
%************************************************
%************************************************
%************File name: experiment3.m************
%************************************************
%************************************************

clc 
close all

% Read the Original Image and resize it to 256 x 256
% Let it be Image A
% Display the Original Image

mygrayimg = imread('dog.tif');
scaledimageA = imresize(mygrayimg,[256,256]);
subplot(2, 2, 1);
imshow(scaledimageA,[]); title('Original Image A');

% Read the Original Image and resize it to 256 x 256
% Let it be Image B
% Display the Original Image

subplot(2, 2, 2);
mygrayimg1 = imread('cb.jpg');
scaledimageB = imresize(mygrayimg1,[256,256]);
imshow(scaledimageB,[]); title('Original Image B');

% Take the complent of Image B and display it
% imcomplement() is used to take complement of the Image

d = imcomplement(scaledimageB); 
subplot(2, 2, 3);
imshow(d,[]); title('Image complement');

% Add the value 50 to all the pixels of the Image A and display it
% imadd() is used to add a scalar with the image 

modbrightimg = imadd(scaledimageA,50);  
subplot(2, 2, 4);
imshow(modbrightimg); title('Add Brightness of the Image');
