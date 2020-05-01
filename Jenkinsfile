node {
        deleteDir()

        /*
        stage ('Preparation') {
            sh 'curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl'
            sh 'chmod +x ./kubectl && sudo mv kubectl /usr/local/sbin'


        }
        */
        stage ('Checkout') {
            checkout scm
        }
        
        stage ('Push to Docker hub') {

            docker.withRegistry('https://hub.docker.com', 'dockerhub') {
                def customImage = docker.build("ejirocecil/jenkinsminikube:${env.BUILD_NUMBER}")
                /* Push the container to the custom Registry */ 
                customImage.push()
            }
            echo 'Pushed to Dckerhub'
        }

        stage ('test kubectl') {
            sh "kubectl get pods --context minikube"
            echo 'Kubectl worked'
        }

    }