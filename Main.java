public class Main {
    public static void main(String[] args) {
        System.out.println("Début du test Java...");

        // ERREUR LOGIQUE : Division par zéro (Crash à l'exécution)
        int resultat = 10 / 0; 

        // ERREUR DE RESSOURCE : Boucle infinie (Va déclencher le TIMEOUT de Jenkins)
        /*
        while(true) {
            System.out.println("Je consomme du CPU pour rien...");
        }
        */

        System.out.println("Résultat : " + resultat);
    }
}
