pipeline {
  environment {
    registry = "meameasuki/test-react-todo-frontend"
    registryCredential = 'docker'
    dockerImage = ''
    DOCKERHUB_CREDS = credentials('docker')
  }

  agent any
  stages {
    stage('clone git') {
      when {
        branch 'develop'
      }
      steps {
        checkout scm
      }
    }
    stage('docker build') {
      when {
        branch 'develop'
      }
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER" 
        }
      }
    }
    stage('Push Image to DockerHub') { 
      when {
        branch 'develop'
      }
      steps { 
        script {
          docker.withRegistry('https://index.docker.io/v1/', registryCredential) {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy image to ec2') {
      when {
        branch 'develop'
      }
      steps {
        script {
          echo "deploy !"
          // need to add A4L ssh credentials in jenkins env
          // replace your-ec2-address with real one.

          // In the sshagent(['AWS EC2 Key Pair']) line, 
          // 'AWS EC2 Key Pair' should be replaced with the ID of the SSH credentials you've stored in Jenkins for your AWS EC2 instance. 
          // This is not the name of the key pair file (.pem file) you downloaded from AWS when you created your EC2 instance, 
          // but the ID of the credentials you've added to Jenkins.
          // sshagent(['AWS EC2 Key Pair']) {
          //     sh "scp ./deploy.sh ec2-user@your-ec2-address:/home/ec2-user/deploy.sh"
          //     sh 'ssh ec2-user@your-ec2-address "chmod +x /home/ec2-user/deploy.sh && /home/ec2-user/deploy.sh"'
          // }    
        }
      }
    }
    stage('Cleaning up') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER" 
      }
    }
  }
}