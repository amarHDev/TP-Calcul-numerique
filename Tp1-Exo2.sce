function []= jouet(n,e)    
    format("e",e)
    
    A=rand(n,n) //Crée une matrice de dimension 3,3 avec la fonction rand
    disp(A)
    
    xex = rand(n,1) //Remplir un vecteur colonne avec la fonction rand()
    disp(xex)
    
    b = A * xex //b = A * xex
    disp("Le vecteur obtenu b : ",b)
    
    x = A\b //résolution du système
    
    //Calcul erreur avant
    frelres = norm(x-xex)/norm(xex)
    disp("Erreur avant :    ",frelres)
    
    //Calcul erreur arriere
    brelres = norm(b-(A*x))/norm(b)
    disp("Erreur arriere :  ",brelres)
    
    //Calcul du conditionnement
    disp("conditionnement de A :    ",cond(A))
    
    //borne pour l'erreur avant
    disp("borne ( A*erreur arriere ):   ",cond(A)*brelres)
     
 endfunction










