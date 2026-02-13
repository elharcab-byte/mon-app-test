pipeline {
    agent any
    
    triggers {
        pollSCM('* * * * *')
    }

    stages {
        stage('Nettoyage Global') {
            steps {
                // On nettoie tout pour repartir propre
                sh 'docker rm -f site-staging site-prod || true'
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
                // Attention : on teste bien le port 9091 ici !
                sh 'ansible-playbook test_site.yml --extra-vars "target_port=9091"'
            }
        }

        stage('Validation Manuelle') {
            steps {
                // Jenkins va s'arrêter ici et attendre ton clic
                input message: "Est-ce que le site en Staging est OK ? (Vérifiez sur le port 9091)", ok: "Déployer en PROD"
            }
        }

        stage('Déploiement Production') {
            steps {
                echo 'Déploiement en PRODUCTION (Port 9090)...'
                sh 'docker rm -f site-prod || true'
                sh 'docker run -d --name site-prod -p 9090:80 mon-image-web:v1'
            }
        }
    }
}
