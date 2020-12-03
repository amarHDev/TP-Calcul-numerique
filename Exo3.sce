//n = 100;
xdata = [10:10:100];
for n = xdata;
i=n/10;

A=rand(n,n);
B=rand(n,n);

tic();


C3B= matmat3b(A,B);



times1(i) = toc()


tic();

C2B= matmat2b(A,B);


times2(i) = toc()

tic();

C1B= matmat1b(A,B);


times3(i) = toc()

tic();

Cnorm=A*B;


times4(i) = toc()

end


    xtitle("Comparaison temps execution des différent dotprod"); 
    subplot(2,2,1),plot2d(xdata,times1,3,leg="matmat3b"),subplot(2,2,2),plot2d(xdata,times2,4,leg="matmat2b");,subplot(2,2,3),plot2d(xdata,times3,5,leg="matmat1b");,subplot(2,2,4),plot2d(xdata,times4,2,leg="Produit mat*mat de Scilab");
    xlabel("Taille matrice (n)");
    ylabel("Temps execution");
