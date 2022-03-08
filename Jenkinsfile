pipeline {

  agent {
    node { label 'workstation'}
  }

  parameters {
    string(name: 'APPLY_ENV', defaultValue: 'dev', description: 'On which env you want to run?')
  }
    stages {

      stage('Terraform Init') {
        steps {
        sh 'terraform init -backend-config=env-${APPLY_ENV}/backend.tfvars'
        }
      }

     stage('Terraform Plan') {
       steps {
         sh 'terraform plan -backend-config=env-${APPLY_ENV}/backend.tfvars'
       }
     }

     stage('Terraform Apply') {
       input {
         message "Approve for Apply?"
         ok "Approve"
         submitter "admin"
       }
       steps {
         sh 'terraform apply -auto-approve -backend-config=env-${APPLY_ENV}/backend.tfvars'
       }
     }

    }
}

