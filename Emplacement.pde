class Emplacement {

  String nom;
  int x, y, col, lig;
  int deltaX, deltaY;

  Carte c; 

  Emplacement(String n, int c, int l, int w, int h) {//w et h correspondent à la largeur et hauteur d'une colonne
    nom = n;
    col = c-1; 
    lig = l-1;
    x =  (col - 1/2)*w   ;
    y =  (lig - 1/2)*h  ;

    deltaX = w;
    deltaY = h;
  }
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

