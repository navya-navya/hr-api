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
       stage('tomcat deploy-dev') {
            steps {
               sshagent(['Keypairdecrypted']) {
                    sh "scp -o StrictHostKeyChecking=no target/hr-api.war ec2-user@172.31.11.88:/opt/tomcat9/webapps/"
                    sh "ssh ec2-user@172.31.11.88 /opt/tomcat9/bin/shutdown.sh"
                    sh "ssh ec2-user@172.31.11.88 /opt/tomcat9/bin/startup.sh"
               } 
            }
        }
    }
 
    post {
      always {
        cleanWs()
      }
    }

}
