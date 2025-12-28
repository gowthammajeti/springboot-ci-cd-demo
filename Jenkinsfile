pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Maven Project') {
            steps {
                sh './mvnw clean package -DskipTests || mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t demo-app:${BUILD_NUMBER} .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker rm -f demo-app || true'
                sh 'docker run -d -p 8081:8081 --name demo-app demo-app:${BUILD_NUMBER}'
            }
        }
    }
}
