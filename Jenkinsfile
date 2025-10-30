pipeline {
    agent any

    // Trigger build on GitHub push (if webhook is configured)
    triggers {
        githubPush()
    }

    stages {
        stage('Git Checkout') {
            steps {
                // Checkout your repository
                git 'https://github.com/manivikram07/static-cycle-website-jenkins-docker-.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image from Dockerfile in repo
                sh 'docker build -t myimg:v1 .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Remove existing container if exists
                sh 'docker rm -f mycont01 || true'

                // Run container with port mapping
                sh 'docker run -d --name mycont01 -p 4567:80 myimg:v1'
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully. Docker container is running on port 4567."
        }
        failure {
            echo "Pipeline failed. Check logs for errors."
        }
    }
}

