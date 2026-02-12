pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo 'Récupération du code depuis GitHub...'
            }
        }
        stage('Build') {
            steps {
                echo 'Construction de l\'image Docker...'
                sh 'docker --version' 
            }
        }
    }
}
