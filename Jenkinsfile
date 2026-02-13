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
                echo 'Déploiement en RECETTE (Port 9091)...'
                sh 'docker run -d --name site-staging -p 9091:80 mon-image-web:v1'
            }
        }

        stage('Vérification Ansible') {
            steps {
                echo 'Ansible teste le Staging...'
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
                echo 'Déploiement en PRODUCTION (Port 9090)...'
                sh 'docker rm -f site-prod || true'
                sh 'docker run -d --name site-prod -p 9090:80 mon-image-web:v1'
            }
        }

        stage('Monitoring Flash') {
            steps {
                echo '--- Statistiques des conteneurs actifs ---'
                sh 'docker stats --no-stream'
            }
        }
        stage('Nettoyage Post-Déploiement') {
            steps {
                echo 'Fermeture de l\'environnement de Staging devenu inutile...'
                // On garde la Prod, mais on éteint le Staging
                sh 'docker rm -f site-staging || true'
            }
        }
    }

    post {
        success {
            echo '✅ SUCCÈS : L\'application est en ligne sur http://localhost:9090'
        }
        failure {
            echo '❌ ÉCHEC : Le pipeline s\'est arrêté.'
        }
        unsuccessful {
            echo '⚠️ Nettoyage suite à un problème...'
            sh 'docker rm -f site-staging || true'
        }
    }
}
