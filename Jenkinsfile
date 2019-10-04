pipeline {
  agent any
  stages {
    stage('Build an image') {
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }

      }
    }
    stage('Push the image') {
      steps {
        script {
          docker.withRegistry('https://dockeregistry.medeanalytics.com', registryCredential) {
            dockerImage.push()
          }
        }

      }
    }
    stage('Remove the image') {
      steps {
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
  environment {
    registry = 'library/dotnet-vertica-odbc'
    registryCredential = 'harbor'
    dockerImage = ''
  }
}