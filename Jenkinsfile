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
                git branch:'master', url:'https://github.com/kush123445/jenkins-private.git'

 kushalxenon/jenkins-demo

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
              sh "docker run -d ${registry}" + ":$BUILD_NUMBER" 
    }
}
        }
    }
}
