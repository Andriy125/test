
pipeline {
    agent any

    tools {
        terraform 'terraform'
    }

    parameters {
        choice(
            choices: ['plan', 'apply', 'destroy'],
            description: 'Run plan / apply / destroy',
            name: 'ACTION'
        )
    }

    stages {
        stage('Infrastructure Init') {
            steps {
                withAWS(credentials: 'aws-credentials', region: 'eu-west-2') {
                    sh 'terraform init'
                    
                }
            }
        }

        stage('Infrastructure Plan') {
            when {
                environment name: 'ACTION', value: 'plan';
            }
            steps {
                withAWS(credentials: 'aws-credentials', region: 'eu-west-2') {
                sh 'terraform plan'
                }
            }
        }

        stage('Infrastructure Apply') {
            when {
                environment name: 'ACTION', value: 'apply';
            }
            steps {
                withAWS(credentials: 'aws-credentials', region: 'eu-west-2') {
                        sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Infrastructure Destroy') {
            when {
                environment name: 'ACTION', value: 'destroy';
            }
            steps {
                withAWS(credentials: 'aws-credentials', region: 'eu-west-2') {
                        sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
}