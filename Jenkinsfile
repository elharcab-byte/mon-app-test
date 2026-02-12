pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Récupération du code depuis GitHub...'
                checkout scm
            }
        }
        stage('Build & Test Docker') {
            steps {
                echo 'Vérification de Docker...'
                sh 'docker --version'
            }
        }
        stage('Test Ansible') {
            steps {
                echo 'Vérification d\'Ansible...'
                // Si tu ne l'as pas encore installé, ce stage échouera, 
                // mais on saura pourquoi !
                sh 'ansible --version'
            }
        }
    }
}
