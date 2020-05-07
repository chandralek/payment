pipeline {

  agent {
    label 'SLAVE'
  }

  environment {
    NEXUS=credentials('Nexus')
    MAJOR_VERSION="1.0"
  }
  stages {


    stage('Create Archive to Upload') {
      steps {
        sh '''
          tar -czf payment-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz payment.ini payment.py rabbitmq.py requirements.txt 
        '''
      }
    }

    stage('Upload To Nexus') {
      steps {
        sh '''
          curl -f -v -u $NEXUS --upload-file payment-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz https://nexus.devopsb46.online/repository/payment-service/payment-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz
        '''
      }
    }

  }
}