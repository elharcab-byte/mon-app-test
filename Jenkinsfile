pipeline {
    agent any
    
    triggers {
        pollSCM('* * * * *')
    }

    stages {
        stage('Nettoyage') {
            steps {
                sh 'docker rm -f mon-site-web || true'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build --no-cache -t mon-image-web:v1 .'
            }
        }
        stage('Deploiement') {
            steps {
                sh 'docker run -d --name mon-site-web -p 9090:80 mon-image-web:v1'
            }
        }
        stage('Verification Ansible') {
            steps {
                // On affiche un message pour être sûr que ça passe ici
                echo 'Lancement du test Ansible...'
                sh 'ansible-playbook test_site.yml'
            }
        }
    }
}
