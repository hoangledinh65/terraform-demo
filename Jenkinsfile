pipeline {

    agent any
    tools {
          terraform 'my-terraform'
    }
    stages {
        stage ('Checking') {
        steps {
            sh 'cd ./testing/vpc/'v
            sh 'terraform --version'
        }
        }
    }
}