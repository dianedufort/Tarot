class Emplacement {

  String nom;
  int x, y, col, lig;//position de l'emplacement sur la scène et dans le "tableau"
  int deltaX, deltaY; //le "padding" emplacement/carte

  Carte c; //la carte attribuée à cet emplacement

  Emplacement(String n, int c, int l, int w, int h) {//w et h correspondent à la largeur et hauteur d'une colonne
    nom = n;
    col = c-1; 
    lig = l-1;
    x =  (col - 1/2)*w   ;
    y =  (lig - 1/2)*h  ;

    deltaX = w;
    deltaY = h;
  }
  
  //place une carte à l'emplacement courant et calcule le padding
  void attribueCarte(Carte tmp) {
    c = tmp;    
    deltaX = (deltaX - c.carte.width)/2;
    deltaY = (deltaY - c.carte.height)/2;
    x += deltaX;
    y += deltaY;
  }

  void affiche() {
    pushMatrix();
    translate(x, y);

    c.affiche(); 
    afficheInfosEmplacement();

    popMatrix();
  }


  //si la carte est inversée, j'annule les transformations faites à la carte pour 
  //afficher mon texte dans le bon sens
  public void afficheInfosEmplacement() {
  
    if (c.inverse) {
      pushMatrix();
      
      scale(1, -1);
      translate(0, -c.carte.height);
        afficheChampTexte();
      popMatrix();
    } 
    else afficheChampTexte();
  }

    //affiche les informations de la carte dans un cadre noir transparent
  protected void afficheChampTexte() {
    
      fill(0,0,0,100);
          rect(0,0, c.carte.width, 100);
      noFill();
      fill(255);
          text(nom + " : ", 0, 0, c.carte.width, 30); 
          text(c.afficheInfos(), 0, 30, c.carte.width, 70 );  
      noFill();
  }
}