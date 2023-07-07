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

        stage('AMI Build'){
           steps{
		withAWS(credentials: 'sam-jenkins-demo-credentials', region: 'us-east-1'){
				sh 'packer build aws-linux.pkr.hcl'
                }
            }
        }
        
      

    }
}
