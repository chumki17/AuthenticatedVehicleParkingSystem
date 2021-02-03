

%************************************************
%************************************************
%************File name: experiment15.m***********
%************************************************
%************************************************


clc;
clear all;
close all;

% Read the Original Image
% Convert it to Grey Image, rescale it to 10 x 10 to reduce
% running time of this program and display it

mycolourimg = imread('colorleaf.jpg');
mygrayimg = rgb2gray(mycolourimg);

subplot(1,2,1);
imshow(mygrayimg);
title('My original Image');

croppedimg = imresize(mygrayimg,[10 10]); 
subplot(1,2,2);
imshow(croppedimg);
title('Cropped Image of size 10 x 10');


% Label the image for extraction of features

labelimage = croppedimg;
labelimage = bwlabel(labelimage);

% Obtain features of the image using regionprops() command
% The parameter all indicates that all the supported features
% to be displayed on screen

featuresimg = regionprops(labelimage,'Area','MajorAxisLength','MinorAxisLength');

% The individual features can be extracted like this 

fprintf('Thre area is %6.2f \n',featuresimg.Area);
fprintf('The MajorAxisLength is %6.2f  \n',featuresimg.MajorAxisLength);
fprintf('The MinorAxisLength is %6.2f  \n',featuresimg.MinorAxisLength);

% Calculate eccenticity

myecc = featuresimg.MajorAxisLength/featuresimg.MinorAxisLength;
fprintf('The eccentricity is %6.2f \n',myecc);


% Calculate pixel statistics
% Convert the matrix to a single vector

newcropimg = croppedimg(:);
pixstat=datastats(double(newcropimg));
disp(pixstat)




