node {
        deleteDir()
        
        stage ('Checkout') {
            checkout scm
        }
        
        stage ('Push to Docker hub') {

            docker.withRegistry('https://hub.docker.com', 'dockerhub') {
                sh 'docker build -t ejirocecil/jenkinsminikube:${env.BUILD_NUMBER}'
                /* Push the container to the custom Registry */
                
            }
            echo 'Pushed to Dockerhub'
        }

    }