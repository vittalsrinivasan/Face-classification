function T=CreateDatabase(TrainDatabase)
TrainFiles=dir(TrainDatabase);
Train_Number=4;
%{
for i=1:size(TrainFiles,1)
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number=Train_Number+1;
    end
end
%}
%%creating a 2D matrix from 1D vector
T=[];
for i=1:Train_Number
    str=int2str(i);
    str=strcat('\',str,'.pgm');
    str=strcat(TrainDatabase,str);
    
    img=imread(str);
    %img=rgb2gray(img);
    
    [irow icol]=size(img);
    temp=reshape(img',irow*icol,1);
    T=[T temp]; %%creating 1D vector of DataBase
end
    