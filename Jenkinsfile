pipeline {
    
    agent any 
    
    
    stages {
        
        stage('Packer Installation'){
           steps {
			  sh '''sudo yum install -y yum-utils
			  sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
			  sudo yum -y install packer
			  packer version'''
           }
        }

        stage('packer init'){
            steps{
                script{
				sh 'packer init .'
                }
            }
        }

        stage('Push the artifacts'){
           steps{
                script{
				sh 'echo "hello world 1"'
                }
            }
        }
        
      

    }
}