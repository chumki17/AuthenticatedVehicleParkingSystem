%************************************************
%************************************************
%************File name: experiment13.m***********
%************************************************
%************************************************


clc;
close all;
clear all;


% Read the test Image
% Convert the image to binary image

myorigimg = imread('test.jpg');
myorigimg = im2bw(rgb2gray(myorigimg));
subplot(3, 3, 1);
imshow(myorigimg);title('Originalimage');


% Create Structuring Element
se = strel('disk', 9);

% Perform dilation operation using imdilate command
% Display the dilated image

mydilatedimg = imdilate(myorigimg, se);
subplot(3, 3, 2);
imshow(mydilatedimg);title('Dilated image');

% Perform Erosion operation using imerode command
% Display the Eroded image

myerodedimg = imerode(myorigimg, se);
subplot(3, 3, 3);
imshow(myerodedimg);title('Eroded image');


% Find Internal Boundary 
% Internal Boundary = Dilated Image AND Not of Eroded Image  
% Display Internal Boundary 

internalboundimg = mydilatedimg & ~ myerodedimg;
subplot(3, 3, 4);
imshow(internalboundimg,[]);title('Internal Boundary');


% Find External Boundary 
% External Boundary = Dilated Image AND Not of Eroded Image  
% Display External Boundary  

externalboundimg = mydilatedimg & ~myorigimg;
subplot(3, 3, 5);
imshow(externalboundimg,[]);title('External Boundary');

% Find Morphological Gradient  
% Morphological Gradient = Dilated Image AND Not of Eroded Image  
% Display External Boundary  

mymorphgradimg = imsubtract(myorigimg,myerodedimg);
subplot(3, 3, 6);
imshow(mymorphgradimg,[]);title('Morphological Gradient');

% Perform Thinning operation using bwmorph() command
% Display the dilated image

thinf = bwmorph(myorigimg,'thin');
subplot(3,3,7);
imshow(thinf);title('Thinning of the Image');

% Perform Thickening operation using bwmorph()command
% Display the dilated image

thickf = bwmorph(myorigimg,'thicken');
subplot(3,3,8);
imshow(thickf);title('Thickening of the Image');


% Perform Skeletonozation operation using bwmorph()command
% with 8 iterations and display the dilated image

skelf100 = bwmorph(myorigimg,'skel',9); 
subplot(3,3,9);
imshow(skelf100);title('Skeletonization - 9 iterations');