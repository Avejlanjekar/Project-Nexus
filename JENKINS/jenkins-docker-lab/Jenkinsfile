pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
                checkout scm
            }
        }

        stage ('Docker build'){
            steps{
                sh "docker build -t docker-jenkins-lab ."
            }
        }

        stage ('Docker Tag'){
            steps{
                sh "docker tag docker-jenkins-lab avejlanjekar45/jenkins-docker-lab"
            }
        }

        stage ('Docker login'){
            steps{
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ])
                {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                }
            }
        }

        stage ('docker push'){
            steps{
                sh 'docker push avejlanjekar45/jenkins-docker-lab'
            }
        }
    }
}