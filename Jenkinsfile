def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
    
]
pipeline {
    agent any

    stages {
        stage('1.GitClone') {
            steps {
                
                echo 'Hello World'
                git branch: 'main', url: 'https://github.com/iAmTopeTemi/airbnb-infra.git'
                sh 'ls'
            }
        }
        
        stage('2.Terraform check') {
            steps {
                echo 'verify if Terraform is installed'
                sh 'terraform --version'
            }
        }
        
        stage('3.Terraform init') {
            steps {
                echo 'terraform init'
                sh 'terraform init'
            }
        }
        
        stage('4.Terraform plan') {
            steps {
                echo 'terraform plan'
                sh 'terraform plan'
            }
        }
        
        stage('5.checkov') {
            steps {
                echo 'start code quality'
                sh """
                sudo pip3 install checkov
                checkov -d . --skip-check CKV_AWS_79,CKV_AWS_135,CKV2_AWS_41
                """
            }
        }

    
        stage('6.Mannual Approval') {
            steps {
                input 'Approval required for deployment'
            }
        }

        
        stage('7.Terraform apply') {
            steps {
                echo 'terraform apply'
                sh 'sudo terraform apply --auto-approve'
            }
        }
    }
    
    post {
        always {
            echo 'I will always say Hello again!'
            slackSend channel: 'jenkins', color: COLOR_MAP[currentBuild.currentResult], message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} ${env.BUILD_NUMBER} \n more info at: ${env.BUILD_URL}"
        }
    }
}
