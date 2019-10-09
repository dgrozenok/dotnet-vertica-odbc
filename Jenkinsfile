pipeline {
  environment {
    registry = 'https://dockeregistry.medeanalytics.com'
    registryCredentials = 'harbor'
    repository = 'mede_create/dotnet-vertica-odbc'
    dockerImage = ''
  }
  agent { label 'linux_docker' }
  stages {
    stage('Build an image') {
      steps {
        script {
          echo BRANCH_NAME
          echo BUILD_NUMBER
          dockerImage = docker.build repository
        }
      }
    }
    stage('Push the image') {
      steps {
        script {
          docker.withRegistry(registry, registryCredentials) {
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
}
