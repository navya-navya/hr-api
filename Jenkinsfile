pipeline {
    agent any

    stages {
        stage('git-checkout') {
            steps {
              git branch: 'main', credentialsId: 'creds', url: 'https://github.com/navya-navya/hr-api'
            }
        }
        stage('maven build') {
            steps {
             sh 'mvn clean package'
            }
        }
        stage('tomcat build') {
            steps {
             sshagent(['Keypairdecrypted']) {
                 sh "scp -o StrictHostKeyChecking=no target/hr-api.war ec2-user@172.31.11.88:/opt/tomcat9/webapps/"
                    sh "ssh ec2-user@172.31.11.88 /opt/tomcat9/bin/shutdown.sh"
                    sh "ssh ec2-user@172.31.11.88 /opt/tomcat9/bin/startup.sh"
            }
            }
        }
    }
}
