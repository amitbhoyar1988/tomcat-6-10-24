pipeline {
    agent any

    stages {
        stage('GIT CLONE') {
            steps {
                git branch: 'main', url: 'https://github.com/amitbhoyar1988/tomcat-6-10-24.git'
            }
        }
        stage('BUILD MAVEN CODE') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('CREATE DOCKER IMAGE') {
            steps {
                sh 'docker build -t abhoyar9/22-10-24:${BUILD_NUMBER} .'
                sh 'docker tag abhoyar9/22-10-24:${BUILD_NUMBER} abhoyar9/22-10-24:latest'
            }
        }
        stage('Docker Login') {
            steps {
                sh 'echo Amit@1988 | docker login -u abhoyar9 --password-stdin'
                
            }
        }
        stage('Docker PUSH') {
            steps {
                sh 'docker push abhoyar9/22-10-24:${BUILD_NUMBER}'
                sh 'docker push abhoyar9/22-10-24:latest'
            }
        }
        stage('Docker Image Cleaning in Jenkins') {
            steps {
                sh 'docker image prune -a -f'
              
            }
        }
        stage('Docker Container RUN ') {
            steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'Docker', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'sudo sh /root/script/1.sh', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
    }
}
