pipeline {
  agent any
  tools {
    maven 'MAVEN_HOME-3.6.3'
  }
  environment{
	registry="mrchelsea"
	registryCredential='dockerhub'
	dockerImage=''
	}
  
  stages{
    
  stage('Git') {
		steps{
		git 'https://github.com/rahulguptaft9/APM'
		}	
	}  
  stage("Build") {
      steps {
        sh "mvn clean"
        sh "mvn install"
        sh "mvn package"
        }
    }
	  
    stage('Building image for front end') {
		steps{
			script{
				sh 'docker build -f Dockerfile -t $registry/apm .'
			}
		}
	}
		
	stage('Registring image for front end') {
		steps{
			script{
				docker.withRegistry('',registryCredential){
				sh 'docker push $registry/apm'                    
				}
			}
		}
	}	

  
  
  }
}
