pipeline {
    agent any
    options { timestamps () }
    environment{
        DOCKER_TAG = getDockerTag()
        IMAGE_TAG = "aakankshi/hnproject:${DOCKER_TAG}"
        IMAGE_URL_WITH_TAG = "https://index.docker.io/v1/aakankshi/hnproject:${DOCKER_TAG}"
        DOCKERHUB_URL = "https://index.docker.io/v1/"
    }
    stages{
        stage('Build Docker Image'){
            steps{
                sh "docker build . -t ${IMAGE_TAG}"
            }
        }
        stage('DockerHub Push'){
            steps{
                withCredentials([string(credentialsId: 'Docker-hub', variable: 'dockerhubPwd')]) {
                    sh "docker login -u aakankshi -p ${dockerhubPwd} ${DOCKERHUB_URL}"
                    sh "docker push ${IMAGE_TAG}"
                }
            }
        }
        stage('Docker Deploy Dev'){ 
            steps{
                sshagent(['ubuntu_aws_key']) {
                    withCredentials([string(credentialsId: 'Docker-hub', variable: 'dockerhubPwd')]) {
                        sh "ssh -vvv -o StrictHostKeyChecking=no ubuntu@3.21.127.6 docker login -u aakankshi -p ${dockerhubPwd} ${DOCKERHUB_URL}"
                    }
                    // Remove existing container, if container name does not exists still proceed with the build
                    sh script: "ssh -vvv -o StrictHostKeyChecking=no ubuntu@3.21.127.6 docker rm -f staticapp",  returnStatus: true
                    
                    sh "ssh -vvv -o StrictHostKeyChecking=no ubuntu@3.21.127.6 docker run -p 9090:80 -p 9091:443 -d --name staticapp ${IMAGE_TAG}"
                }
            }
        }
    }
    // stages {
    //     stage('k8_deploy') {
    //         steps {
    //             sshagent(['ubuntu_aws']) {
    //                 sh "scp -vvv -o StrictHostKeyChecking=no services.yml static-app-pod.yml ubuntu@3.21.127.6:/home/ubuntu/"
    //                 script{
    //                     try{
    //                         sh "ssh ubuntu@3.21.127.6 kubectl apply -f ."
    //                     }
    //                     catch(error){
    //                         sh "ssh ubuntu@3.21.127.6 kubectl create -f ."
    //                     }
    //                 }
    //             }
    //         }
    //     }
    // }
}

def getDockerTag(){
    def tag  = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}