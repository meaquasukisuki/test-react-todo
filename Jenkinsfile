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
  agent any
  stages {
    stage('Building our image') {
      steps{
        echo 'Building....'
      }
    }
    stage('Deploy our image') {
      steps{
        echo 'Deploying....'
      }
    }
    stage('Cleaning up') {
      steps{
        echo 'finishing....'
      }
    }
  }
}