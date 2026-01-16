pipeline {
    agent any

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

        stage('Build Docker compose yaml'){
        steps{
	sh'''sudo apt update $$ sudo apt install docker-compose'''
        sh '''docker-compose up'''
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

