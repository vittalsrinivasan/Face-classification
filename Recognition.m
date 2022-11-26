function OutputName=Recognition(TestImage,m,A,Eigenfaces)
ProjectedImages=[];
Train_Numbers=size(Eigenfaces,2 )+1;
for i=1:Train_Numbers
    temp=Eigenfaces'*A(:,i); %projection of centred images into freespace
    ProjectedImages=[ProjectedImages temp];
end
%%extracting pca features
InputImage=imread(TestImage);
temp=InputImage(:,:,1);

[irow icol]=size(temp);
InImage=reshape(temp',irow*icol,1);
Difference=double(InImage)-m;
ProjectedTestImage=Eigenfaces'*Difference;

%%calculating euclidean distance
Euc_dist=[];
for i=1:Train_Numbers
    q=ProjectedImages(:,i);
    temp=(norm(ProjectedTestImage-q))^2;
    Euc_dist=[Euc_dist temp];
   
end
 disp(Euc_dist)
[min_euc, Recognised_index]=min(Euc_dist);
OutputName=strcat(int2str(Recognised_index),'.pgm');
disp('min value')
disp(min_euc);
