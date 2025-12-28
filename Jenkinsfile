pipeline {
    agent any

    environment {
        DOCKER_BIN = "/usr/local/bin/docker"
        DOCKER_CONFIG = "${WORKSPACE}/.docker"
    }

    stages {

        stage('Build Maven Project') {
            steps {
                sh './mvnw clean package -DskipTests || mvn clean package -DskipTests'
            }
        }

        stage('Prepare Docker Config') {
            steps {
                sh 'mkdir -p .docker'
                sh 'echo "{}" > .docker/config.json'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '${DOCKER_BIN} build -t demo-app:${BUILD_NUMBER} .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '${DOCKER_BIN} rm -f demo-app || true'
                sh '${DOCKER_BIN} run -d -p 8081:8081 --name demo-app demo-app:${BUILD_NUMBER}'
            }
        }
    }
}
