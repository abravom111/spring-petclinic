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
        sh 'cat pom.xml'
      }
    }

    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
          args '-u root:root' // Opcional, para asegurar permisos
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t grupo03/spring‑petclinic:latest .'
      }
    }
  }
}
