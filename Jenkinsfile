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
              }
         }
         
       stage('Push Docker Image') {
           steps {
               echo "Pushing Docker Image"
                 }
          }
          
        stage('Deploy to Dev') {
            steps {
                echo "Deploy to Dev Environment"
                  }
            }
            
       }
   }
   
