clc;
clear all;
close all;
%initial directory path
TrainDatabase=uigetdir('E:\ANN- face','Select the training set');
TestDatabase=uigetdir('E:\ANN- face','Select test database');
prompt='Enter test image name(1-4)';
dlg_title='Input of PCA based face recognition system';
num_lines=1;
def={'1'};

TestImage=inputdlg(prompt,dlg_title,num_lines,def);
TestImage=strcat(TestDatabase,'\',char(TestImage),'.pgm');
im=imread(TestImage);


T=CreateDatabase(TrainDatabase);
[m,A,Eigenfaces]=EigenfacesCore(T);

OutputName=Recognition(TestImage,m,A,Eigenfaces);

SelectedImage=strcat(TrainDatabase,'\',OutputName);
SelectedImage1=imread(SelectedImage);
figure(1);
imshow(im);
title('Test Image');
figure(2);
imshow(SelectedImage1);
title('Person From Database');
str=strcat('Matched image is: ',OutputName);
disp(str);




