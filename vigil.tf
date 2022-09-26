pipeline {
    agent any
    tools {
  terraform 'terraform-1.3.0'
}
    stages{
        stage('checkout') {
        steps{
            git branch: 'pro', url: 'https://github.com/pravansai/pro.git'
        }
    }
    stage ("terraform init") {
        steps {
           sh label: '', script: 'terraform init'
        }
    }
     stage("terraform action") {
        steps {
            echo "terraform action is --> ${action}"
            sh ('terraform ${action} --auto-approve')
        }
    }
    
    }
}
