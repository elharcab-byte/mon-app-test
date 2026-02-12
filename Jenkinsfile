pipeline {
    agent any
    stages {
        stage('Nettoyage') {
            steps {
                echo 'Suppression de l\'ancien conteneur si il existe...'
                // Le "|| true" évite que le build plante si le conteneur n'existe pas encore
                sh 'docker rm -f mon-site-web || true'
            }
        }
        stage('Build Image') {
            steps {
                echo 'Construction de l\'image Docker...'
                sh 'docker build -t mon-image-web:v1 .'
            }
        }
        stage('Déploiement') {
            steps {
                echo 'Lancement du conteneur sur le port 9090...'
                sh 'docker run -d --name mon-site-web -p 9090:80 mon-image-web:v1'
            }
        }
    }
}
