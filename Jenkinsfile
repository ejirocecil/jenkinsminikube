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

            docker.withRegistry('', 'dockerhub') {
                def customImage = docker.build("ejirocecil/jenkinsminikube:${env.BUILD_NUMBER}")
                /* Push the container to the custom Registry */ 
                customImage.push()
            }
            echo 'Pushed to Dockerhub'
        }

        stage ('test kubectl') {
            sh("sed -i.bak 's|ejirocecil/jenkinsminikube:latest|ejirocecil/jenkinsminikube:${env.BUILD_NUMBER}|' ./kubernetes/app.yaml")
            script {
                kubernetesDeploy(configs: "kubernetes/app.yaml", kubeconfigId: "mykubeconfig")
            }
            echo 'Kubectl worked'
        }

    }