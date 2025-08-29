pipeline {
    agent any

    stages {
        stage('Maven Install') {
            steps {
                // Ejecuta Maven usando Docker manualmente
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
