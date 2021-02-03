function diff = createiristemplate(eyeimage_filename, stat,Fmt)
% eyeimage_filename='E:\Projects\Image\IRIS\iriscode\IRIS18A';
% path for writing diagnostic images
% global DIAGPATH
% DIAGPATH = 'diagnostics';
diff=[];
%normalisation parameters
radial_res = 20;
angular_res = 240;
% with these settings a 9600 bit iris template is
% created

%feature encoding parameters
nscales=1;
minWaveLength=18;
mult=1; % not applicable if using nscales = 1
sigmaOnf=0.5;
T_eyeimage_filename = [ eyeimage_filename '.' Fmt];
eyeimage = imread(T_eyeimage_filename); 

savefile = [eyeimage_filename,'-houghpara.mat'];
% [stat,mess]=fileattrib(savefile);
tempPath=pwd;
tempPath=strcat(tempPath,'\DataBase\');
PFile = [tempPath 'Fname.mat'];
load(PFile);
SFile=size(FileNames);
save
savefile = [tempPath savefile];
if stat == 0
    
    % if this file has not been processed before
    % then perform automatic segmentation and
    % save the results to a file
    
    [circleiris circlepupil imagewithnoise] = segmentiris(eyeimage);%Features
    figure,imshow(imagewithnoise);
    
    save(savefile,'circleiris','circlepupil','imagewithnoise');
    FileNames{SFile(2)+1}=eyeimage_filename;
    save(PFile,'FileNames');

else
    % if this file has been processed before
    % then load the circle parameters and
    % noise information for that file.
    
%      load(savefile);
[circleiris circlepupil imagewithnoise] = segmentiris(eyeimage);
    figure,imshow(imagewithnoise);
   
   imagewithnoise2 = uint8(imagewithnoise);
   imagewithcircles = uint8(eyeimage);

%get pixel coords for circle around iris
    [x,y] = circlecoords([circleiris(2),circleiris(1)],circleiris(3),size(eyeimage));
    ind2 = sub2ind(size(eyeimage),double(y),double(x)); 

%get pixel coords for circle around pupil
    [xp,yp] = circlecoords([circlepupil(2),circlepupil(1)],circlepupil(3),size(eyeimage));
    ind1 = sub2ind(size(eyeimage),double(yp),double(xp));
% Write noise regions
    imagewithnoise2(ind2) = 255;
    imagewithnoise2(ind1) = 255;
% Write circles overlayed
    imagewithcircles(ind2) = 255;
    imagewithcircles(ind1) = 255;
% perform normalisation

    [polar_array noise_array] = normaliseiris(imagewithnoise, circleiris(2),...
    circleiris(1), circleiris(3), circlepupil(2), circlepupil(1), circlepupil(3),eyeimage_filename, radial_res, angular_res);
% imshow(uint8(polar_array));
% figure,imshow(uint8(noise_array));
% perform feature encoding
[template mask] = encode(polar_array, noise_array, nscales, minWaveLength, mult, sigmaOnf); 
    
 for i=1:SFile(2)
     eyeimage_filename = FileNames{i};
     savefile = [eyeimage_filename,'-houghpara.mat'];
     tempPath=pwd;
     tempPath=strcat(tempPath,'\DataBase\');
     savefile = [tempPath savefile];
     load(savefile);
     imagewithnoise2 = uint8(imagewithnoise);
     imagewithcircles = uint8(eyeimage);

%get pixel coords for circle around iris
    [x,y] = circlecoords([circleiris(2),circleiris(1)],circleiris(3),size(eyeimage));
    ind2 = sub2ind(size(eyeimage),double(y),double(x)); 

%get pixel coords for circle around pupil
    [xp,yp] = circlecoords([circlepupil(2),circlepupil(1)],circlepupil(3),size(eyeimage));
    ind1 = sub2ind(size(eyeimage),double(yp),double(xp));
% Write noise regions
    imagewithnoise2(ind2) = 255;
    imagewithnoise2(ind1) = 255;
% Write circles overlayed
    imagewithcircles(ind2) = 255;
    imagewithcircles(ind1) = 255;
% perform normalisation

    [polar_array noise_array] = normaliseiris(imagewithnoise, circleiris(2),...
    circleiris(1), circleiris(3), circlepupil(2), circlepupil(1), circlepupil(3),eyeimage_filename, radial_res, angular_res);

% perform feature encoding
[template1 mask1] = encode(polar_array, noise_array, nscales, minWaveLength, mult, sigmaOnf); 
diff(i)=gethammingdistance(template1, mask1, template, mask, nscales);
 end
end