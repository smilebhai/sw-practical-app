
// STATUS - INCOMPLETE
pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = "smilebhai/node"
    }
    stages {
    /* Testing in progress
        stage('Build') {
            steps {
                echo 'Running build automation'
            }
        }
        stage('Build Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                    app = docker.build(DOCKER_IMAGE_NAME)
                    app.inside {
                        sh 'echo Hello, World!'
                    }
                }
            }
        }
        stage('Push Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    */
        stage('DeployToProduction') {
            when {
                branch 'master'
            }
            steps {
                // input 'Deploy to Production?'
                milestone(1)
                kubernetesDeploy(
                    kubeconfigId: 'kubeconfig',
                    configs: 'k8s/sw-practical-kube.yml',
                    enableConfigSubstitution: true
                )
            }
        }
    }
}
