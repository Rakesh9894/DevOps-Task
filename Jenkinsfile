pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Rakesh9894/DevOps-Task.git'
            }
        }

      
        
        stage('Build') {
            steps {
                echo "✅ Code pulled and build stage running"
            }
        }
    }
}
