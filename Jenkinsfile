pipeline {
  agent any
  stages {
    stage('Build an image') {
      steps {
        script {
          dockerImage = docker.build registry + "/" + repository + ":$BUILD_NUMBER"
        }

      }
    }
    stage('Push the image') {
      steps {
        script {
          docker.withRegistry('https://' + registry, registryCredential) {
            dockerImage.push()
          }
        }

      }
    }
    stage('Remove the image') {
      steps {
        sh "docker rmi $repository:$BUILD_NUMBER"
      }
    }
  }
  environment {
    repository = 'library/dotnet-vertica-odbc'
    registryCredential = 'harbor'
    dockerImage = ''
    registry = 'dockeregistry.medeanalytics.com'
  }
}