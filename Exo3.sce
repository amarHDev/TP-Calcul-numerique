M= 3
N= 3
P= 3


A=rand(M,N)
B=rand(M,N)

tic
C1 = matmat3b(A,B,M,N,P)
toc

tic
C2 = matmat2b(A,B,M,N,P)
toc

tic
C3 = matmat1b(A,B,M,N,P)
toc

C = A*B //Appel direct de BLAS3

disp("C1 :", C1)

disp("C2 :", C2)

disp("C3 :", C3)

disp("C3 :", C)
