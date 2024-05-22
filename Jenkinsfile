pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "gcr.io"  // Your GCR registry URL
        IMAGE_NAME = "frontend" // Your Docker image name
        image2 = "backend"
        image3 = "mysql"
        TAG = "latest"  // Tag for your Docker image
        GCP_PROJECT_ID = "jagriti-411012"  // Your GCP project ID
        GCP_SERVICE_ACCOUNT_KEY = credentials('GCP_ID')  // Jenkins credentials for GCP service account key file
        KUBE_CONFIG = credentials('kubeconfig') // Jenkins credentials for Kubernetes config
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'jenkins', credentialsId: '1', url: 'https://github.com/JagritiDubey123/Jenkins.git'
            }
        }
      // stage('Build Docker Images') {
      //       steps {
      //           script {
      //               // Build Docker images for each service
      //               sh "docker build -f FrontEnd/Dockerfile -t ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${IMAGE_NAME} ./FrontEnd"
      //               sh "docker build -f backend/Dockerfile -t ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image2} ./backend"
      //               sh "docker build -f mysql/Dockerfile -t ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image3} ./mysql"
      //           }
      //       }
      //   }

      //   stage('Push Docker Image to GCR') {
      //       steps {
      //           script {
      //               // Authenticate with GCP
      //               withCredentials([file(credentialsId: 'GCP_ID', variable: 'GCP_SERVICE_ACCOUNT_KEY_FILE')]) {
      //                   sh "gcloud auth activate-service-account --key-file=${GCP_SERVICE_ACCOUNT_KEY_FILE}"
      //               }

      //               // Tag Docker images with GCR URL
      //               // sh "docker tag ${IMAGE_NAME} ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${IMAGE_NAME}"
      //               // sh "docker tag ${image2} ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image2}"
      //               // sh "docker tag ${image3} ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image3}"

      //               // Push Docker images to GCR
      //               sh "docker push ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${IMAGE_NAME}"
      //               sh "docker push ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image2}"
      //               sh "docker push ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image3}"
      //           }
      //       }
      //   }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker images
                    sh "docker build -f FrontEnd/Dockerfile -t ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${IMAGE_NAME}:${TAG} ./FrontEnd"
                    sh "docker build  -f backend/Dockerfile -t ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image2}:${TAG} ./backend"
                    sh "docker build  -f mysql/Dockerfile -t ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image3}:${TAG} ./mysql"
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

                    // Tag Docker image with GCR URL
                    // sh "docker tag ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${IMAGE_NAME}:${TAG}"
                    //  sh "docker tag ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image2}:${TAG}"
                    //  sh "docker tag ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image3}:${TAG}"

                    // Push Docker image to GCR
                    sh "docker push ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${IMAGE_NAME}:${TAG}"
                     sh "docker push ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image2}:${TAG}"
                     sh "docker push ${DOCKER_REGISTRY}/${GCP_PROJECT_ID}/${image3}:${TAG}"
                }
            }
        }


        stage('Deploy to Kubernetes') {
            steps {
                // Use Kubernetes credentials and apply Kubernetes YAML files
                withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBE_CONFIG')]) {
                    sh 'export KUBE_CONFIG=$KUBE_CONFIG '
                    sh 'gcloud container clusters get-credentials giit-gke-cluster --zone us-central1-a --project jagriti-411012'
                    sh 'kubectl apply -f k8s/.'
                    
                }
            }
        }
    }
}
