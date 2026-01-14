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

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                    docker rm -f ${IMAGE_NAME}_1 2>/dev/null || true

                    docker run -d \
                      --name ${IMAGE_NAME}_1 \
                      -p 9090:9090 \
                      ${IMAGE_NAME}:${BUILD_NUMBER}
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline executed successfully"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}


