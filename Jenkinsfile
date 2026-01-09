pipeline {
    agent any

    tools {
        maven 'Maven-3.9.6'
    }

    environment {
        IMAGE_NAME      = "springboot-ci-cd"
        CONTAINER_COUNT = 100
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
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME%:%BUILD_NUMBER% ."
            }
        }

        stage('Deploy Multiple Containers') {
            steps {
                bat """
                FOR /L %%i IN (1,1,%CONTAINER_COUNT%) DO (
                  docker rm -f %IMAGE_NAME%_%%i 2>nul
                  docker run -d --name %IMAGE_NAME%_%%i -p 800%i:9090 %IMAGE_NAME%:%BUILD_NUMBER%
                )
                """
            }
        }
    }

    post {
        success {
            echo "✅ Local Docker build & deployment successful"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
