pipeline{
    agent any
    environment{
        DOCKER_IMAGE= 'avejlanjekar45/jenkins-docker-pipeline'
        DOCKER_REGISTRY= 'https://registry.hub.docker.com'
        DOCKER_CREDENTIALS= 'dockerhub-credentials'
    }
    stages{
        stage ("checkout"){
            steps{
                checkout scm
            }
        }
        stage('Build Docker image'){
            steps{
                script{
                    def app= docker.build("${DOCKER_IMAGE}:${GIT_COMMIT}")
                    docker.withRegistry(
                        "${DOCKER_REGISTRY}",
                        "${DOCKER_CREDENTIALS}"
                    )
                    {
                        app.push()
                    }
                }
            }
        }
    }
}