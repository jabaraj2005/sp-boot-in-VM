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
	stage('Docker push'){
	steps{
	script{
withDockerRegistry(credentialsId: '82de6167-2da8-4fe2-b2b5-60f390be3a1b', url: 'https://index.docker.io/v1/') {
	sh ''' docker push jabaraj2005/jenkins '''
    
}
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

