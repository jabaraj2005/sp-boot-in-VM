pipeline {
    agent any

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
	sh'''docker-compose down '''
	sh'''docker system prune -f'''
        sh '''docker-compose up -d --build'''
        }
    }
}


    post {
        success {
            echo "Pipeline executed successfully"
        }
        failure {
            echo "Pipeline failed"
}
}
}

