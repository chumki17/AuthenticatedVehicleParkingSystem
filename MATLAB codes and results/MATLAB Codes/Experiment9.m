%************************************************
%************************************************
%************File name: experiment9.m************
%************************************************
%************************************************

clc
close all
clear all

% Read the image, resize it to 256 x 256
% Convert it to grey image and display it

mygrayimg = imread('dog.tif');
mygrayimg = imresize(rgb2gray(mygrayimg),[256 256]);  
subplot(2,2,1);
imshow(mygrayimg),title('Original Image');

% Find FFT
% Use the command fft2() to get FFT of the image
% The log scale of FFT image is displayed 

myfftimage = fft2(mygrayimg);

% Take logarithmic scale for display

tmp = abs(myfftimage);
mylogimg = log(1+tmp);

subplot(2,2,2);
imshow(mat2gray(mylogimg)); 
title('FFT Image');

% Find size
[M,N] = size(myfftimage);

% Create Filter array

% The cut off frequency 20 is used here

low = 62;
band1 = 15;
band2 = 60;

% create ideal high pass filter mask

% Create matrix of size equals original matrix

mylowpassmask = ones(M,N);
mybandpassmask = ones(M,N);

% Generate values for ideal high pass mask

for u = 1:M
   for v = 1:N
       
       tmp = ((u-(M+1))/2)^2 +(v-(N+1)/2)^2;
       raddist = round((sqrt(tmp)));
       disp(raddist)
       
       if raddist > low  
       mylowpassmask(u,v) = 0;
       end
       
       if raddist > band2 || raddist < band1; 
       mybandpassmask(u,v) = 0;
       end
   end
end

% Shift the spectrum to the centre
f1 = fftshift(mylowpassmask);
f3 = fftshift(mybandpassmask);

% Apply the filter H to the FFT of the Image
resimage1 = myfftimage.*f1;
resimage3 = myfftimage.*f3;


% Apply the Inverse FFT to the filtered image

% Display the low pass filtered image
r1 = abs(ifft2(resimage1));
subplot(2,2,3);
imshow(r1,[]),title('Low Pass filtered image');


% Display the band pass filtered image

r3 = abs(ifft2(resimage3));
subplot(2,2,4);
imshow(r3,[]),title('Band Pass filtered image');

