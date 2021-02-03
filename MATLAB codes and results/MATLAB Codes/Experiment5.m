%************************************************
%************************************************
%************File name: experiment5.m************
%************************************************
%************************************************

clc 
close all

% Read a colour Image and Resize it to 256 x 256
% Convert the image to grey image and display it

f = imread('pot.jpg');
g1=imresize(f,[256,256],'nearest');
g = rgb2gray(g1);
subplot(2, 2, 1);
imshow(g); title('Original Grey Image');


% Create a translation matrix for x direction - 50 units and y direction
% in 100 units. Use the command maketform to create the affine matrix 
% for translation and imtransform to translate the image 

t = [ 1 0 0; 0 1 0; 50 100 1];
tform = maketform('affine',t);
translateimg = imtransform(g,tform); 
subplot(2, 2, 2);
imshow(translateimg),title('Translated Image');


% Create a rotation matrix for pi/6 
% Use the command imtransform to rotate the image using the created
% rotation matrix  

subplot(2, 2, 3);
t = pi/6;
r = [cos(t) sin(t) 0; -sin(t) cos(t) 0; 0 0 1];
tform = maketform('affine',r);
rotimg = imtransform(g,tform);
imshow(rotimg),title('Rotated image');


% Use the imrotate command to rotate the image in clockwise direction 
% 45 degrees - Use negative values for angle if the rotation required is
% clockwise direction as the default rotation is in counter clockwise 
% direction. Additional parameter 'crop' is given to ensure that the
% output image is same as the input image

subplot(2, 2, 4);
h = imrotate(g,-45,'crop');
imshow(h);title('Rotated by 45 degree in clockwise direction');
