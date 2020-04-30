node {
        deleteDir()
        
        stage ('Checkout') {
            checkout scm
        }
        /*
        stage ('Push to Docker hub') {

            docker.withRegistry('https://hub.docker.com', 'dockerhub') {
                def customImage = docker.build("ejirocecil/jenkinsminikube:${env.BUILD_NUMBER}")
                /* Push the container to the custom Registry 
                customImage.push()
            }
            echo 'Pushed to Dckerhub'
        }*/

        stage ('test kubectl') {
            sh "kubectl get pods --context minikube"
        }

    }