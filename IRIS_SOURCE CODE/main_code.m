clear all;
clc;
for i=1:inf
    pause;
    disp('0->update DataBase');
    disp('1->Display Database');
    disp('2->Delete an image from Database');
    disp('4->Identify the Iris');
    disp('5->Quit');
    Opt = input('Enter the Choice');
    if Opt==5
        break;c
    end
    if Opt==0
        Img_name=input('Enter the Iris image to be added');
        Fmt=input('Enter the Image format');
        Diff = createiristemplate(Img_name,Opt,Fmt);
        disp('Updated Sucessfullly........');
    elseif Opt==4
        Img_name=input('Enter the iris image to be identified');
        Fmt=input('Enter the Image format');
        Diff = createiristemplate(Img_name,Opt,Fmt);
        tempPath=pwd;
        tempPath=strcat(tempPath,'\DataBase\');
        PFile = [tempPath 'Fname.mat'];
        load(PFile);
        [ Val Pos ] = min(Diff);
        if Val==0
            disp('Given input image is');
            disp(FileNames{Pos});
        else
            disp('Iris Not in DataBase');
        end
    elseif Opt==1
        tempPath=pwd;
        tempPath=strcat(tempPath,'\DataBase\');
        PFile = [tempPath 'Fname.mat'];
        load(PFile);
        Fsi=size(FileNames);
        for i=1:Fsi(2)
            disp(FileNames{i});
        end
    elseif Opt==2
        Img_name=input('Enter the image to be deleted');
        tempPath=pwd;
        tempPath=strcat(tempPath,'\DataBase\');
        PFile = [tempPath 'Fname.mat'];
        load(PFile);
        Fsi=size(FileNames);
        for i=1:Fsi(2)
            if (strcmp(FileNames{i},Img_name)==1)
                for j=i+1:Fsi(2)
                    tem{j-1}=FileNames{j};
                end
                break;
            end
            tem{i}=FileNames{i};
        end
        FileNames=tem;
        save(PFile,'FileNames');
    end
end
    
% I=imread(Img_name);