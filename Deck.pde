class Deck {

  //Je crée ces tableaux ici au lieu d'ajouter ces infos dans les fichiers CSV car j'en aurai besoin pour une évolution de l'application  
  private final String[] TAB_VALEURS = {"As", "Deux", "Trois", "Quatre", "Cinq", "Six", "Sept", "Huit", "Neuf", "Dix", "Page", "Cavalier", "Dame", "Roi"};
  private final String[] TAB_SUITES = {"Coupes", "Batons", "Epées", "Pentacles"};
  
  //Fichiers CSV
  private final String csvMajeurs = "data/Majeurs.csv";
  private final String csvMineurs = "data/Mineurs.csv";
  
  private Carte[] cartes; 
  public int nbCartes;
  
  Deck(){
    
    println("Création du deck");
        
    //chargement des fichiers CSV
    Table tableMaj = loadTable(csvMajeurs, "header");
    Table tableMin = loadTable(csvMineurs, "header");
    
    nbCartes = tableMaj.getRowCount() + tableMin.getRowCount() ;
    cartes = new Carte[nbCartes] ;//22 majeurs, 56 (14 * 4) mineurs = 78
    int compteur = 0; //compteur de cartes 
    
    //Je parcours d'abord le fichier d'arcanes mineurs pour commencer le remplissage du tableau
    for(int  j = 0 ; j < TAB_SUITES.length ; j++) {//les 56 restantes sont réparties en 4 suites 
      for(int  k = 0 ; k < TAB_VALEURS.length ; k++) {//chaque suite possède 14 cartes ayant des valeus différentes
         //structure de la table : Image, Signification, SignificationInv
         TableRow row = tableMin.getRow(compteur);
         cartes[compteur++] = new ArcaneMineur(TAB_VALEURS[k], TAB_SUITES[j], loadImage(row.getString("Image")), row.getString("Signification")  , row.getString("SignificationInv") );
        //je crée l'arcane mineur en complétant mes infos avec celles du fichier
      }
    }    
    
    //Je continue par le fichier des arcanes majeurs
    for (TableRow row : tableMaj.rows()) {//remplissage du reste du tableau avec les arcanes majeurs lus dans le fichier
      //structure de la table : Num, Nom, Image, Signification, SignificationInv
      cartes[compteur++] = new ArcaneMajeur(row.getInt("Num"), row.getString("Nom") , loadImage(row.getString("Image")), row.getString("Signification")  , row.getString("SignificationInv") );
    }
    //à la fin du constructeur, j'ai 78 cartes
  }
  
  public void affiche(){
     for(int i = 0 ; i < cartes.length ; i++) 
        cartes[i].affiche();
     
  }
  public Boolean carteEstTiree(int ind){
    if(ind < nbCartes) return cartes[ind].getTiree() ;
    else return false;
  }
  
}
