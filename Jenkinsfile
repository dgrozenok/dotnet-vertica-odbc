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
  }
  environment {
    registry = 'dgrozenok/dotnet-vertica-odbc'
    registryCredential = 'dockerhub'
  }
}