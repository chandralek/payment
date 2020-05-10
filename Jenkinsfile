pipeline {
  agent {
    label 'SLAVE'
  }
  environment{
    NEXUS=credentials('Nexus')
    MAJOR_VERSION="1.0"
  }
  stages {
    stage('Create the archive file') {
      steps {
        sh '''
      tar -cvf payment-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz payment.ini payment.py rabbitmq.py requirements.txt
      '''
      }
    }
    stage('Upload to Nexus'){
      steps{
        sh '''
     curl -f -v -u $NEXUS --upload-file payment-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz https://nexus.devops46.online/repository/payment-service/payment-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz
        '''
      }
    }
  }
}