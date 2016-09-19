class ArcaneMajeur extends Carte {
  
  private int num; 
  private String nom;
  
  ArcaneMajeur(int n, String nm, PImage c, String mc, String mc2) {
    //numéro, nom, image, mots-clés
    super(c, mc, mc2);
    num = n; 
    nom = nm;
     println("Création d'un arcane majeur");
  }
  
  public String afficheInfos() {
    return num + " - " + nom + " : " + super.afficheInfos();

  }  
  
}