pipeline {
    agent any

    tools {
        maven 'Maven-3.8.7'
        jdk 'JDK-21'
    }

    environment {
        APP_NAME = 'employee-management'
        DEPLOY_ENV = 'staging'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/akshuk92/employee-management.git'
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x scripts/build.sh'
                sh './scripts/build.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }

        stage('Deploy') {
            steps {
                sh 'chmod +x scripts/deploy.sh'
                sh './scripts/deploy.sh'
            }
        }

        stage('Cleanup') {
            steps {
                sh './scripts/cleanup.sh'
            }
        }
    }

    post {
        success {
            echo "Build #${env.BUILD_NUMBER} succeeded for ${APP_NAME}"
        }
        failure {
            echo "Build #${env.BUILD_NUMBER} failed. Check console output."
        }
    }
}
