pipeline{
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage('pull src'){
            steps{
                git branch: 'main', url: 'https://github.com/maheshgowdamg/springboot-docker-jenkins.git'
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('remove conatiner'){
            steps{
                sh 'docker rm -f $(docker ps -a -q)'
                sh 'docker container prune -f'
            }
        }
        stage('remove images'){
            steps{
                sh 'docker rmi -f $(docker images -q)'
            
            }
        }
        stage('build image'){
            steps{
                sh 'docker build -t spring .'
            }
        }
        stage('tag image'){
            steps{
                sh 'docker tag spring maheshgowdamg25/spring:latest'
            }
        }
        stage('push to dockerhub'){
            steps{
                sh 'echo "Mahi@2001"|docker login -u maheshgowdamg25 --password-stdin'
                sh 'docker push maheshgowdamg25/spring:latest'
            }
        }
        stage('run container'){
            steps{
                sh 'docker run -d -p 8081:8081 maheshgowdamg25/spring:latest'
            }
        }
       
        
    }
}
