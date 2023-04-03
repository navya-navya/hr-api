pipeline {
    agent any
    stages {   
         stage('Git Checkout') {
             
             when{
                expression{
                    params.branchName == "main"
                }
            }
            steps {
                 git branch:"${params.branchname}" , credentialsId: 'github-tokens', url: 'https://github.com/javahometech/hr-api'
            }
        }
        stage('maven build') {
            
             when{
                expression{
                    params.branchName == "main"
                }
            }
            steps {
                sh 'mvn clean package'
            }
        }
       
    }
 
    post {
      always {
        cleanWs()
      }
    }

}
