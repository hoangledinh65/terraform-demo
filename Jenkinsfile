pipeline {

    agent any
    stages {
        stage ('Checking') {
        steps {
            sh 'cd ./testing/vpc/'
            sh 'terraform --version'
        }
        }
    }
}