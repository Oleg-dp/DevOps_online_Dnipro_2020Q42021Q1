pipeline {
    agent any
    stages {
        stage('Build Petclinic') {
            steps {
                echo 'Running build automation'
                sh './mvnw package'
                archiveArtifacts artifacts: 'target/*.jar'
            }
        }
    
        stage('Build Docker Image') {
            steps {
                script {
                    app = docker.build("olegdp/my-test-petclinic")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'jenkins-dockerhub-olegdp') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
        stage('Deploy docker container to Prod') {
            steps {
                sh 'ansible-playbook /var/lib/jenkins/.ansible/docker-petclinic.yml -i /var/lib/jenkins/.ansible/hosts'
            }
        }
    }
}
