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
            sh '/usr/local/bin/docker build -t demo-app:${BUILD_NUMBER} .'
          }
        }

        stage('Run Docker Container') {
          steps {
            sh '/usr/local/bin/docker rm -f demo-app || true'
            sh '/usr/local/bin/docker run -d -p 8081:8081 --name demo-app demo-app:${BUILD_NUMBER}'
          }
        }
    }

}
