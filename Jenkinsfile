pipeline {

    agent any
    tools {
          terraform 'my-terraform'
    }
    stages {
        stage ('Checking') {
        steps {
            sh 'cd ./testing/vpc/'
            sh 'terraform --version'
        }
        }
    }
}