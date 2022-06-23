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
	  
     stage('Check') {
		steps{
		sh 'echo "Hello"'
		}	
	} 	
	  
	  stage('Read Variable'){
      steps {
        script {
          try {
            variable = params.YOUR_VARIABLE
          }
          catch (Exception e) {
            echo("Could not read variable from parameters, assuming this is the first run of the pipeline. Exception: ${e}")
            variable = ""
          }
        }
      }

    }
    stage('Save Variable for next run'){
      steps {
        script {
          properties([
            parameters([
              string(defaultValue: "${variable}", description: 'Variable description', name: 'YOUR_VARIABLE', trim: true)
            ])
          ])
        }
      }
    }
	  
    /*stage('Building image for front end') {
		steps{
			script{
				sh 'docker build -f Dockerfile -t $registry/apm .'
				//sh 'docker build -f Dockerfile1 -t $registry/apm1 .'
			}
		}
	}
		
	stage('Registring image for front end') {
		steps{
			script{
				docker.withRegistry('',registryCredential){
				sh 'docker push $registry/apm'
				//sh 'docker push $registry/apm1'					
				}
			}
		}
	}	*/

  
  
  }
}
