pipeline{
      environment {
            registry = "pranab1/spring9-petclinic9"
            registrycredential= 'docker_hub_pranab1'
            dockerImage = ''
      }
      agent any
   stages{
      stage('Build'){
         steps{
             echo "Building Project"
             sh './mvnw package'  
         }
     } 
        
       stage('Archive') {
          steps{
             echo "Archiving Project"
             archiveArtifacts artifacts: '**/*.jar', followSymlinks: false   
             }
         }
         
       stage('Build Docker Image') {
          steps{
              echo "Building Docker Image"
                script {
                   dockerImage= docker.build registry + ":$BUILD_NUMBER"   
                }
              }
         }
         
       stage('Push Docker Image') {
           steps {
               echo "Pushing Docker Image"
                script{
                       docker.withRegistry('',registrycredential) {
                                  dockerImage.push()
                                  dockerImage.push('latest')
                 }
                         
                  } 
                 
                 }
          }
          
        stage('Deploy to Dev') {
            steps {
                echo "Deploy to Dev Environment"
                 sh "docker rm -f spring9-petclinic9 || true"
                 sh "docker run -d --name=spring9-petclinic9 -p 8082:8080 pranab1/spring9-petclinic9"
                  
                  }
            }        
            
       }
   }
   
