pipeline { 
    environment { 
        registry = "kushal321/jenkins-demo" 
        registryCredential = 'dockerhub_id' 
        dockerImage = '' 
    }
    agent {
        label "l2"
    }
    stages { 
        stage('Cloning from GitHub') { 
            steps { 
                git branch:'main', url:'https://github.com/kush123445/jenkins-private.git'
             }
        } 
        stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Deploying image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        }

        stage('Running Container') {
          steps {
            script {
              sh "docker run -d ${registry} -p 3002:80" + ":$BUILD_NUMBER" 
    }
}
        }
    }
}
