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
          docker.withRegistry(registry, registryCredential) {
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
    registry = 'htts://dockeregistry.medeanalytics.com'
    registryCredentials = 'harbor'
    repository = 'mede_create/dotnet-vertica-odbc'
    dockerImage = ''
  }
}