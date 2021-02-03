
%************************************************
%************************************************
%************File name: experiment4.m************
%************************************************
%************************************************

clc 
close all

% Read Image A that is an image of an ellipse
% Convert Image A to a binary image
myimageA=imread('ellipse.jpg');
mybinaryimageA = im2bw(myimageA);


% Read Test image B 
% Convert Image B to a binary image

myimageB=imread('test1.jpg');
myimageadjustB =imresize(myimageB,[256,256]);
mybinaryimageB = im2bw(myimageadjustB);


% Display the Original Image A

subplot(4,2,1)
imshow(mybinaryimageA),title('Binary Image - Image A ');

% Display the Original Image B

subplot(4,2,2)
imshow(mybinaryimageB),title('Binary Image - Image B');

% Take a complement of Image A and Display it

subplot(4,2,3)
resultor= ~mybinaryimageA ;
imshow(mat2gray(resultor)), title('Complement of Image A');

% Take a Ex-OR of Image A and Image B and Display it

subplot(4,2,4)
resultxor= xor(mybinaryimageA,mybinaryimageB);
imshow(mat2gray(resultxor)), title('Image A XOR Image B');

% Take OR of Image A and Image B and Display it
subplot(4,2,5)
resultor= mybinaryimageA | mybinaryimageB;
imshow(mat2gray(resultor)), title('Image A OR Image B ');

% Take AND of Image A and Image B and Display it
subplot(4,2,6)
resultand= mybinaryimageA & mybinaryimageB;
imshow(mat2gray(resultand)), title('Image A AND Image B ');

% Read a coour image and convert it to 8 bit grey level image

subplot(4,2,7)
mycolourimg = imread('zoo1.jpg');
mygrayimg = rgb2gray(mycolourimg);
subimage(mygrayimg),title('Original Grey Image');
axis off; axis equal;


% Extract seventh plane and display it
subplot(4,2,8)
planeimg = double(mygrayimg);
k = 128;
mysevengreyimg = mod(floor(planeimg/k),2); 
imshow(mysevengreyimg),title('Seventh Plane');
