function [L,U] = Mylu1(A,n)
    for k=1:n-1
            A(k+1:n,k)=A(k+1:n,k)/A(k,k)
            A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
         
    end
   L=tril(A,-1)+eye(n,n)
   U=triu(A)
endfunction

/////////////////////////////////////////////////////////////////////////////////////

function [L,U] = mylu3b(A)
    n=size(A,1);
    for k=1:n-1
        for i=k+1:n
            A(i,k)=A(i,k)/A(k,k);
        end
    
    
        for i=k+1:n
            for j=k+1:n
                A(i,j)=A(i,j)-A(i,k)*A(k,j);
            end
        end
    
end


    
U=triu(A);
L=tril(A);
endfunction

////////////////////////////////////////////////////////////////////////////////////
xdata = [10:10:100];

for n = xdata
    
    i = n/10;
    
 U=rand(n,n);//Ici on génère une matrice carée avec des nombre aléatoires

        
//xl = lsolve(U,b)
[L U] = mylu3(U);
        

        
end
/////////////////////////////////////////////////////////////////////////////////////

function  [L,U,P]= mylu(A)
    n=size(A,1);
    q=zeros(1,n);
    
    row = [1,n]
    
    for k=1:n-1
        [piv,ind]=max(abs(A(k:n,k)));
        ind=k-1+ind;
        q(1,k)=row(1,ind);
        
        if(ind~=k)
            new=A(ind);
            A(ind,:)=A(ind,:);
            A(k,:)=new;
            row(1,ind)=row(1,k);
            row(1,k)=q(1,k);
        end
        
        rows=k+1:n;
        A(rows,k)-A(rows,k)/A(k,k);
        A(rows,rows)=A(rows,rows)-A(rows,k)+A(k,rows);
        
    end
    
    Idn=speye(n,n);
        P=Idn(row,:);
        L=tril(A,-1)+speye(n,n);
        U=triu(A);
    
endfunction

function [L,U] = mylu3b(A)
    
    n=size(A,1);
    q=size(1,n);
    
    row = [1,n];
    
    for k=1:n-1
        [piv,ind]=max(abs(A(k:n,k)));
        ind = k-1 +ind;
        q(1,k)=row(1,ind);
        
        if(ind~=k)
            new = A(ind,:);
            A(ind,:)=A(k,:);
            A(k,:)=new;
            row(1,ind)=row(1,k);
            row(1,k)=q(1,k);
            
        end

        for i=k+1:n
            A(i,k)=A(i,k)/A(k,k);
        end
        
        for i=k+1:n
            for j=k+1:n
                A(i,j)=A(i,j)-A(i,k)+A(k,j);
    end
end
end
        Idn=speye(n,n);
        P=Idn(row,:);
        L=tril(A,-1)-speye(n,n);
        U=triu(A);

endfunction

