pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verificar archivos') {
            steps {
                sh 'ls -la'
                sh 'cat pom.xml || echo "pom.xml no encontrado"'
            }
        }

        stage('Maven Install') {
            steps {
                sh 'docker run --rm -v $PWD:/app -w /app maven:3.5.0 mvn clean install'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t grupo03/spring-petclinic:latest .'
            }
        }
    }
}
