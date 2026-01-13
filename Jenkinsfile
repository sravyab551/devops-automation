pipeline {
    agent any
    tools{
        maven 'Maven'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sravyab551/devops-automation']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
		     steps{
				script{
			        sh 'docker build -t sravyabommadevara/devops-integration .'
			    }
		     }
		 }
		 stage('push image to Hub'){
		     steps{
		         script{
		             withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u sravyabommadevara -p ${dockerhubpwd}'
                        
                        sh 'docker push sravyabommadevara/devops-integration'
                     }
		         }
		     }
		 }
    }
}