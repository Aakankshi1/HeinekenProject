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
                sshagent(['aws_docker']) {
                    withCredentials([string(credentialsId: 'Docker-hub', variable: 'dockerhubPwd')]) {
                        sh "ssh -vvv -o StrictHostKeyChecking=no dockeradmin@3.21.127.6 docker login -u aakankshi -p ${dockerhubPwd} ${DOCKERHUB_URL}"
                    }
                    // Remove existing container, if container name does not exists still proceed with the build
                    sh script: "ssh -vvv -o StrictHostKeyChecking=no dockeradmin@3.21.127.6 docker rm -f staticapp",  returnStatus: true
                    
                    sh "ssh -vvv -o StrictHostKeyChecking=no dockeradmin@3.21.127.6 docker run -p 9090:80 -p 9091:443 -d --name staticapp ${IMAGE_TAG}"
                }
            }
        }
    }
}

def getDockerTag(){
    def tag  = sh script: 'date +%F', returnStdout: true
    return tag
}