#!/usr/bin/env groovy

node {
        deleteDir()
        
        stage ('Checkout') {
            checkout scm
        }
        
        stage ('Push to Docker hub') {

            sh "docker login -u ejirocecil -p MotifXF8"
            sh "docker build -t ejirocecil/jenkinsminikube:${env.BUILD_NUMBER} ."   

            /*docker.withRegistry('https://hub.docker.com', 'dockerhub') {
                sh 'docker build -t ejirocecil/jenkinsminikube:${env.BUILD_NUMBER}'
                  Push the container to the custom Registry 
                
            }*/
            echo 'Pushed to Dockerhub'
        }

    }