pipeline {
  agent any
  stages {
    stage('Building an image') {
      steps {
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }

      }
    }
    stage('Push the image') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push()
          }
        }

      }
    }
  }
  environment {
    registry = 'dgrozenok/dotnet-vertica-odbc'
    registryCredential = 'dockerhub'
  }
}