node {
    stage('Preparation') {
        sh 'echo "Start at $(date "+%Y-%m-%d %H:%M:%S")"'
        sh 'pwd'
        git 'https://github.com/comoyi/hall.git'
    }
    stage('Build') {
        sh './gradlew build'
    }
    stage('Build docker image') {
        sh 'docker build -t comoyi/hall-eureka-server:0.0.1 hall-eureka-server'
        sh 'docker build -t comoyi/hall-admin:0.0.1 hall-admin'
    }
    stage('Test') {
        // TODO
    }
    stage('Deploy') {
        sh 'docker rm -f hall-eureka-server-1 || true'
        sh 'docker rm -f hall-eureka-server-2 || true'
        sh 'docker rm -f hall-eureka-server-3 || true'
        sh 'docker rm -f hall-admin || true'
        sh 'docker network create hall || true'
        sh 'docker run -i -t -d --name hall-eureka-server-1 --net hall --hostname hall-eureka-server-1 -p 8071:8070 -e APP_PROFILES="1" comoyi/hall-eureka-server:0.0.1'
        sh 'docker run -i -t -d --name hall-eureka-server-2 --net hall --hostname hall-eureka-server-2 -p 8072:8070 -e APP_PROFILES="2" comoyi/hall-eureka-server:0.0.1'
        sh 'docker run -i -t -d --name hall-eureka-server-3 --net hall --hostname hall-eureka-server-3 -p 8073:8070 -e APP_PROFILES="3" comoyi/hall-eureka-server:0.0.1'
        sh 'docker run -i -t -d --name hall-admin --net hall --hostname hall-admin -p 8091:8091 comoyi/hall-admin:0.0.1'
    }
    stage('Results') {
        sh 'echo "Finished at $(date "+%Y-%m-%d %H:%M:%S")"'
    }
}
