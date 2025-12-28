pipeline {
    agent any

    environment {
         DOCKER_HOST = "unix:///Users/gowthammajeti/.docker/run/docker.sock"
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

        stage('Docker Debug') {
          steps {
            sh 'whoami'
            sh 'echo $DOCKER_HOST'
            sh 'docker ps'
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
