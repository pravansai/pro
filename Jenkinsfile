pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                git 'https://github.com/pravansai/pro.git'
            }
        }
    }
    stages {
        stage('Copy') {
            steps {
                bat 'sh copy.sh'
            }
        }
    }
}
