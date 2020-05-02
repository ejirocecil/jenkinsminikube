def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
  containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.18.2', command: 'cat', ttyEnabled: true)
],
volumes: [
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
]) {
  node(label) {
    
    stage ('Checkout') {
            checkout scm
        }

    
    stage('Create Docker images') {
      container('docker') {
        withCredentials([[$class: 'UsernamePasswordMultiBinding',
          credentialsId: 'dockerhub',
          usernameVariable: 'DOCKER_HUB_USER',
          passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
          sh """
            echo "${DOCKER_HUB_PASSWORD}" | docker login -u ${DOCKER_HUB_USER} --password-stdin
            docker build -t ejirocecil/jenkinsminikube:${env.BUILD_NUMBER} .
            docker push ejirocecil/jenkinsminikube:${env.BUILD_NUMBER}
            """
        }
      }
    }
    stage('Run kubectl') {  
      container('kubectl') {
        sh("sed -i.bak 's|ejirocecil/jenkinsminikube:latest|ejirocecil/jenkinsminikube:${env.BUILD_NUMBER}|' ./kubernetes/app.yaml")
        sh "kubectl replace -f kubernetes/app.yaml"  
        sh "kubectl describe deployments jenkinsminikube-app"   
      }
    }
    
  }
}

