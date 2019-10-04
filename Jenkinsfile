pipeline {
  agent any
  stages {
    stage('Build an image') {
      steps {
        script {
          dockerImage = docker.build repository
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
        sh "docker rmi $repository"
      }
    }
  }
  environment {
    repository = 'mede_create/dotnet-vertica-odbc'
    registryCredential = 'harbor'
    dockerImage = ''
    registry = 'dockeregistry.medeanalytics.com'
  }
}