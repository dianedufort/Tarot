class Carte {
 
 protected PImage carte;  
 protected String signification;
 protected String significationInv;
 
 private Boolean tiree ; 
 protected Boolean inverse; 
 
 Carte(PImage c, String mc, String mc2) {//image et mots clés
   println("Création d'une carte");
   
   signification = mc;
   significationInv = mc2;
   
   
   c.resize(150,265);
   carte = c;
   
   tiree = false; 
   inverse = round(random(0,1))==1 ? true : false;//un entier dans [0 ; 1]

   
 }
 
 //setter/getter pour this.tiree
 public void tireCarte(){
   tiree=true;
 }
 public Boolean getTiree() {
   return tiree;
 }
 
 //renvoie les infos commune à toutes les cartes
 protected String afficheInfos() {
  return inverse?" inversé : " + significationInv: " :" +signification ; 
 }
 
 //affiche l'image de la carte avec la symétrie si elle est inversée
 protected void affiche() {
   // println("Affiche classe mère");
     if(inverse){
        scale(1,-1); 
        translate(0, -carte.height);
     }
     image(carte, 0, 0);
  }
 
 
}