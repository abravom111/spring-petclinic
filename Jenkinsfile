pipeline {
    // This defines the pipeline itself
    agent none 

    stages {
        // This is the "build" stage
        stage('Maven Install') {
            // Specifies that this stage will run inside a Maven Docker container
            agent {
                docker {
                    image 'maven:3.5.0'
                }
            }
            steps {
                // Executes the 'mvn clean install' command
                sh 'mvn clean install'
            }
        }

        // This is the "packaging" stage
        stage('Docker Build') {
            // The 'agent any' means this stage can run on any available Jenkins agent
            agent any
            steps {
                // Builds a Docker image using the Dockerfile in the current directory
                sh 'docker build -t grupoxx/spring-petclinic:latest .'
            }
        }
    }
}
