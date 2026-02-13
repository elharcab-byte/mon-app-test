pipeline {
    agent any
    
    triggers {
        pollSCM('* * * * *')
    }

    stages {
        stage('Nettoyage Global') {
            steps {
                sh 'docker rm -f site-staging site-prod mon-site-web || true'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build --no-cache -t mon-image-web:v1 .'
            }
        }

        stage('Déploiement Staging') {
            steps {
                sh 'docker run -d --name site-staging -p 9091:80 mon-image-web:v1'
            }
        }

        stage('Vérification Ansible') {
            steps {
                sh 'ansible-playbook test_site.yml --extra-vars "target_port=9091"'
            }
        }

        stage('Validation Manuelle') {
            steps {
                input message: "Est-ce que le site en Staging est OK ?", ok: "Déployer en PROD"
            }
        }

        stage('Déploiement Production') {
            steps {
                sh 'docker rm -f site-prod || true'
                sh 'docker run -d --name site-prod -p 9090:80 mon-image-web:v1'
            }
        }
    }

    // --- LE NOUVEAU BLOC DE NOTIFICATION ---
    post {
        success {
            echo '✅ SUCCÈS : L\'application est en ligne sur http://localhost:9090'
        }
        failure {
            echo '❌ ÉCHEC : Le pipeline s\'est arrêté. Vérifiez les logs pour corriger l\'erreur.'
        }
        aborted {
            echo '⚠️ ANNULÉ : Le déploiement en production a été refusé.'
        }
    }
}
