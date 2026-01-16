pipeline {
    agent {
        label 'AgentA'
    }

    environment {
        IMAGE_NAME      = "springboot-ci-cd"
        CONTAINER_COUNT = 1
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Maven Build') {
            steps {
                sh '''
                    mvn -version
                    mvn clean package -DskipTests
                '''
            }
        }

        stage('Build Docker compose yaml') {
            steps {
                sh '''docker-compose up'''
            }
        }  // <-- Closing brace for Build Docker compose yaml stage

    }  // <-- Closing brace for stages block

    post {
        success {
            echo "✅ Pipeline executed successfully"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
