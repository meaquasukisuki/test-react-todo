pipeline {
  environment {
    registry = "meameasuki/test-react-todo-frontend"
    registryCredential = 'docker'
    dockerImage = ''
  }
  agent any
  stages {
    stage('docker build') {
      steps{
        sh "docker version"
        // script {
        //   TODO_IMAGE_BUILD = sh (
        //     script: 'docker build -t meameasuki/test-react-todo-frontend:1.0 .',
        //     returnStdout: true
        //   ).trim()
        //   echo "docker build res: ${TODO_IMAGE_BUILD}"
        // }
      }
    }
    // stage('Deploy our image') {
    //   steps{
    //     echo 'Deploying....'
    //   }
    // }
    // stage('Cleaning up') {
    //   steps{
    //     echo 'finishing....'
    //   }
    // }
  }
}