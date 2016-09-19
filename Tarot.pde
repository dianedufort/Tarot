void setup(){
  size(600, 900); 
 
  Deck d = new Deck();
 
  /* //Deck d, int nbCartes, int nbCol, int nbLig , int largeur, hauteur
  Tirage tirage = new Tirage(d, 3, 3, 1 , width, height);

  tirage.emplacement("Passé", 1, 1);  //int i, String nom, int c, int l
  tirage.emplacement("Présent", 2, 1);
  tirage.emplacement("Futur", 3, 1);
  tirage.selection();*/
  
  
  Tirage tirage = new Tirage(d, 4, 3, 3 , width, height, "Ce qu'il faut arrêter");
 // println("/////////////////// STOP ////////////////////");
  tirage.emplacement("Physiquement", 2, 1);  //String nom, int c, int l
  tirage.emplacement("Mentalement", 1, 2);
  tirage.emplacement("Emotionnellement", 3, 2);
  tirage.emplacement("Spirituellement", 2, 3);
  tirage.selection();
  

}

