// pipeline {
//     agent any

//     environment {
//         GCR_CREDENTIALS = 'gcr-credentials' // Credential ID for GCR
//         KUBE_CONFIG = credentials('kubeconfig') // Credential ID for Kubernetes config
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 // Checkout the code from your GitHub repository
//                 git 'https://github.com/JagritiDubey123/kubernetes-deployment.git'
//             }
//         }

//         stage('Build and Push Docker Images') {
//             steps {
//                 script {
//                     // Build and push Docker images for frontend, backend, and MySQL
//                     docker.build("frontend", "./FrontEnd")
//                     docker.build("backend", "./backend")
//                     docker.build("mysql", "./mysQL")

//                     docker.withRegistry('https://gcr.io', GCR_CREDENTIALS) {
//                         docker.image("frontend").push()
//                         docker.image("backend").push()
//                         docker.image("mysql").push()
//                     }
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 // Use Kubernetes credentials and apply Kubernetes YAML files
//                 withKubeConfig(credentialsId: 'kubeconfig', serverUrl: 'https://kubernetes-api-url') {
//                     sh 'kubectl apply -f frontend.yaml -f backend.yaml -f mysql.yaml'
//                 }
//             }
//         }
//     }
// }



pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "gcr.io"  // Your GCR registry URL
        IMAGE_NAME = "frontend" // Your Docker image name
        image2 = "backend"
        image3 = "mysql"
        // TAG = "latest"  // Tag for your Docker image
        GCP_PROJECT_ID = "jagriti-411012"  // Your GCP project ID
        GCP_SERVICE_ACCOUNT_KEY = credentials('GCP_ID')  // Jenkins credentials for GCP service account key file
        KUBE_CONFIG = credentials('kubeconfig') // Jenkins credentials for Kubernetes config
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '1', url: 'https://github.com/JagritiDubey123/Jenkins.git'
            }
        }
       stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker images for frontend, backend, and MySQL
                    sh "docker build -f FrontEnd/Dockerfile -t ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${IMAGE_NAME} ./FrontEnd"
                    sh "docker build  -t ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image2} ./backend"
                    sh "docker build  -t ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image3} ./mysql"
                }
            }
        }

        stage('Push Docker Image to GCR') {
            steps {
                script {
                    // Authenticate with GCP
                    withCredentials([file(credentialsId: 'GCP_ID', variable: 'GCP_SERVICE_ACCOUNT_KEY_FILE')]) {
                        sh "gcloud auth activate-service-account --key-file=${GCP_SERVICE_ACCOUNT_KEY_FILE}"
                    }

                    // Tag Docker images with GCR URL
                    // sh "docker tag ${IMAGE_NAME} ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${IMAGE_NAME}"
                    // sh "docker tag ${image2} ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image2}"
                    // sh "docker tag ${image3} ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image3}"

                    // Push Docker images to GCR
                    sh "docker push ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${IMAGE_NAME}"
                    sh "docker push ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image2}"
                    sh "docker push ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image3}"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                // Use Kubernetes credentials and apply Kubernetes YAML files
                withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
                    sh 'export KUBECONFIG=$KUBECONFIG && kubectl apply -f frontend.yaml -f backend.yaml -f mysql.yaml'
                }
            }
        }
    }
}

