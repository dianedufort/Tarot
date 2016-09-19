class ArcaneMineur extends Carte {
  
  private String valeur; 
  private String suite;
  
  ArcaneMineur(String val, String su, PImage c, String mc, String mc2) {
     super(c, mc, mc2);
     valeur = val;
     suite = su;
     println("Création d'un arcane mineur");
    
  }
  
  public String afficheInfos() {
    return valeur + " de " + suite + " " + super.afficheInfos();
  }  

}
