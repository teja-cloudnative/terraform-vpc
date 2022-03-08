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
         sh 'terraform plan -var-file=env-${APPLY_ENV}/main.tfvars'
       }
     }

     stage('Terraform Apply') {
       when {
         expression {
           GIT_BRANCH == "origin/main"
         }
       }
       input {
         message "Approve for Apply?"
         ok "Approve"
         submitter "admin"
       }
       steps {
         sh 'terraform apply -auto-approve -var-file=env-${APPLY_ENV}/main.tfvars'
       }
     }

    }
}
//
