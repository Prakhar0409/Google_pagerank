% Page rank trial implementation on a 100 x 100 sparse matrix

%n=3;
n=100;
i=randperm(n,n/5);
j=randperm(n,n/5);
P=sparse(i,j,1,n,n);
%P=[0 1 0;0 1 1;0 1 0];
%P=sparse(P);
% nxn sparse matrix generated and stored in P
p=0.85;
c=sum(P);
k=find(c~=0);
D=sparse(k,k,1./c(k),n,n);
% P*D will give the matrix with 1/nj thingy

e=ones(n,1);
z=((1-p)*(c~=0) + (c==0))/n;

P=p*P*D;

%first guess;
x1=e/n;

err=ones(n,1);
err=err/500;
cal=ones(n,1);
while cal>err
   x2=x1;
   x1=P*x1+e*(z*x1);
   cal=abs(x2-x1); 
end

%printing the page ranks
x1
    