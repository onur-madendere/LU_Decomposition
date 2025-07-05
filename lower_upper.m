fprintf("solving Ax=B for x\n")
A=input('enter square matrix: ');
B=input('enter column vector: ');
flag1=1;
flag0=0;
[m,n]=size(A);
x=zeros(size(B));
y=zeros(size(B));
U=A;

if size(B)==[m,1]
    flag0=1;
end

if m~=n
    flag1=0;
end

if flag1==1 && flag0==1
    L=zeros(size(A));

    for i=1:m
        L(i,i)=1;
    end

    for j=1:n-1
        for i=j:m-1 
            L(i+1,j)=U(i+1,j)/U(j,j);
            U(i+1,:)=U(i+1,:)-L(i+1,j)*U(j,:);
        end

    end
    y=L\B;
    x=U\y;
    
    fprintf("Ax\n");
    disp(A*x);
    
    fprintf("B\n");
    disp(B);

    fprintf("x\n");
    disp(x);

else
    fprintf("LU not applicable to matrices\n");
end