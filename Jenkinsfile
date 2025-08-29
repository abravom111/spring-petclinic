pipeline {
    agent any
    stages {
        stage('Maven Build') {
            agent {
                docker {
                    image 'maven:3.5.0'
                    args '-v $HOME/.m2:/root/.m2 --user root'
                }
            }
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Docker Build') {
            agent any
            steps {
                script {
                    // Verificar que el archivo JAR existe
                    sh 'ls -la target/'
                    
                    // Construir imagen Docker
                    docker.build("grupo03/spring-petclinic:latest")
                }
            }
        }
        stage('Docker Push') {
            agent any
            steps {
                script {
                    // Configurar credenciales en Jenkins primero
                    withCredentials([usernamePassword(
                        credentialsId: 'docker-hub-credentials',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )]) {
                        sh """
                            docker login -u $DOCKER_USER -p $DOCKER_PASS
                            docker push grupo03/spring-petclinic:latest
                        """
                    }
                }
            }
        }
    }
}
