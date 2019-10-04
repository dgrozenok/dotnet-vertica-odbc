pipeline {
  agent any
  stages {
    stage('Building an image') {
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }

      }
    }
    stage('Pushing the image') {
      steps {
        script {
          docker.withRegistry('dockeregistry.medeanalytics.com', registryCredential) {
            dockerImage.push()
          }
        }

      }
    }
    stage('Remove Unused docker image') {
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