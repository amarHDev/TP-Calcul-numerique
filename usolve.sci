function [x]= usolve(U,b)
    
    n=size(U,b)
    m=size(b,2)
    
    x= =zero(size(b-1),size(b,2))
    
    x(n,1:m)=(b(n,1:m))./A(n,n);
    
    for i=1:n
        x(i,1:m) = (b(i,1:m)-U(i,i+1:n)*(x((i+1):n,1:m)))./U(i,i)
    end
    
endfunction
