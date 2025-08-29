pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
        sh 'ls -la'  // Verifica que pom.xml esté presente
      }
    }

    stage('Maven Install') {
      steps {
        script {
          docker.image('maven:3.5.0').inside('-u root:root') {
            sh 'mvn clean install'
          }
        }
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t grupo03/spring-petclinic:latest .'
      }
    }
  }
}
