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
    registry = 'docker_hub_account/repository_name'
    registryCredential = 'dockerhub'
  }
}