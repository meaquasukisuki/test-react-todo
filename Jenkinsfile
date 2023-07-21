// pipeline {
//     agent any

//     stages {
//         stage('Build image') {
//             steps {
              
              
//             }
//         }
//         stage('Test') {
//             steps {
//                 echo 'Testing..'
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 echo 'Deploying....'
//             }
//         }
//     }
// }


pipeline {
  environment {
    registry = "meameasuki/test-react-todo-frontend"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent {
    dockerfile true
  }
  stages {
    stage('docker build') {
      steps{
        script {
          TODO_IMAGE_BUILD = sh (
            script: 'sudo docker build -t meameasuki/test-react-todo-frontend:1.0 .',
            returnStdout: true
          ).trim()
          echo "docker build res: ${TODO_IMAGE_BUILD}"
        }
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