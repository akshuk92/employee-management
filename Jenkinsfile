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
                git branch: 'main',
                    url: 'https://github.com/akshuk92/employee-management.git'
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

        stage('Docker Build') {
            steps {
                sh 'docker build -t employee-management-app:${BUILD_NUMBER} .'
                sh 'docker tag employee-management-app:${BUILD_NUMBER} employee-management-app:latest'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f employee-management-app || true

                    docker run -d \
                      --name employee-management-app \
                      --network employee-management_emp-network \
                      -p 8081:8080 \
                      -e DB_HOST=employee-management-db \
                      -e DB_PORT=3306 \
                      employee-management-app:${BUILD_NUMBER}
                '''
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
