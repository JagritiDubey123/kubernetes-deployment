pipeline {
    agent any

    environment {
        GCR_CREDENTIALS = 'gcr-credentials' // Credential ID for GCR
        KUBE_CONFIG = credentials('kubeconfig') // Credential ID for Kubernetes config
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your GitHub repository
                git 'https://github.com/JagritiDubey123/kubernetes-deployment.git'
            }
        }

        stage('Build and Push Docker Images') {
            steps {
                script {
                    // Build and push Docker images for frontend, backend, and MySQL
                    docker.build("frontend", "./FrontEnd")
                    docker.build("backend", "./backend")
                    docker.build("mysql", "./mysQL")

                    docker.withRegistry('https://gcr.io', GCR_CREDENTIALS) {
                        docker.image("frontend").push()
                        docker.image("backend").push()
                        docker.image("mysql").push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                // Use Kubernetes credentials and apply Kubernetes YAML files
                withKubeConfig(credentialsId: 'kubeconfig', serverUrl: 'https://kubernetes-api-url') {
                    sh 'kubectl apply -f frontend.yaml -f backend.yaml -f mysql.yaml'
                }
            }
        }
    }
}
