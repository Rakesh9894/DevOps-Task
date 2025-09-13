pipeline {
    agent any

    triggers {
        githubPush()   // ensures webhook trigger works
    }

    environment {
        AWS_CREDENTIALS = credentials('aws_cred')       
        DOCKER_CREDS   = credentials('rakesh9894')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Rakesh9894/DevOps-Task.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                echo "=== Building Docker Image ==="
                docker build -t rakesh9894/devops-task:latest .
                '''
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'rakesh9894',
                                                  usernameVariable: 'DOCKER_USER',
                                                  passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo "=== Logging in to DockerHub ==="
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push rakesh9894/devops-task:latest
                    '''
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                withAWS(credentials: 'aws_cred', region: 'us-east-1') {
                    sh '''
                    echo "=== Deploying to EKS ==="
                    aws eks update-kubeconfig --region us-east-1 --name my-eks-cluster
                    kubectl apply -f k8s/
                    '''
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline finished at: $(date)"
        }
        success {
            echo "✅ Deployment successful!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs."
        }
    }
}
