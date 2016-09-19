class Tirage {
  
  private Deck jeu;
  private Emplacement[] tirage; 
  private int nbCol, nbLig; 
  private int deltaCol, deltaLig; 
  private String question;
  
  private int nbEmp;
  
  //cosntructeur
  Tirage(Deck d, int nb, int nbC, int nbL , int w, int h, String n) {
    println("Tirage");
    
    jeu = d;
    nbCol = nbC; 
    nbLig = nbL; 
    deltaCol = w/nbC;
    deltaLig = h/nbL;
    nbEmp = 0;
    question = n ;
    
    tirage = new Emplacement[nb]; 
  }
  
 //crée un emplacement avec un nom et à des coordonnées (par rapport au "tableau" tirage) données
  public void emplacement(String nom, int c, int l) {
    if(nbEmp < tirage.length) {
        tirage[nbEmp++] = new Emplacement(nom, c, l, deltaCol, deltaLig);
    }
    
  }
  
  
  //
  public void selection(){
    if(nbEmp == tirage.length){
      for(int i=0; i < nbEmp; i++){
         int ind = int(random(jeu.nbCartes));//carte aléatoire
         while(jeu.carteEstTiree(ind) == true){//test si elle n'a pas déjà été tirée
           ind = int(random(jeu.nbCartes));  //tant que l'on sélectionne une carte déjà tirée, reselection
         }
         //attribution de la carte choisie à l'emplacement
         tirage[i].attribueCarte(jeu.cartes[ind]);
         jeu.cartes[ind].tiree = true;
      }
       affiche();
    }
   
  }
  
  public void affiche(){
    
    fill(0);
     text(question, 0,0, 200, 30); 
    noFill();
     for(int i=0; i < nbEmp; i++){
       tirage[i].affiche();
     }
  }
}