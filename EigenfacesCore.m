function[m,A,Eigenfaces]= EigenfacesCore(T)
m=mean(T,2);
Train_Numbers=size(T,2);
A=[];
for i=1:Train_Numbers
    temp=double(T(:,i))-m;
    A=[A temp];
end
L=A'*A;
[V,D]=eig(L);
L_eig_vec=[];
for i=1:size(V,2)
   if(D(i,i)>1)
       L_eig_vec=[L_eig_vec V(:,i)];
   end
end
disp(size( L_eig_vec))
Eigenfaces=A*L_eig_vec;