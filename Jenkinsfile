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
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo 'Récupération du code...'
            }
        }
        stage('Test Docker') {
            steps {
                sh 'docker --version'
            }
        }
        stage('Test Ansible') {
            steps {
                // On vérifie si Ansible est installé
                sh 'ansible --version'
            }
        }
    }
}
