s = 100;
rand("seed");

xdata = [10:10:100];

for n = xdata
    
    i = n/10;

        U=rand(n,n);//Ici on génère une matrice carée avec des nombre aléatoires
        
                    
        b=rand(n,1);//Vecteur solution
        
        
        xex=rand(n,1);//Vecteur solution
        
        b =  U*xex;//Creation du second membre
        
        //xl = lsolve(U,b)
        xu = gauss3b(U,b);
        
        //Calcul de l'erreur en avant
        fErrorB(i) = norm(xex-xu,2)/norm(xex,2);
        
        //Calcul de l'erreur arrière
        bErrorB(i) = norm(b-U*xu,2)/norm(b,2);

        //borne
        born(i)= cond(A)*bErrorB(i);
        
end

    xtitle("Erreur avant arrière de la methode de Gauss"); 
    plot2d(xdata,[log(fErrorB) log(bErrorB) log(born)],[3 5 2],leg="Erreur avant de gauss @ Erreur arrière de Gauss @ Borne");
    xlabel("Taille matrice (n)");
    ylabel("Valeurs erreurs");
