%************************************************
%************************************************
%************File name: experiment1.m******************
%************************************************
%************************************************

clc 
clear all
close all

%read the colour image
myimage = imread('pot.jpg');

%resize the colour image to 256 x 256 image
mycolorimage=imresize(myimage,[256,256],'nearest');

%convert the colour image to a greylevel image
mygrayimage = rgb2gray(mycolorimage);
%convert the colour image to a greylevel image
mybinimage = im2bw(mycolorimage);

%Display the Original Image in a grid of 2 x 2 images
subplot(2, 2, 1);
imshow(mycolorimage); title('Original Colour Image');
 

%Display the Grey level Image in a grid of 2 x 2 images
subplot(2, 2, 2);
imshow(mygrayimage); title('Grey Image');

 
%Display the Original Image in a grid of 2 x 2 images
subplot(2, 2, 3);
imshow(mybinimage); title('Binary Image');


%Display the Line Profile of a line drawn with coordinates 
%(10,45) and (50,100)

%Original Image in a grid of 2 x 2 images

subplot(2, 2, 4);
improfile(mygrayimage,[10,50],[45,100]);

%Display x axis, y-axis and Title of the Line profile graph

ylabel('Pixel Value');
xlabel('Distance');
title('Intensity profile of the given line');
