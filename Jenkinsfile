pipeline {
    agent any
    stages {
        stage('Maven Build') {
            agent {
                docker {
                    image 'maven:3.5.0'
                    args '-v $HOME/.m2:/root/.m2'  // Cache para Maven
                }
            }
            steps {
                sh 'mvn clean package -DskipTests'
                // Guardar el artefacto para el siguiente stage
                stash name: 'target-files', includes: 'target/*.jar'
            }
        }
        stage('Docker Build') {
            agent any
            steps {
                // Recuperar los archivos compilados
                unstash 'target-files'
                
                script {
                    // Verificar que el JAR existe antes de construir
                    sh 'ls -la target/'
                    docker.build("grupo03/spring-petclinic:latest")
                }
            }
        }
        stage('Docker Push') {
            agent any
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image("grupo03/spring-petclinic:latest").push()
                    }
                }
            }
        }
    }
}
